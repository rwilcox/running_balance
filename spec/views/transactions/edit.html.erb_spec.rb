require 'spec_helper'

describe "transactions/edit.html.erb" do
  before(:each) do
    @account = stub_model(Account, :name => "Hello World")
    @transaction = assign(:transaction, stub_model(Transaction,
      :account => @account,
      :amount => 1.5,
      :description => "MyString"
    ))

    view.should_receive(:current_account).at_least(1).times.and_return(@account)
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_transactions_path(@account, @transaction), :method => "post" do
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_description", :name => "transaction[description]"
    end
  end
end
