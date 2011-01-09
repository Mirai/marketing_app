require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com", :address1 => "123 Fake St", :address2 => "", :city => "Sycamore", :state => "IL", :zip => 60178, :company => "CadApp", :subdomain => "blah.cadevent.com" }
  end

  it "should create a new instance givin valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require a address1" do
    no_address_user = User.new(@attr.merge(:address1 => ""))
    no_address.should_not be_valid
  end

  it "should require a city" do
    no_city_user = User.new(@attr.merge(:city => ""))
    no_city_user.should_not be_valid
  end

  it "should require a state" do
    no_state_user = User.new(@attr.merge(:state => ""))
    no_state_user.should_not be_valid
  end

  it "should require a zip" do
    no_zip_user = User.new(@attr.merge(:zip => ""))
    no_zip_user.should_not be_valid
  end

  it "should require a subdomain" do
    no_subdomain_user = User.new(@attr.merge(:subdomain => ""))
    no_subdomain_user.should_not be_valid
  end
end
