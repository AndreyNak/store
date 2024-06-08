import { useMemo } from 'react'
import './filters.scss'
import { useTranslation } from 'react-i18next'
const Filters = ({currentUser, typeProducts, query, setQuery }) => {
  const handleResetFilters = () => {
    setQuery({ search: '', favorites: false, category: '', discount: false })
  }

  const { t } = useTranslation('translation', { keyPrefix: 'products.products.filters' });


  const isClearFilter =  useMemo(() => {
    return !Object.values(query).some(value => value);
  }, [query])

  return (
    <div>
      <button
        type="button"
        className={`mx-2 btn btn-link ${isClearFilter && 'selected'}`}
        onClick={handleResetFilters}
      >
        {t('all')}
      </button>
      <button
        type="button"
        className={`mx-2 btn btn-link ${query.discount && 'selected'}`}
        onClick={() => setQuery({ ...query, discount: !query.discount })}
      >
        {t('with_discount')}
      </button>
      {currentUser && (
        <button
          type="button"
          className={`mx-2 btn btn-link ${query.favorites && 'selected'}`}
          onClick={() => setQuery({ ...query, favorites: !query.favorites })}
        >
          {t('favorites')}
        </button>
      )}
      <div className='d-flex'>
        {typeProducts.map((type) => (
          <button
            key={type.tname}
            type="button"
            className={`m-2 btn btn-link ${query.category === type.tname && 'selected'}`}
            onClick={() => setQuery(query.category === type.tname ? { ...query, category: '' } : { ...query, category: type.tname })}
          >
            {type.tname}
          </button>
        ))}
      </div>
      <br />
      <input
        className='form-control mr-sm-2'
        value={query.search}
        placeholder={t('search')}
        onChange={(e) => setQuery({ ...query, search: e.target.value })}
      />
    </div>
  )
}

export default Filters;
