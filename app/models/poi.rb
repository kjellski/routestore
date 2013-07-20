class Poi < ActiveRecord::Base
  attr_accessible :latitude,
                  :longitude,
                  :position,
                  :zip,
                  :street,
                  :city,
                  :country,
                  :state

  validates :position,
            :uniqueness => {
             :scope => :route_id,
             :message => "The route position has to be unique for per route_id."
            },
            :numericality => {
              :greater_than_or_equal_to => 1
            },
            :presence => true

  validates :latitude,
            :numericality => {
              :greater_than_or_equal_to => -90,
              :less_than_or_equal_to    => 90
            },
            :presence     => true

  validates :longitude,
            :numericality => {
              :greater_than_or_equal_to => -180,
              :less_than_or_equal_to    => 180
            },
            :presence     => true

  after_validation :reverse_geocode

  belongs_to :route
  acts_as_list :route

private

  reverse_geocoded_by :latitude, :longitude do |poi, results|
    if geo = results.first
      poi.street  = geo.address
      poi.zip     = geo.postal_code
      poi.city    = geo.city
      poi.state   = geo.state
      poi.country = geo.country_code
    end
  end
end
