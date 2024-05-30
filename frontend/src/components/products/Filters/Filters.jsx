import { useMemo } from 'react'
import './filters.scss'
const Filters = ({currentUser, typeProducts, query, setQuery }) => {
  const handleResetFilters = () => {
    setQuery({ search: '', favorites: false, category: '', discount: false })
  }

  const isClearFilter =  useMemo(() => {
    return !Object.values(query).some(value => value);
  }, [query])

  return (
    <div>
      <button
        type="button"
        className={`btn btn-link ${isClearFilter && 'selected'}`}
        onClick={handleResetFilters}
      >
        All
      </button>
      <button
        type="button"
        className={`btn btn-link ${query.discount && 'selected'}`}
        onClick={() => setQuery({...query, discount: !query.discount })}
      >
        With discount
      </button>
      {currentUser && (
        <button
          type="button"
          className={`btn btn-link ${query.favorites && 'selected'}`}
          onClick={() => setQuery({...query, favorites: !query.favorites })}
        >
          Favorites
        </button>
      )}
      <div className='d-flex'>
        {typeProducts.map((type) => (
          <button
            key={type.name}
            type="button"
            className={`btn btn-link ${query.category === type.name && 'selected'}`}
            onClick={() => setQuery(query.category === type.name ? {...query, category: ''} : {...query, category: type.name})}
          >
            {type.name}
          </button>
        ))}
      </div>
      <br></br>
      <input
        className='form-control mr-sm-2'
        value={query.search}
        placeholder='Search'
        onChange={(e) => setQuery({...query, search: e.target.value}) }
      />
    </div>
  )
}

export default Filters;
