import { Link } from "@reach/router";

const Errors = ({
  code
}) => {
  const errors = {
    not_found: {
      status: <>404</>,
      subheader: 'Page Not Found',
      text: 'We can\'t seem to find the page you\'re looking for. Go Back to choose a new direction.',
    },
    internal_server_error: {
      status: <>500</>,
      subheader: 'Something is wrong',
      text: 'Our development team have been notified of this issue and they are working on it.',
    },
    unauthorized: {
      status: <>401</>,
      subheader: 'Unauthorized Access',
      text: 'You do not have the necessary permissions to access this resource.',
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
            Back to Dashboard
          </Link>
      </div>
    </div>
  );
};


export const NotFound = () => <Errors code="not_found" />;
export const Unauthorized = () => <Errors code="unauthorized" />;

