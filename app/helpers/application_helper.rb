#-*- tab-width: 2; indent-tabs-mode: nil; x-auto-expand-tabs: true; x-counterpart: ../../spec/helpers/application_helper_spec.rb; x-typographers-quotes: false; -*-

module ApplicationHelper
  def use_mobile_browsing?
    return session[:browsing_type] == "mobile" if session[:browsing_type]

    # if the user hasn't set it, do some browser sniffing
    mobile_browsers = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo",
      "plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;",
      "windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone",
      "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

    agent = (request.headers["HTTP_USER_AGENT"] || "DEFAULT").downcase
    mobile_browsers.each do |m|
      if agent.match(m)
        session[:browsing_type] = "mobile"
        return true
      end
    end

    return false
  end


  def link_to_appropriate( page_name, our_options={}, link_to_options={} )
    page_path = ""
    if our_options[:desktop] || our_options[:mobile]
      page_path = ( use_mobile_browsing?() ? our_options[:mobile] : our_options[:desktop] )
    end

    link_to page_name, page_path
  end
end
