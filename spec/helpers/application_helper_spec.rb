#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../app/helpers/application_helper.rb; x-typographers-quotes: false; -*-

require 'spec_helper'

describe ApplicationHelper do

  context "link_to_appropriate" do
    it "selects the desktop version of the path if we are in desktop mode" do
      self.should_receive(:use_mobile_browsing?).and_return(false)  # SELF is the helper object I guess.
      # Reference: <http://openmonkey.com/2008/03/19/mocking-out-your-rails-helpers-in-helper-specs/>

      result = link_to_appropriate( "Page Title", desktop: "desktop_url", mobile: "mobile_url" )
      result.should == "<a href=\"desktop_url\">Page Title</a>"
    end

    it "selects the mobile version of the ptah if we are in mobile mode" do
      self.should_receive(:use_mobile_browsing?).and_return(true)

      result = link_to_appropriate( "Page Title", desktop: "desktop_url", mobile: "mobile_url" )
      result.should == "<a href=\"mobile_url\">Page Title</a>"
    end
  end
end
