#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../spec/controllers/settings_controller_spec.rb; x-typographers-quotes: false; -*-

class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def switch_browsing_type
    session[:browsing_type] = params[:browsing_type]
    redirect_to dashboard_path
  end
end
