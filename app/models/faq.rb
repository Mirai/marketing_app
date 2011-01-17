class Faq < ActiveRecord::Base
  before_create :update_position

  attr_accessible :question, :answer, :position

  def update_position
    self.position = Faq.count + 1
  end

  def self.positions
    positions = []
    (1..self.count).each do |n|
      positions << n.to_s
    end
  end
end
