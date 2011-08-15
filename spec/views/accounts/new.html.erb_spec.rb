require 'spec_helper'

describe "accounts/new.html.erb" do
  before(:each) do
    assign(:account, stub_model(Account,
      :user_id => 1,
      :name => "MyString",
      :starting_balance => 1
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => accounts_path, :method => "post" do
      assert_select "input#account_name", :name => "account[name]"
      assert_select "input#account_starting_balance", :name => "account[starting_balance]"
    end
  end
end
