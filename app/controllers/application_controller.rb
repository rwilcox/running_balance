class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all

protected

  def redirect_to_target_or_default( default, options={} )
    session_return_to = session.delete(:return_to)
    session[:return_to] = nil
    redirect_to(session_return_to || params[:return_to] || default, options)
  end

  private

  def store_target_location
    session[:return_to] = request.path
  end
end
