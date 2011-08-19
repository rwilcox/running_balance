require 'spec_helper'

describe "transactions/index.html.erb" do
  before(:each) do
    @account = stub_model(Account, :name => "Test Account")
    assign(:transactions, [
      stub_model(Transaction,
        :account => @account,
        :amount => 1.5,
        :description => "Description"
      ),
      stub_model(Transaction,
        :account => @account,
        :amount => 1.5,
        :description => "Description"
      )
    ])

    view.should_receive(:current_account).at_least(1).times.and_return(@account)
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Test Account", :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
