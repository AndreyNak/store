import Modal from "./Modal/Modal";

const Confirm = ({ isOpen, setIsOpen, actionNo, actionYes }) => (
  <Modal isOpen={isOpen} setIsOpen={setIsOpen}>
    <div className="container mt-4">
      <div className="text-center">
        <h3 className="mb-4">Are you sure?</h3>
        <div className="d-flex justify-content-center">
          <button onClick={actionNo} className="btn btn-secondary me-3">No</button>
          <button onClick={actionYes} className="btn btn-primary">Yes</button>
        </div>
      </div>
    </div>
  </Modal>
);

export default Confirm;
