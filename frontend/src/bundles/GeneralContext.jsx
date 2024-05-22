import { createContext } from 'react';
import { useContext } from 'react';


const GenericContext = createContext(null);

export const useGenericData = () => useContext(GenericContext);
export default GenericContext;
