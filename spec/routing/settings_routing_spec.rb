require "spec_helper"

describe SettingsController do
  describe "routing" do
    it "routes to post :switch_browsing_type" do
      post("/settings/switch_browsing_type").should route_to("settings#switch_browsing_type")    
    end
  end
end