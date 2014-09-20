require 'rails_helper'

RSpec.describe User, :type => :model do

  before do
    @user = FactoryGirl.build(:user)
  end

  it "should have a valid factory" do
    expect(@user).to be_valid
  end

  it "should not allow invalid email addresses" do
    @user.email = "jimmy"
    @user.should_not be_valid
  end

  it "should not allow invalid password" do
    @user.password = "123"
    @user.should_not be_valid
  end

  it "should take a scotch producer as a favorite" do
    user = FactoryGirl.create(:user)
    producer = FactoryGirl.create(:producer)

    user.producers << producer
    expect(user.producers.size).to eql(1)
  end

  it "should take a whisky as a favorite" do
    user = FactoryGirl.create(:user)
    whisky = FactoryGirl.create(:whisky)

    user.whiskies << whisky
    expect(user.whiskies.size).to eql(1)
  end
end
