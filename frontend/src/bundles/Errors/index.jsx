import { Link } from "@reach/router";
import { useTranslation } from "react-i18next";

const Errors = ({ code }) => {
  const { t } = useTranslation('translation', { keyPrefix: 'bundles.errors' });


  const errors = {
    not_found: {
      status: <>404</>,
      subheader: t('not_found.subheader'),
      text: t('not_found.text'),
    },
    internal_server_error: {
      status: <>500</>,
      subheader: t('internal_server_error.subheader'),
      text: t('internal_server_error.text'),
    },
    unauthorized: {
      status: <>401</>,
      subheader: t('unauthorized.subheader'),
      text: t('unauthorized.text'),
    },
  };

  const error = errors[code];

  return (
    <div className="d-flex align-items-center justify-content-center page-404-container">
      <div className="page-404">
        <div className="text-blue page-404__header d-flex align-items-center mb-0">
          {error.status}
        </div>
        <div className="text-blue mb-50 page-404__subheader">{error.subheader}</div>
        <h5 className="text-secondary">{error.text}</h5>
        <Link to="/" className="btn btn-primary mt-50">
          {t('back_to_dashboard')}
        </Link>
      </div>
    </div>
  );
};


export const NotFound = () => <Errors code="not_found" />;
export const Unauthorized = () => <Errors code="unauthorized" />;

