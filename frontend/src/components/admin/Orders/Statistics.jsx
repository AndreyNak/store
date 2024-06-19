import { BarChart } from '@mui/x-charts/BarChart';
import { PieChart } from '@mui/x-charts/PieChart';
import moment from 'moment';
import { get } from '../../../lib/http';
import { useEffect } from 'react';
import { useState } from 'react';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import Icon from '../../../bundles/Icon';
import { useMemo } from 'react';

const Statistics = () => {
  const [orders, setOrders] = useState([]);
  const [query, setQuery] = useState({ period: 'year', value: moment().year() })

  useEffect(() => {
    const params = { ...query }
    get('admin/orders/statistics', params).then((data) => setOrders(data))
  }, [query])

  const theme = createTheme({
    palette: {
      primary: {
        main: '#556cd6',
      },
      secondary: {
        main: '#19857b',
      },
      error: {
        main: '#red',
      },
      background: {
        default: '#fff',
      },
    },
  });

  const currentMonth = useMemo(() =>  moment().month() + 1, []);
  const currentYear = useMemo(() =>  moment().year(), []);
  const currentWeek = useMemo(() =>  moment().week(), []);

  const months = useMemo(() => (
    [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ]
  )
  , [])

  const validValue = (value) => {
    switch(query.period) {
      case 'year':
        return value > 0 ? value : currentYear
      case 'month':
        return value >= 1 && value <= 12 ? value : currentMonth
      case 'week':
        const maxWeek = moment().year(currentYear).weeksInYear();

        return value >= 1 && value <= maxWeek ? value : currentWeek
    }
  }

  const handlePrev = () => {
    setQuery({...query, value: validValue(query.value - 1)});
  }

  const handleNext = () => {
    setQuery({...query, value: validValue(query.value + 1)});
  }

  const currentValue = useMemo(() => {
    return query.period === 'month' ? months[query.value - 1] : query.value

  }, [query])

  const counts_orders = (orders) => {
    return orders.map(order => order.counts)
  }

  const date_orders = (orders) => {
    return orders.map(order => order.date)
  }


  const OrdersManipulation = () => (
    <div className='ms-5'>
      <div className='d-flex gap-2 text-white'>
        <button className='btn btn-info text-white' onClick={() => setQuery({...query, period: 'year', value: currentYear})}>In Year</button>
        <button className='btn btn-info text-white' onClick={() => setQuery({...query, period: 'month', value: currentMonth })}>In Month</button>
        <button className='btn btn-info text-white' onClick={() => setQuery({...query, period: 'week', value: currentWeek })}>In Week</button>
      </div>
      <div className='d-flex mt-2 gap-2'>
        <button className='btn btn-info text-white' onClick={() => handlePrev()}><Icon name='arrowLeft'/></button>
        <button className='btn btn-info text-white' onClick={() => handleNext()}><Icon name='arrowRight'/></button>
      </div>
    </div>
  )

  return (
    <>
      {orders.received && (
        <div className='mt-4'>
          <OrdersManipulation />
          <ThemeProvider theme={theme}>
            <div className='d-flex justify-content-center mb-2'>
              <h1>{`Count Orders in ${query.period}: ${currentValue}`}</h1>
            </div>
            <div style={{ width: '100%', height: 250 }}>
              <BarChart
                yAxis={[{ label: 'counts' }]}
                xAxis={[
                  {
                    id: 'barCategories',
                    data: date_orders(orders.received.counts),
                    scaleType: 'band',
                  },
                ]}
                series={[
                  { data: counts_orders(orders.received.counts), label: `Received`, color: '#198754' }
                ]}
              />
              <BarChart
                yAxis={[{ label: 'counts' }]}
                xAxis={[
                  {
                    id: 'barCategories',
                    data: date_orders(orders.rejected.counts),
                    scaleType: 'band',
                  },
                ]}
                series={[
                  { data: counts_orders(orders.rejected.counts), label: `Rejected`, color: '#dc3545' }
                ]}
              />
              <BarChart
                yAxis={[{ label: 'counts' }]}
                xAxis={[
                  {
                    id: 'barCategories',
                    data: date_orders(orders.cancelled.counts),
                    label: `Count Orders ${query.period}, ${currentValue}`,
                    scaleType: 'band',
                  },
                ]}
                series={[
                  { data: counts_orders(orders.cancelled.counts), label: `Cancelled`, color: '#6c757d'},
                ]}
              />
              <OrdersManipulation />
              <h1>{`Count Orders in ${query.period}: ${currentValue}`}</h1>
              <PieChart
                series={[
                  {
                    data: [
                      { id: 0, value: orders.received.total, label: 'Received', color: '#198754' },
                      { id: 1, value: orders.rejected.total, label: 'Rejected', color: '#dc3545' },
                      { id: 2, value: orders.cancelled.total, label: 'Cancelled', color: '#6c757d' },
                    ],
                  },
                ]}
                width={400}
                height={200}
              />
            </div>
          </ThemeProvider>
        </div>
      )}
    </>
  )
}

export default Statistics;