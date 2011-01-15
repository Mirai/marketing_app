require 'spec_helper'

describe User do
  before(:each) do
    @attr = { 	:name => "Example User", 
		:email => "user@example.com", 
		:address1 => "123 Fake St", 
		:address2 => "", 
		:city => "Sycamore", 
		:state => "IL", 
		:zip => "60178", 
		:company => "CadApp", 
		:subdomain => "blah.cadevent.com",
		:password => "foobar",
		:password_confirmation => "foobar" }
  end

  it "should create a new instance givin valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name_user = User.new(@attr.merge(:name => "a" * 51))
    long_name_user.should_not be_valid
  end

  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    # Put a user with given email address into the database.
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should require a address1" do
    no_address_user = User.new(@attr.merge(:address1 => ""))
    no_address_user.should_not be_valid
  end

  it "should reject address1 that is too long" do
    long_address1_user = User.new(@attr.merge(:address1 => "a" * 51))
    long_address1_user.should_not be_valid
  end

  it "should reject address2 that is too long" do
    long_address2_user = User.new(@attr.merge(:address2 => "a" * 51))
    long_address2_user.should_not be_valid
  end

  it "should require a city" do
    no_city_user = User.new(@attr.merge(:city => ""))
    no_city_user.should_not be_valid
  end

  it "should reject cities that are too long" do
    long_city_user = User.new(@attr.merge(:city => "a" * 51))
    long_city_user.should_not be_valid
  end

  it "should require a state" do
    no_state_user = User.new(@attr.merge(:state => ""))
    no_state_user.should_not be_valid
  end

  it "should reject state that is not two characters" do
    short_state_user = User.new(@attr.merge(:state => "a"))
    long_state_user = User.new(@attr.merge(:state => "aaa"))
    short_state_user.should_not be_valid
    long_state_user.should_not be_valid
  end

  it "should require a zip" do
    no_zip_user = User.new(@attr.merge(:zip => ""))
    no_zip_user.should_not be_valid
  end

  it "should reject a non-integer zip" do
    alpha_zip_user = User.new(@attr.merge(:zip => "aaaaa"))
    alpha_zip_user.should_not be_valid
  end

  it "should reject zip that is not 5 digits" do
    short_zip_user = User.new(@attr.merge(:zip => "1111"))
    long_zip_user = User.new(@attr.merge(:zip => "111111"))
    short_zip_user.should_not be_valid
    long_zip_user.should_not be_valid
  end

  it "should require a subdomain" do
    no_subdomain_user = User.new(@attr.merge(:subdomain => ""))
    no_subdomain_user.should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end

    it "should reject long passwords" do
      long = "a" * 41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:crypted_password)
    end

    it "should set the encrypted password" do
      @user.crypted_password.should_not be_blank
    end
  end

end
