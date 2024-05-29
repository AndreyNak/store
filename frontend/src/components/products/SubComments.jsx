import { useState } from "react";
import Icon from "../../bundles/Icon";
import { get } from "../../lib/http";
import Loading from "../../bundles/Loading";

const SubComments = ({ comment, currentUser, productId, handleLikeComment, userExists }) => {
  const [isOpenSubComments, setIsOpenSubComments] = useState({isOpen: false, commentId: null});
  const [subComments, setSubComments] = useState([]);
  const [loading,  setLoading] = useState(false);

  const handleOpenSubComments = (commentId) => {
    setLoading(true)
    {!isOpenSubComments.isOpen && get(`products/${productId}/comments/${comment.id}/sub_comments`).then((data) => {
      setSubComments(data);
    }).finally(() => setLoading(false))}
    setIsOpenSubComments({ isOpen: !isOpenSubComments.isOpen, commentId} );
  }

  return (
    <>
      {comment.countSubComments > 0 && (
        <div>
          <button className="btn btn-link" onClick={() => handleOpenSubComments(comment.id)}>Open Comments</button>
          {(isOpenSubComments.isOpen && isOpenSubComments.commentId == comment.id) && (
            <div className="mt-2">
              <span>Answers:</span>
              <div className="ms-3">
                {loading ? <Loading /> : subComments.map((subComment) => (
                  <div key={`${comment.id}-${subComment.id}`} className="card mb-2">
                    <div className="card-body">
                      <div className="d-flex justify-content-between">
                        <div>{subComment.text}</div>
                        <div>
                          <div className="text-muted">{comment.createdAt}</div>
                          <div className="d-flex gap-2 justify-content-end">
                            <div>{subComment.user.login}</div>
                            <div onClick={() => handleLikeComment(subComment)} className="heart">
                              <div>
                                {currentUser && userExists(subComment) ? <Icon name='fillHeart'/> :  <Icon name='heart'/>}
                                {subComment.likes.length > 0 && <span className="count">{subComment.likes.length}</span>}
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      )}
    </>
  )
}

export default SubComments;