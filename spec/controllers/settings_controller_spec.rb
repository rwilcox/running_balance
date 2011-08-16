#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../app/controllers/settings_controller.rb; x-typographers-quotes: false; -*-

require 'spec_helper'

describe SettingsController do

  describe "without a user account" do
    it "redirects to the sign in page" do
      post :switch_browsing_type, browsing_type: "mobile"
      response.should redirect_to(new_user_session_path)

      session[:browsing_type].should be_nil
    end    
  end

  describe "with a logged in user account" do
    before(:each) do
      @current_user = User.make!

      sign_in @current_user

      post :switch_browsing_type, browsing_type: "mobile"
    end

    it "saves the new value in the session" do
      session[:browsing_type].should == "mobile"
    end
    
    it "redirects to the dashboard" do
      response.should redirect_to( dashboard_path )
    end
  end
end
