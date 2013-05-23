# ####################################################
# CONFIG
Geocoder.configure(
  :timeout => 5,
  :lookup  => :test, #:google,
  #:api_key => "2a9fsa983jaslfj982fjasd",
  :units   => :km,
  :https => false,
  :language => :en
)

# ####################################################
# ADDRESSES
Geocoder::Lookup::Test.add_stub(
  "Lornsenstrasse 34, Hamburg, Germany", [
  {
    'latitude'  => 53.553812,
    'longitude' => 9.942261,
    'street'    => 'Lornsenstrasse',
    'zip'       => '12345',
    'city'      => 'Hamburg',
    'state'     => 'Hamburg',
    'country'   => 'Germany'
  }
])

Geocoder::Lookup::Test.add_stub(
  "Hamburg, Germany", [
  {
    'latitude'     => 51.175806,
    'longitude'    => 10.454119,
    'address'      => 'Hamburg, Germany',
    'state'        => 'Hamburg',
    'state_code'   => 'HH',
    'country'      => 'United States',
    'country_code' => 'US'
  }
])

Geocoder::Lookup::Test.add_stub(
  [53.553812, 9.942261], [
  {
    'latitude'  => 53.553812,
    'longitude' => 9.942261,
    'street'    => 'Lornsenstrasse',
    'zip'       => '12345',
    'city'      => 'Hamburg',
    'state'     => 'Hamburg',
    'country'   => 'Germany'
  }
])

# ####################################################
# SPECIALS
Geocoder::Lookup::Test.add_stub(
  [0.0, 0.0], [
  {
    'latitude'  => 0.0,
    'longitude' => 0.0
  }
])

Geocoder::Lookup::Test.add_stub(
  [0.0, 1.0], [
  {
    'latitude'  => 0.0,
    'longitude' => 1.0
  }
])

Geocoder::Lookup::Test.add_stub(
  [1.0, 0.0], [
  {
    'latitude'  => 1.0,
    'longitude' => 0.0
  }
])

Geocoder::Lookup::Test.add_stub(
  [1.0, 1.0], [
  {
    'latitude'  => 1.0,
    'longitude' => 1.0
  }
])

# ####################################################
# OUT OF RANGE
Geocoder::Lookup::Test.add_stub(
  [0.0, 180.1], [
  {
    'latitude'  => 180.1,
    'longitude' => 0.0
  }
])

Geocoder::Lookup::Test.add_stub(
  [0.0, -180.1], [
  {
    'latitude'  => -180.1,
    'longitude' => 0.0
  }
])

Geocoder::Lookup::Test.add_stub(
  [90.1, 0.0], [
  {
    'latitude'  => 0.0,
    'longitude' => 90.1
  }
])

Geocoder::Lookup::Test.add_stub(
  [-90.1, 0.0], [
  {
    'latitude'  => 0.0,
    'longitude' => -90.1
  }
])