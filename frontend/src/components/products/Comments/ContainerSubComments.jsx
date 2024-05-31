import { useEffect, useMemo, useState } from "react";
import FormReply from "./FormReply";
import SubComments from "./SubComments";
import { del, get } from "../../../lib/http";
import Confirm from "../../../bundles/Confirm";

const ContainerSubComments = ({  userExists, productId, currentUser, comment }) => {
  const [isOpenComments, setIsOpenComments] = useState(false);
  const [isOpenReply, setIsOpenReply] = useState(false);
  const [commentReplyId, setCommentReplyId ] = useState(null);
  const [deletedComment, setDeletedComment] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);

  const [subComments, setSubComments] = useState([]);
  const [loading,  setLoading] = useState(false);
  const [commentsLoaded, setCommentsLoaded] = useState(false);

  const isUnauthorized = useMemo(() => {
    return currentUser === null
  }, [currentUser]);

  const handleActionYes = () => {
    del(`products/${productId}/comments/${deletedComment.id}`).then(() => {
      removeComment();
      setDeletedComment(null);
      setIsOpenConfirm(false);
    })
  }

  const handleOpenComments = () => {
    if (!commentsLoaded) {
      setLoading(true);
      get(`products/${productId}/comments/${comment.id}/sub_comments`)
        .then((data) => {
          setSubComments(data);
          setCommentsLoaded(true);
        })
        .finally(() => setLoading(false));
    }
    setIsOpenComments(!isOpenComments);
  };

  const handleOpenFormReply = (commentId) => {
    setCommentReplyId(commentId);
    setIsOpenReply(true);
  }


  const removeComment = () => {
    comment.countSubComments --;
    setSubComments(prevComments => prevComments.filter(comment => comment.id !== deletedComment.id));
  }

  const addReplyComment = (newComment) => {
    comment.countSubComments ++;
    setSubComments((prevComments) => [...prevComments, newComment]);
    setCommentReplyId(null);
  }

  const updateReply = (newComment) => {
    setSubComments((prevComments) =>
      prevComments.map((comment) =>
        comment.id === newComment.id ? {...comment, text: newComment.text } : comment
      )
    )
  }

  const actionOpenConfirm = (comment) => {
    setDeletedComment(comment)
    setIsOpenConfirm(true)
  }

  const handleActionNo = () => {
    setDeletedComment(null);
    setIsOpenConfirm(false);
  }


  const actionSubmitComment = ({ data, type }) => {
    type === 'create' ? addReplyComment(data) : updateReply(data)
  }

  return (
    <>
      <Confirm isOpen={isOpenConfirm} setIsOpen={setIsOpenConfirm} actionNo={handleActionNo} actionYes={handleActionYes} />
      {comment.countSubComments > 0 && (
        <div>
          <button className="btn btn-link" onClick={handleOpenComments}>{isOpenComments ? 'Close' : 'Open'} Comments</button>
          {isOpenComments && (
            <SubComments
              currentUser={currentUser}
              productId={productId}
              comment={comment}
              userExists={userExists}
              setSubComments={setSubComments}
              loading={loading}
              subComments={subComments}
              onUpdateReply={(data) =>  actionSubmitComment(data)}
              actionOpenConfirm={actionOpenConfirm}
            />
          )}
        </div>
      )}
      {!isUnauthorized && (
        <div className="d-flex justify-content-between align-items-center">
          <button
            onClick={() => handleOpenFormReply(comment.id)}
            className="btn btn-link mt-2"
          >
            Reply
          </button>
        </div>
      )}
      {isOpenReply && (
        <FormReply
          commentReplyId={commentReplyId}
          currentUser={currentUser}
          productId={productId}
          onSubmit={(data) => actionSubmitComment(data)}
        />
      )}
    </>
  )
}

export default ContainerSubComments;