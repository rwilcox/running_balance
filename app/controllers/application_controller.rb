class ApplicationController < ActionController::Base
  extend DelegatePresenter::ApplicationController
  include ApplicationHelper

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


=begin
  Pick the appropriate layout for this context based on if the user is mobile or desktop

  Options you can pass in to change the "appropriate" layout:

    * [:just_content] -> uses the minimal layout (meant for jQuery mobile pages
=end
  def appropriate_layout(*args)
    # TODO: Ideally I want to use the name of the current controller to look up and
    # see if we have a layout specific to that controller. For now we have a flat layout

    options = args.extract_options!

    layout_name = "application"

    if use_mobile_browsing?
      if options[:just_content] == true
        layout_name = "just_content"
      end
    end

    layout_name
  end
end
