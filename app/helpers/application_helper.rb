module ApplicationHelper
  STATUS_MAP = {
    success: 'label-success',
    pending: 'label-danger',
    failure: 'label-primary'
  }
  def status_label_class(status)
    STATUS_MAP[status.to_sym] || 'label-default'
  end
end
