import { useMemo, useState } from "react";
import Icon from "../../../bundles/Icon";
import { patch } from "../../../lib/http";
import Loading from "../../../bundles/Loading";
import { navigate } from "@reach/router";
import FormReply from "./FormReply";
import { checkPermissions, hasPermission } from "../../../lib/permissions";
import { useTranslation } from "react-i18next";

const SubComments = ({
  comment,
  currentUser,
  productId,
  userExists,
  setSubComments,
  loading,
  subComments,
  onUpdateReply,
  actionOpenConfirm,
  actionOpenModerate
 }) => {
  const [editingComment, setEditingComment] = useState(null);

  const { t } = useTranslation('translation', { keyPrefix: 'products.comments' });
  const { t:tg } = useTranslation('translation');

  const isUnauthorized = useMemo(() => {
    return currentUser === null
  }, [currentUser]);


  const handleLikeComment = (comment) => {
    if (isUnauthorized) return navigate('login');

    const params = {user_id: currentUser.id}
    patch(`products/${productId}/comments/${comment.id}/toggle_like`, params).then((data) => {
      updateCommentLike(data)
    })
  }

  const updateCommentLike = (newComment) => {
    setSubComments((prevComments) =>
      prevComments.map((comment) =>
        comment.id === newComment.id ? {...comment, likes: newComment.likes } : comment
      )
    )
  }

  const onSubmit = (data) => {
    setEditingComment(null);
    onUpdateReply(data)
  }

  return (
    <>
      <div className="mt-2">
        <span>{t('title_reply')}:</span>
        <div className="ms-3">
          {loading ? <Loading /> : subComments.map((subComment) => (
            <div key={`${comment.id}-${subComment.id}`} className="card mb-2">
              <div className="card-body">
                {editingComment?.id === subComment.id
                  ? (
                      <div>
                        <button className="my-2 btn btn-secondary" onClick={() => setEditingComment(null)}>{tg('close')}</button>
                        <FormReply
                          editingComment={editingComment}
                          commentReplyId={comment.id}
                          currentUser={currentUser}
                          productId={productId}
                          onSubmit={onSubmit}
                        />
                      </div>
                    )
                  : (
                    <div className="d-flex justify-content-between">
                      <div>{subComment.text}</div>
                      <div>
                        <div className="d-flex gap-2">
                          <div>{subComment.user.login}</div>
                          <div className="text-muted">{comment.createdAt}</div>
                        </div>
                        <div className="d-flex gap-2 align-items-center justify-content-end">
                          <div onClick={() => handleLikeComment(subComment)} className="heart">
                            <div>
                              {currentUser && userExists(subComment) ? <Icon name='fillHeart'/> : <Icon name='heart'/>}
                              {subComment.likes.length > 0 && <span className="count">{subComment.likes.length}</span>}
                            </div>
                          </div>
                          {checkPermissions(currentUser, subComment, 'can_edit_comment') && (
                            <>
                              {checkPermissions(currentUser, subComment, 'can_edit_expired_comment') && (
                                <button className="btn btn-link" onClick={() => setEditingComment(subComment)}>{tg('edit')}</button>
                              )}
                              <button className="btn btn-link" onClick={() => actionOpenConfirm(subComment)}>{tg('delete')}</button>
                            </>
                          )}
                          {hasPermission(currentUser, 'can_view_products_comment_moderate') && (
                            <button onClick={() => actionOpenModerate(subComment)} className="btn btn-link">{t('moderate')}</button>
                          )}
                        </div>
                      </div>
                    </div>
                  )
                }
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  )
}

export default SubComments;