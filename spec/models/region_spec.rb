require 'rails_helper'

RSpec.describe Region, :type => :model do

  before do
    @region = FactoryGirl.build(:region)
  end

  it "should have a valid factory" do
    expect(@region).to be_valid
  end

  it "should require a name" do
    @region.name = nil
    @region.should_not be_valid
  end
end
