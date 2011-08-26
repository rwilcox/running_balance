class DashboardController < ApplicationController

  def index
    store_target_location
    @include_recent_transactions = true

    respond_to do |format|
      format.html 
      format.json
      format.xml
    end
  end

end
