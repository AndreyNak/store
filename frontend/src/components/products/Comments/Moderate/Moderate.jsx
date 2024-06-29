import { useTranslation } from "react-i18next";
import Modal from "../../../../bundles/Modal/Modal";
import { del, patch } from "../../../../lib/http";
import { useEffect, useState } from "react";
import { useGenericData } from "../../../../bundles/GeneralContext";
import FormComment from "../FormComment";
import cn from "classnames";
import styles from './moderate.module.scss';
import { useMemo } from "react";

const Moderate = (
  {
    isOpen,
    setIsOpen,
    comment,
    productId,
    removeComment,
    actionSubmitComment,
  }
) => {
  const [isOpenEdit, setIsOpenEdit] = useState(false);
  const [selectedOption, setSelectedOption] = useState("day");
  const [reason, setReason] = useState(null);
  const [isBan, setIsBan] = useState(false);
  const [deletedComment, setDeletedComment] = useState(null);
  const [isOpenConfirm, setIsOpenConfirm] = useState(false);

  const { currentUser }= useGenericData();
  const { t:tg } = useTranslation('translation');


  useEffect(() => {
    return () => {
      setIsOpenEdit(false)
    }
  }, [comment])


  const actionOpenConfirm = (comment) => {
    setDeletedComment(comment)
    setIsOpenConfirm(!isOpenConfirm)
  }

  const deleteComment = () => {
    del(`products/${productId}/comments/${deletedComment.id}`).then(() => {
      removeComment(comment);
      setDeletedComment(null);
      setIsOpenConfirm(false);
      setIsOpen(false);
    })
  }


  const disableCommiserate = () => {
    const params = {
      restriction: {
        reason: reason,
        period: selectedOption,
        officer_id: currentUser.id,
        offender_id: comment.user.id,
      },
      comment_id: comment.id
    }

    patch(`products/${productId}/comments/disable_commiserate`, params)
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    isBan && disableCommiserate();
    deleteComment();
  }

  const handleActionNo = () => {
    setIsBan(false);
    setIsOpenConfirm(false);
    setDeletedComment(null);
  }

  const handleChange = (event) => {
    setSelectedOption(event.target.value);
  };

  const handleReasonChange = (event) => {
    setReason(event.target.value);
  };

  const periods = useMemo(() => ["day", "week", "month", "year"], [])
  const periodLabels = useMemo(() => ({
    day: "On day",
    week: "On week",
    month: "On month",
    year: "On year",
  }), []);



  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      {isOpenConfirm && (
        <div>
          <div>
            <div className="d-flex justify-content-center gap-2 px-3 pb-3">
              <h5>Disable commiserate {comment.user.login} ?</h5>
              <input className="form-check-input" checked={isBan} onChange={() => setIsBan(!isBan)} type="checkbox" />
            </div>
              <form className={cn(`${styles.animatedBlock}`, { [styles.visible]: isBan })}>
                <div className="mb-3">
                  <div className="d-flex align-items-center gap-3">
                    {periods.map((period) => (
                      <div className="form-check" key={period}>
                        <input
                          className="form-check-input"
                          name="period"
                          value={period}
                          checked={selectedOption === period}
                          onChange={handleChange}
                          type="radio"
                          id={period}
                        />
                        <label className="form-check-label" htmlFor={period}>
                          {periodLabels[period]}
                        </label>
                      </div>
                    ))}
                  </div>
                </div>
                <div className="mb-3">
                  <label htmlFor="reason" className="form-label">Reason:</label>
                  <input
                    placeholder="Spam"
                    type="text"
                    className="form-control"
                    id="reason"
                    value={reason}
                    onChange={handleReasonChange}
                  />
                </div>
              </form>
              <div className="px-3 d-flex gap-2">
                <button type="button" className="btn btn-secondary" onClick={handleActionNo}>
                {tg('cancel')}
                </button>
                <button type="submit" onClick={handleSubmit} className="btn btn-primary">
                  {tg('submit')}
                </button>
              </div>
          </div>
        </div>
      )}
      {isOpenEdit && (
        <FormComment
          editingComment={comment}
          currentUser={currentUser}
          productId={productId}
          onSubmit={actionSubmitComment}
        />
      )}
      <div>
        <button className="btn btn-link" onClick={() => setIsOpenEdit(!isOpenEdit)}>{tg('edit')}</button>
        <button className="btn btn-link" onClick={() => actionOpenConfirm(comment)}>{tg('delete')}</button>
      </div>
    </Modal>
  );
}



export default Moderate;