class Activity < ActiveRecord::Base
  attr_accessible :name, :desc

  validates_presence_of :name, :lenght => { :in => 2..24 }

  after_validation { |n| puts n.inspect }
end
