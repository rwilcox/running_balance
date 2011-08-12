module ApplicationHelper
  def use_mobile_browsing?
    return session[:browsing_type] == "mobile" if session[:browsing_type]

    # if the user hasn't set it, do some browser sniffing
    mobile_browsers = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo",
      "plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;",
      "windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", 
      "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

    agent = request.headers["HTTP_USER_AGENT"].downcase
    mobile_browsers.each do |m|
      if agent.match(m)
        session[:browsing_type] = "mobile"
        return true
      end
    end

    return false
  end
end
