class Route < ActiveRecord::Base
  attr_accessible :desc, :name

  has_many :pois, :dependent => :destroy
end
