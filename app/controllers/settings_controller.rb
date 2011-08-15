class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def switch_browsing_type
    #session[:browsing_type] = params[:browsing_type]
    #redirect_to dashboard_path
  end
end
