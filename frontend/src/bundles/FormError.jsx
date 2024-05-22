const FormError = ({ errors }) => (
  <>
    {errors.length > 0 && (
      <div className="mt-3 alert alert-danger">
        <p>{`${errors.length} error(s) prohibited from being saved:`}</p>
        <ul>
          {errors.map((error, index) => (
            <li key={index}>{error}</li>
          ))}
        </ul>
      </div>
    )}
  </>
);


export default FormError;
