class Route < ActiveRecord::Base
  attr_accessible :desc, :name

  has_many :pois, 
           :order => :position,
           :dependent => :destroy
end