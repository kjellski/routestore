class Activity < ActiveRecord::Base
  attr_accessible :name, :desc

  validates :name,
            :presence => true,
            :length => { :in => 2..24 },
            :allow_blank => false,
            :uniqueness => true
end
