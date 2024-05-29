const Filters = ({currentUser, typeProducts, query, setQuery }) => {

  const handleResetFilters = () => {
    setQuery({ search: '', favorites: false, category: '', discount: false })
  }

  return (
    <div>
      <button type="button" className="btn btn-link" onClick={handleResetFilters}>All</button>
      <button type="button" className="btn btn-link" onClick={() => setQuery({...query, discount: true })}>With discount</button>
      {currentUser && (
        <button type="button" className="btn btn-link" onClick={() => setQuery({...query, favorites: true})}>Favorites</button>
      )}
      <div className='d-flex'>
        {typeProducts.map((type) => (
          <button key={type.name} type="button" className="btn btn-link" onClick={() => setQuery({...query, category: type.name})}>{type.name}</button>
        ))}
      </div>
      <br></br>
      <input className='form-control mr-sm-2' value={query.search} placeholder='Search' onChange={(e) => setQuery({...query, search: e.target.value}) }/>
    </div>
  )
}

export default Filters;
