import React, { useEffect, useMemo, useState } from "react";
import { del, get, patch } from "../../../lib/http";
import Icon from "../../../bundles/Icon";
import './comments.scss'
import InfiniteScroll from "react-infinite-scroll-component";
import Loading from "../../../bundles/Loading";
import { navigate } from "@reach/router";
import FormComment from "./FormComment";
import ContainerSubComments from "./ContainerSubComments";
import Confirm from "../../../bundles/Confirm";

const Comments = ( { currentUser, productId}) => {
  const [loading, setLoading] = useState(true);
  const [comments, setComments] = useState([]);
  const [deletedComment, setDeletedComment] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [page, setPage ] = useState(1);
  const [editingComment, setEditingComment] = useState(null);
  const [hasMore, setHasMore] = useState(true);

  useEffect(() => {
    const params = {page: 1}
    get(`products/${productId}/comments`, params)
      .then((data) => setComments(data))
      .finally(() => setLoading(false))
  }, [productId])


  const handleLikeComment = (comment) => {
    if (isUnauthorized) return navigate('login');

    const params = {user_id: currentUser.id}
    patch(`products/${productId}/comments/${comment.id}/toggle_like`, params).then((data) => {
      updateCommentLike(data)
    })
  }

  const handleActionYes = () => {
    del(`products/${productId}/comments/${deletedComment.id}`).then(() => {
      removeComment();
      setDeletedComment(null);
      setIsOpenConfirm(false);
    })
  }


  const fetchMoreComments = async () => {
    const currentPage = page + 1;
    setPage(currentPage);
    const params = { page: currentPage }
    get(`products/${productId}/comments`, params).then((newComments) => {
      setComments((prevComments) => [...prevComments, ...newComments ])

      newComments.length > 0 ? setHasMore(true) : setHasMore(false);
    }).catch((error) => console.error('Error fetching more messages:', error));
  };

  const updateCommentLike = (newComment) => {
    setComments((prevComments) =>
      prevComments.map((comment) =>
        comment.id === newComment.id ? {...comment, likes: newComment.likes } : comment
      )
    )
  }

  const removeComment = () => {
    setComments(prevComments => prevComments.filter(comment => comment.id !== deletedComment.id));
  }
  const updateComment = (newComment) => {
    setComments((prevComments) =>
      prevComments.map((comment) =>
        comment.id === newComment.id ? {...comment, text: newComment.text, rating: newComment?.rating } : comment
      )
    )
  }

  const createComment = (newComment) => {
    setComments((prevComments) => [newComment, ...prevComments])
  }

  const actionSubmitComment = ({ data, type }) => {
    setEditingComment(null);

    type === 'create' ? createComment(data) : updateComment(data)
  }

  const actionOpenConfirm = (comment) => {
    setDeletedComment(comment)
    setIsOpenConfirm(true)
  }

  const handleActionNo = () => {
    setDeletedComment(null);
    setIsOpenConfirm(false);
  }

  const isUnauthorized = useMemo(() => {
    return currentUser === null
  }, [currentUser]);

  const rootComments = useMemo(() => {
    return comments.filter((comment) => comment.parentId === null)
  }, [comments]);

  const userExists = (comment) => {
    return comment.likes.some(like => like.userId === currentUser.id)
  }

  if (loading) return <Loading/>

  return (
    <div className="container mt-4">
        <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
        {!isUnauthorized && (
          <FormComment
            currentUser={currentUser}
            productId={productId}
            onSubmit={(data) => actionSubmitComment(data)}
          />
        )}
    {rootComments.length > 0 && (
      <>
        <h5>Comments:</h5>
        <div id="scrollableDiv" style={{ height: '35vw', overflow: 'auto' }}>
          <InfiniteScroll
            dataLength={comments.length}
            next={fetchMoreComments}
            hasMore={hasMore}
            endMessage={<p>No more comments</p>}
            scrollableTarget="scrollableDiv"

          >
            <div>
              {rootComments.map((comment) => (
                <div key={comment.id} className="card mb-3">
                  <div className="card-body">
                  {editingComment?.id === comment.id
                    ? (
                      <div>
                        <button className="my-2 btn btn-secondary" onClick={() => setEditingComment(null)}>Close</button>
                        <FormComment
                          editingComment={editingComment}
                          currentUser={currentUser}
                          productId={productId}
                          onSubmit={(data) => actionSubmitComment(data)}
                        />
                      </div>
                      )
                    :
                      (
                        <>
                          <div className="d-flex justify-content-between">
                            <div>{comment.text}</div>
                            <div className="d-flex">
                              {Array.from({ length: comment.rating }, (_, index) => (
                                <div key={index + 1}>
                                  <Icon name='fillStar'/>
                                </div>
                              ))}
                              {Array.from({ length: 5 - comment.rating }, (_, index) => (
                                <div key={index + 1}>
                                  <Icon name='star'/>
                                </div>
                              ))}
                            </div>
                            <div>
                              <div className="d-flex gap-2">
                                <div>{comment.user.login}</div>
                                <div className="text-muted">{comment.createdAt}</div>
                              </div>
                              <div className="d-flex align-items-center justify-content-end">
                                <div onClick={() => handleLikeComment(comment)} className="heart">
                                  <div>
                                    {currentUser && userExists(comment) ? <Icon name='fillHeart'/> :  <Icon name='heart'/>}
                                    {comment.likes.length > 0 && <span className="count">{comment.likes.length}</span>}
                                  </div>
                                </div>
                                {(!isUnauthorized && (currentUser.id ===  comment.user.id || currentUser.isAdmin)) && (
                                  <>
                                    {(!comment.isExpiredUpdate || currentUser.isAdmin) && (
                                      <button className="btn btn-link" onClick={() => setEditingComment(comment)}>Edit</button>
                                    )}
                                    <button className="btn btn-link" onClick={() => actionOpenConfirm(comment)}>Delete</button>
                                  </>
                                )}
                              </div>
                            </div>
                          </div>
                          <ContainerSubComments
                            userExists={userExists}
                            productId={productId}
                            currentUser={currentUser}
                            comment={comment}
                          />
                        </>
                      )
                    }
                  </div>
                </div>
              ))}
            </div>
          </InfiniteScroll>
        </div>
      </>
    )}
  </div>
  )
}

export default Comments;