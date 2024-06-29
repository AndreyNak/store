import { useEffect } from "react";
import { get } from "../../lib/http";
import { useState } from "react";
import Loading from "../../bundles/Loading";
import { Link } from "@reach/router";
import { useTranslation } from "react-i18next";

const Restriction = () => {
  const [restrictions, setRestrictions] = useState([]);
  const [loading, setLoading] = useState(true);

  const { t } = useTranslation('translation', { keyPrefix: 'profile.restrictions' });


  useEffect(() => {
    get('profile/restrictions').then((data) => {
      setRestrictions(data)
      setLoading(false);
    })

  }, [])

  return (
    <div className="container">
      {loading ? <Loading/> : restrictions.length > 0 ? (
        <div>
          <div className="alert alert-danger text-danger">
            <p className="fw-bold">{t('active_restrictions')}.</p>
             <div>{t('support_text')} <Link className="text-danger" to="/support/main">support</Link>.</div>
          </div>

          <p>{t('cant')}:</p>
          {restrictions.map((restriction) => (
            <div>
              <div>{t('name')}: {restriction.permission.name.replaceAll('_', ' ')}</div>
              <div>{t('reason')}: {restriction.reason}</div>
              <div>{t('expired_at')}: {restriction.expiredAt}</div>
              <hr />
            </div>
          ))}
        </div>
      ) : (
        <div className="alert alert-info">{t('clear')}!</div>
      )}
    </div>
  )
}

export default Restriction;