import { Link } from "@reach/router";
import Modal from "../../../bundles/Modal/Modal";
import { checkPermissions, hasPermission } from '../../../lib/permissions';
import { useGenericData } from '../../../bundles/GeneralContext';
import { useTranslation } from "react-i18next";

const DeniedPermissionsModal = ({isOpen, setIsOpen, restrictions, cancelRestriction}) => {
  const { currentUser } = useGenericData();
  const { t } = useTranslation('translation', { keyPrefix: 'admin.users.user.denied_permissions' });

  const renderStatus = (restriction) => {
    if (restriction.isActive) {
      return <div className="text-danger">{t('active')}</div>;
    } else if (restriction.canceller) {
      return <div className="text-warning">{t('cancelled')}</div>;
    } else {
      return <div className="text-success">{t('finished')}</div>;
    }
  };

  return (
    <div>
      <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
        <div>
          {restrictions.map((restriction) => (
            <div key={restriction.id}>
              <div className="d-flex gap-2">
                <div>
                  <div>{t('blocked_by')}:<Link onClick={() => setIsOpen(false)} to={`/admin/users/${restriction.officer.id}`}>{restriction.officer.login}</Link></div>
                  {restriction.canceller && (
                    <>
                      <div>{t('cancelled_by')}:<Link onClick={() => setIsOpen(false)} to={`/admin/users/${restriction.canceller.id}`}>{restriction.canceller.login}</Link></div>
                      <div>{t('cancelled_at')}:{restriction.cancelledAt}</div>
                    </>
                  )}
                  <div>{t('expired_at')}:{restriction.expiredAt}</div>
                  <div>{t('reason')}: {restriction.reason || 'Empty'}</div>
                  <div className="d-flex gap-2"><div>{t('status')}:</div><div>{renderStatus(restriction)}</div></div>
                </div>
                <div>
                  {restriction.isActive && checkPermissions(currentUser, restriction, 'can_edit_admin_user_cancel_restriction') &&
                    <button className="btn btn-secondary btn-sm" onClick={() => cancelRestriction(restriction.id)}>{t('cancel_restriction')}</button>
                  }
                </div>
              </div>
              <hr/>
            </div>
          ))}
        </div>
      </Modal>
    </div>
  )
}


export default DeniedPermissionsModal;