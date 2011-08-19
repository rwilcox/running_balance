require 'spec_helper'

describe "transactions/show.html.erb" do
  before(:each) do
    @account = stub_model(Account, name: "Test Account")
    @transaction = assign(:transaction, stub_model(Transaction,
      :account => @account,
      :account_name => @account.name,
      :amount => 1.5,
      :description => "Description"
    ))

    view.should_receive(:current_account).at_least(1).times.and_return(@account)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Test Account/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1.5/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
