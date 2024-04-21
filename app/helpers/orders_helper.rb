module OrdersHelper
  def color_status(status)
    {
      pending: 'text-warning',
      received: 'text-success',
      rejected: 'text-danger',
      cancelled: 'text-secondary',
      delivering: 'text-info'
    }[status.to_sym]
  end
end
