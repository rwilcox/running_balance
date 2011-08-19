require 'spec_helper'

describe Account do
  it { should belong_to(:user) }
  it { should have_many(:transactions) }
end
