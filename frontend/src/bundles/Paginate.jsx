import { range } from 'lodash';
import Icon from './Icon';

const Paginate = ({ page, maxPage, setPage }) => {
  const startPage = Math.max(page - 3, 1);
  const endPage = Math.min(page + 3, maxPage);
  const pages = range(startPage, endPage + 1);

  if (maxPage < 2) return null
  return (
    <div className="d-flex justify-content-center my-3">
      <button
        className="btn btn-primary mx-1 d-flex align-items-center"
        disabled={page === 1}
        onClick={() => setPage(page - 1)}
      >
        <Icon name="arrowLeft" />
      </button>
      <div className='d-flex'>
        {startPage > 1 && (
          <>
            <button
              className={`btn mx-1 ${page === 1 ? 'btn-secondary' : 'btn-outline-secondary'}`}
              onClick={() => setPage(1)}
            >
              1
            </button>
            {startPage > 2 && <span className="mx-1">...</span>}
          </>
        )}
        {pages.map((p) => (
          <button
            key={p}
            className={`btn mx-1 ${p === page ? 'btn-secondary' : 'btn-outline-secondary'}`}
            onClick={() => setPage(p)}
            disabled={p === page}
          >
            {p}
          </button>
        ))}
        {endPage < maxPage && (
          <>
            {endPage < maxPage - 1 && <span className="mx-1">...</span>}
            <button
              className={`btn mx-1 ${page === maxPage ? 'btn-secondary' : 'btn-outline-secondary'}`}
              onClick={() => setPage(maxPage)}
            >
              {maxPage}
            </button>
          </>
        )}
      </div>
      <button
        className="btn btn-primary mx-1 d-flex align-items-center"
        disabled={page === maxPage}
        onClick={() => setPage(page + 1)}
      >
        <Icon name="arrowRight" />
      </button>
    </div>
  );
};

export default Paginate;
