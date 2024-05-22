const FormSuccess = ({ success }) => (
  <>
    {success && (
      <div className="mt-3 alert alert-success">
        <p>{success}</p>
      </div>
    )}
  </>
);

export default FormSuccess;
