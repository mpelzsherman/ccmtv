class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_body_class

  protected

  def set_body_class
    @body_class = request.path.parameterize
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
