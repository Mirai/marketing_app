# == Schema Information
# Schema version: 20110115053421
#
# Table name: users
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  email             :string(255)
#  address1          :string(255)
#  address2          :string(255)
#  city              :string(255)
#  state             :string(255)
#  zip               :string(255)
#  company           :string(255)
#  subdomain         :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  roles_mask        :integer
#

class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :name, :email, :address1, :address2, :city, :state, :zip, :company, :subdomain, :password, :password_confirmation, :roles_mask

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

  validates :password,	:presence => true,
			:confirmation => true,
			:length => { :within => 6..40 }

  scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  ROLES = %w[admin]

  def role_symbols
    roles.map(&:to_sym)
  end

  def roles=(roles)  
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
    puts self.roles_mask
  end  
  
  def roles  
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }  
  end

  def role?(role)
    roles.include? role.to_s
  end
end
