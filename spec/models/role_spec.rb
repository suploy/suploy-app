require 'spec_helper'

describe Role do
  it "has a number of users" do
    role = FactoryGirl.create(:role)
    role.users_count.should == 0
  end

  it "has one user assiciated if it is created" do
    role = FactoryGirl.create(:role)
    user = FactoryGirl.create(:user)
    role.users_count.should == 1 # user role is default from user created above + default created admin
  end
end
