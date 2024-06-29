import { Oval } from 'react-loader-spinner'


const Loading = () => {
  return (
    <Oval
      visible={true}
      height="80"
      width="80"
      color="#0d6efd"
      secondaryColor="#9ec5fe"
      ariaLabel="oval-loading"
      wrapperStyle={{}}
      wrapperClass=""
    />
  );
}

export default Loading;