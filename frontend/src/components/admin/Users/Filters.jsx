const Filters = ({ query, setQuery }) => {

  return (
    <div>
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
