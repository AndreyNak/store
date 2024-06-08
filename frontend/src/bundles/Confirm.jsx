import { useTranslation } from "react-i18next";
import Modal from "./Modal/Modal";

const Confirm = ({ isOpen, setIsOpen, actionNo, actionYes }) => {
  const { t } = useTranslation('translation', { keyPrefix: 'bundles.confirm' });


  return (
    <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
      <div className="container mt-4">
        <div className="text-center">
          <h3 className="mb-4">{t('are_you_sure')}</h3>
          <div className="d-flex justify-content-center">
            <button onClick={actionNo} className="btn btn-secondary me-3">{t('no')}</button>
            <button onClick={actionYes} className="btn btn-primary">{t('yes')}</button>
          </div>
        </div>
      </div>
    </Modal>
  )
};

export default Confirm;
