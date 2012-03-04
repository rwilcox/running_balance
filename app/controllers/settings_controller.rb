#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../spec/controllers/settings_controller_spec.rb; x-typographers-quotes: false; -*-

class SettingsController < ApplicationController
  before_filter :authenticate_user!, except: [:switch_browsing_type]

  def switch_browsing_type
    session[:browsing_type] = params[:browsing_type]
    redirect_to dashboard_path
  end

  def my;
  end

  def filter_transactions_to_previous_month
    session[:filter_transactions] = (params[:filter_transactions] == "true")
    redirect_to dashboard_path
  end
end
