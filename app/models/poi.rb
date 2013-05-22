class Poi < ActiveRecord::Base
    attr_accessible :latitude, :longitude, :zip, :street, :city, :country, :state

    validates :latitude,
        :numericality => {
            :greater_than_or_equal_to => -180,
            :less_than_or_equal_to => 180
        },
        :presence => true

    validates :latitude,
              :numericality => {
                  :greater_than_or_equal_to => -90,
                  :less_than_or_equal_to => 90
              },
              :presence => true

    reverse_geocoded_by :latitude, :longitude do |poi, results|
        if geo = results.first
            poi.street  = geo.address
            poi.zip     = geo.postal_code
            poi.city    = geo.city
            poi.state   = geo.state
            poi.country = geo.country_code
        end
    end

    after_validation :reverse_geocode
end
