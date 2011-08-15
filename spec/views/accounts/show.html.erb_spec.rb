require 'spec_helper'

describe "accounts/show.html.erb" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :user_id => 1,
      :name => "Name",
      :starting_balance => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
