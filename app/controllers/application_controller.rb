class ApplicationController < ActionController::Base
  rescue_from StandardError do |e|
    render 'errors/500', status: 500
  end

  rescue_from Contentful::BadRequest do |e|
    render 'errors/400', status: 400
  end

  rescue_from Contentful::Unauthorized do |e|
    render 'errors/401', status: 401
  end

  rescue_from Contentful::AccessDenied do |e|
    render 'errors/403', status: 403
  end

  rescue_from Contentful::NotFound do |e|
    render 'errors/404', status: 404
  end

  rescue_from Contentful::RateLimitExceeded do |e|
    render 'errors/429', status: 429
  end
end
