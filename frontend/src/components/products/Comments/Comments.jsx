import React, { useEffect, useMemo, useState } from "react";
import { del, get, patch } from "../../../lib/http";
import Icon from "../../../bundles/Icon";
import './comments.scss'
import InfiniteScroll from "react-infinite-scroll-component";
import Loading from "../../../bundles/Loading";
import { useNavigate } from "react-router-dom";
import FormComment from "./FormComment";
import ContainerSubComments from "./ContainerSubComments";
import Confirm from "../../../bundles/Confirm";
import { checkPermissions, hasPermission } from "../../../lib/permissions";
import { useTranslation } from "react-i18next";
import Moderate from "./Moderate/Moderate";

const Comments = ( { currentUser, productId}) => {
  const [loading, setLoading] = useState(true);
  const [comments, setComments] = useState([]);
  const [deletedComment, setDeletedComment] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);
  const [isOpenModerate, setIsOpenModerate] = useState(false);
  const [page, setPage ] = useState(1);
  const [editingComment, setEditingComment] = useState(null);
  const [moderatedComment, setModeratedComment] = useState(null);
  const [hasMore, setHasMore] = useState(true);
  const navigate = useNavigate();

  const { t } = useTranslation('translation', { keyPrefix: 'products.comments' });
  const { t:tg } = useTranslation('translation');

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
      removeComment(deletedComment);
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

  const removeComment = (deletedComment) => {
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

  const actionOpenModerate = (comment) => {
    setModeratedComment(comment);
    setIsOpenModerate(true);
  }

  const actionCloseModerate = () => {
    setIsOpenModerate(false);
    setModeratedComment(null);
  }

  const actionSubmitCommentModerate = (data) => {
    actionSubmitComment(data);
    actionCloseModerate();
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
        {moderatedComment && (
          <Moderate
            productId={productId}
            isOpen={isOpenModerate}
            setIsOpen={actionCloseModerate}
            comment={moderatedComment}
            removeComment={removeComment}
            actionSubmitComment={actionSubmitCommentModerate}
          />
        )}
        {isUnauthorized ? (
          <div className="d-flex justify-content-center">
            <div>{t('sign_comment')}</div>
          </div>
        ) : (
          hasPermission(currentUser, 'can_create_comment') ? (
            <FormComment
              currentUser={currentUser}
              productId={productId}
              onSubmit={(data) => actionSubmitComment(data)}
            />
          ) : (
            <div className="d-flex justify-content-center">
              <div>{t('disable_commenting')}</div>
            </div>
          )
        )}

        {rootComments.length > 0 ? (
          <>
            <h5>{t('title')}:</h5>
            <div id="scrollableDiv" style={{ height: '35vw', overflow: 'auto' }}>
              <InfiniteScroll
                dataLength={rootComments.length}
                next={fetchMoreComments}
                hasMore={hasMore}
                endMessage={<p>{t('no_more_comments')}</p>}
                scrollableTarget="scrollableDiv"
              >
                <div>
                  {rootComments.map((comment) => (
                    <div key={comment.id} className="card mb-3">
                      <div className="card-body">
                      {editingComment?.id === comment.id
                        ? (
                          <div>
                            <button className="my-2 btn btn-secondary" onClick={() => setEditingComment(null)}>{tg('close')}</button>
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
                                    {(checkPermissions(currentUser, comment, 'can_edit_comment')) && (
                                      <>
                                        {checkPermissions(currentUser, comment, 'can_edit_expired_comment' ) && (
                                          <button className="btn btn-link" onClick={() => setEditingComment(comment)}>{tg('edit')}</button>
                                        )}
                                        <button className="btn btn-link" onClick={() => actionOpenConfirm(comment)}>{tg('delete')}</button>
                                      </>
                                    )}
                                    {hasPermission(currentUser, 'can_view_products_comment_moderate') && (
                                      <button onClick={() => actionOpenModerate(comment)} className="btn btn-link">{t('moderate')}</button>
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
        ) : <div>{t('no_yet_comments')}</div> }
  </div>
  )
}

export default Comments;