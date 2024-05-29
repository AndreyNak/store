import React, { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { get, patch, post } from "../../lib/http";
import FormError from "../../bundles/FormError";
import Icon from "../../bundles/Icon";
import { some } from 'lodash'
import './comments.scss'
import SubComments from "./SubComments";
import InfiniteScroll from "react-infinite-scroll-component";
import Loading from "../../bundles/Loading";
import { navigate } from "@reach/router";

const Comments = ( { currentUser, productId}) => {
  const [loading, setLoading] = useState(true);
  const [errors, setErrors] = useState([]);
  const [selectedCommentId, setSelectedCommentId ] = useState(null);
  const [comments, setComments] = useState([]);
  const [text, setText] = useState('');
  const [page, setPage ] = useState(1);
  const [hasMore, setHasMore] = useState(true);
  const [selectedRating, setSelectedRating] = useState('');


  const answerInputRef = useRef(null);


  useEffect(() => {
    const params = {page: 1}
    get(`products/${productId}/comments`, params)
      .then((data) => setComments(data))
      .finally(() => setLoading(false))
  }, [])

  useEffect(() => {
    if (selectedCommentId) {
      answerInputRef.current?.focus();
    }
  }, [selectedCommentId]);

  const handleSubmit = (e, type = 'comment') => {
    e.preventDefault();

    const isComment = type === 'comment';

    const params = {
      comment: {
        text,
        user_id: currentUser.id,
        ...(isComment
          ? { rating: selectedRating }
          : { parent_id: selectedCommentId })
      }
    };

    post(`products/${productId}/comments`, params).then((data) => {
      setComments((prevComments) => [data, ...prevComments]);
      setText('');
      setSelectedRating(null);
      setSelectedCommentId(null);
    }).catch((data) => setErrors(data.errors));
  }

  const handleChangeInputComment = (value)  => {
    setSelectedCommentId(null)
    setText(value)
  }

  const handleAnswer = (commentId) => {
    setSelectedCommentId(commentId);
    setText('');
  }

  const handleLikeComment = (comment) => {
    if (isUnauthorized) return navigate('login');

    const params = {user_id: currentUser.id}
    patch(`products/${productId}/comments/${comment.id}/toggle_like`, params).then((data) => {
      updateCommentLike(data)
    })
  }


  const fetchMoreComments = async () => {
    const currentPage = page + 1;
    setPage(currentPage);
    const params = { page: currentPage }
    get(`products/${productId}/comments`, params).then((newComments) => {
      setComments((prevComments) => [...prevComments, ...newComments ])

      if (newComments.length === 0) setHasMore(false);
    }).catch((error) => console.error('Error fetching more messages:', error));
  };

  const updateCommentLike = (newComment) => {
    setComments((prevComments) =>
      prevComments.map((comment) =>
        comment.id == newComment.id ? {...comment, likes: newComment.likes } : comment
      )
    )
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
        {!isUnauthorized && (
          <>
            <form onSubmit={handleSubmit} className="mb-4">
              <div className="mb-3">
                <label htmlFor="text" className="form-label">Text:</label>
                <input
                  type="text"
                  name="text"
                  className="form-control"
                  value={!selectedCommentId ? text : ''}
                  onChange={(e) => handleChangeInputComment(e.target.value)}
                />
              </div>
              <div className="mb-3">
                <label className="form-label me-2">Rating:</label>
                {[1, 2, 3, 4, 5].map((rating) => (
                  <div className="form-check form-check-inline" key={rating}>
                    <input
                      className="form-check-input"
                      type="radio"
                      name="rating"
                      id={`rating_${rating}`}
                      value={rating}
                      checked={selectedRating === rating}
                      onChange={() => setSelectedRating(rating)}
                    />
                    <label className="form-check-label" htmlFor={`rating_${rating}`}>{rating}</label>
                  </div>
                ))}
              </div>
              <button type="submit" className="btn btn-primary">Send</button>
            </form>
            <FormError errors={errors} />
          </>
        )}
    {rootComments.length > 0 && (
      <>
        <h5>Comments:</h5>
        <div id="scrollableDiv" style={{ height: '35vw', overflow: 'auto' }}>
          <InfiniteScroll
            dataLength={comments.length}
            next={fetchMoreComments}
            hasMore={hasMore}
            loader={<Loading />}
            endMessage={<p>No more comments</p>}
            scrollableTarget="scrollableDiv"

          >
            <div>
              {rootComments.map((comment) => (
                <div key={comment.id} className="card mb-3">
                  <div className="card-body">
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
                      <div className="d-flex gap-2">
                        <div>{comment.user.login}</div>
                        <div className="text-muted">{comment.createdAt}</div>
                      </div>
                    </div>
                    <SubComments
                      currentUser={currentUser}
                      productId={productId}
                      comment={comment}
                      handleLikeComment={handleLikeComment}
                      userExists={userExists}
                    />
                    <div className="d-flex justify-content-between align-items-center">
                      <button
                        onClick={() => handleAnswer(comment.id)}
                        className="btn btn-link mt-2"
                      >
                        Answer
                      </button>
                      <div onClick={() => handleLikeComment(comment)} className="heart">
                        <div>
                          {currentUser && userExists(comment) ? <Icon name='fillHeart'/> :  <Icon name='heart'/>}
                          {comment.likes.length > 0 && <span className="count">{comment.likes.length}</span>}
                        </div>
                      </div>
                    </div>
                    {selectedCommentId === comment.id && (
                      <form onSubmit={(e) => handleSubmit(e, 'answer')} className="mt-2">
                        <div className="mb-3">
                          <label htmlFor="text" className="form-label">Text:</label>
                          <input
                            ref={answerInputRef}
                            type="text"
                            name="text"
                            className="form-control"
                            value={text}
                            onChange={(e) => setText(e.target.value)}
                          />
                        </div>
                        <button type="submit" className="btn btn-primary">Send</button>
                      </form>
                    )}
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