require 'rails_helper'

RSpec.describe Producer, :type => :model do
  before do
    @producer = FactoryGirl.build(:producer)
  end

  it "should have a valid factory" do
    expect(@producer).to be_valid
  end

  it "should require a name" do
    @producer.name = nil
    @producer.should_not be_valid
  end

  # add polymorophic test
end
