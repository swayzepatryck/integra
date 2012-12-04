class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
       render 'shared/access_denied'
       ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
       ## this render call should be:
       # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end    
  
  
  protect_from_forgery
  before_filter :authenticate_user!
  
end
