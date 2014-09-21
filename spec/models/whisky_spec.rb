require 'rails_helper'

RSpec.describe Whisky, :type => :model do

  before do
    @whisky = FactoryGirl.build(:whisky)
  end

  it "should have a valid factory" do
    expect(@whisky).to be_valid
  end

  # no idea how to test polymorphic associations
  it "should have a valid flavor profile" do
    whisky = FactoryGirl.create(:whisky)
    fp = FactoryGirl.create(:flavor_profile)
    fp.flavored_id = whisky.id
    fp.flavored_type = "Whisky"
    puts whisky.flavor_profile
    puts whisky.id

    expect(whisky.flavor_profile.id).to eql(fp.id)
  end
end
