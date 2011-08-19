require "spec_helper"

describe TransactionsController do
  describe "routing with the account namespace" do
   it "routes to #index" do
      get("/accounts/47/transactions").should route_to("transactions#index", :account_id => "47")
    end

    it "routes to #new" do
      get("/accounts/47/transactions/new").should route_to("transactions#new", :account_id => "47")
    end

    it "routes to #edit" do
      get("/accounts/17/transactions/1/edit").should route_to("transactions#edit", :id => "1", :account_id => "17")
    end

    it "routes to #create" do
      post("/accounts/1/transactions").should route_to("transactions#create", :account_id => "1")
    end

    it "routes to #update" do
      put("/accounts/27/transactions/1").should route_to("transactions#update", :id => "1", :account_id => "27")
    end

    it "routes to #destroy" do
      delete("/accounts/27/transactions/1").should route_to("transactions#destroy", :id => "1", :account_id => "27")
    end
  
  end
end
