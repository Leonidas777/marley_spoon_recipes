class ErrorsController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def page_400
    render '400', status: 400
  end

  def page_401
    render '401', status: 401
  end

  def page_403
    render '403', status: 403
  end

  def page_404
    render '404', status: 404
  end

  def page_429
    render '429', status: 429
  end

  def page_500
    render '500', status: 500
  end
end
