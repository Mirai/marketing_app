# == Schema Information
# Schema version: 20110121053026
#
# Table name: contacts
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  phone      :string(255)
#  message    :string(255)
#  respond    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :message, :respond

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,      :presence => true,
                        :length => { :maximum => 50 }

  validates :email,     :presence => true,
                        :format => { :with => email_regex }

  validates :message,  :presence => true
end
