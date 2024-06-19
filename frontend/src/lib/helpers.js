export const colorStatus = (status) => {
  const params = {
    pending: 'text-warning',
    received: 'text-success',
    rejected: 'text-danger',
    cancelled: 'text-secondary',
    delivering: 'text-info'
  }
  return params[status]
}