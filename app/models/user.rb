# == Schema Information
# Schema version: 20110109140402
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :integer
#  company    :string(255)
#  subdomain  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :address1, :address2, :city, :state, :zip, :company, :subdomain

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, 	:presence => true,
			:length => { :maximum => 50 }

  validates :email, 	:presence => true,
			:format => { :with => email_regex },
			:uniqueness => { :case_sensitive => false }

  validates :address1, 	:presence => true,
			:length => { :maximum => 50 }

  validates :address2, 	:length => { :maximum => 50 }

  validates :city, 	:presence => true,
			:length => { :maximum => 50 }

  validates :state, 	:presence => true,
			:length => { :is => 2 }

  validates :zip, 	:presence => true,
			:numericality => true,
			:length => { :is => 5 }

  validates :subdomain, :presence => true
end
