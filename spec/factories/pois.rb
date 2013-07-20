# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poi do
    sequence(:latitude)  { |n| (0.0 + n) }
    sequence(:longitude) { |n| (0.0 + n) }
    sequence(:position)  { |n| n + 1 }
    sequence(:street)    { |n| "Street#{n}" }
    sequence(:zip)       { |n| "0000#{n}" }
    sequence(:city)      { |n| "city#{n}" }
    sequence(:state)     { |n| "state#{n}" }
    sequence(:country)   { |n| "country#{n}" }

    after(:build) { |poi|
      Geocoder::Lookup::Test.add_stub([poi.latitude, poi.longitude], [
        {
          'latitude'     => poi.latitude,
          'longitude'    => poi.longitude,
          'address'      => poi.street,
          'state'         => poi.state,
          'country'       => poi.country
        }
      ])
      # puts "Geocoder::Lookup::Test.stubs: #{Geocoder::Lookup::Test.stubs.count}"
    }
  end
end
