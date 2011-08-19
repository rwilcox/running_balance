require 'spec_helper'

describe "transactions/new.html.erb" do
  before(:each) do
    @account = stub_model(Account, :name => "Hello World")
    assign(:transaction, stub_model(Transaction,
      :account => @account,
      :amount => 1.5,
      :description => "MyString"
    ).as_new_record)

    view.should_receive(:current_account).at_least(1).times.and_return(@account)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_transactions_path(@account), :method => "post" do
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_description", :name => "transaction[description]"
    end
  end
end
