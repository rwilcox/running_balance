require 'spec_helper'

describe "accounts/index.html.erb" do
  include Devise::TestHelpers

  before(:each) do
    @current_user = User.make!
    sign_in @current_user

    assign(:accounts, [
      stub_model(Account,
        :user_id => @current_user.id,
        :name => "Name",
        :starting_balance => 1
      ),
      stub_model(Account,
        :user_id => @current_user.id,
        :name => "Name",
        :starting_balance => 1
      )
    ])
  end

=begin
  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
=end
end
