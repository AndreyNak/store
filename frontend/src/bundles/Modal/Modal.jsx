import React from 'react';
import ReactModal from 'react-modal';

ReactModal.setAppElement('#root');
const Modal = ({ isOpen, setIsOpen, children }) => (
  <ReactModal
    isOpen={isOpen}
    onRequestClose={() => setIsOpen(false)}
    style={{
      overlay: {
        backgroundColor: 'rgba(0, 0, 0, 0.5)',
      },
      content: {
        top: '50%',
        left: '50%',
        right: 'auto',
        bottom: 'auto',
        marginRight: '-50%',
        transform: 'translate(-50%, -50%)',
        maxHeight: '80vh',
        overflowY: 'auto',
      },
    }}
  >
    {children}
  </ReactModal>
);

export default Modal;
