require 'spec_helper'

describe Poi do
  before(:each) do
    @attr = {
      :latitude  => 53.553812,
      :longitude => 9.942261,
      :street    => 'Lornsenstrasse',
      :zip       => '12345',
      :city      => 'Hamburg',
      :state     => 'Hamburg',
      :country   => 'Germany'
    }

    @poi1      = create(:poi)
    @poi2      = create(:poi)
  end

  it { should belong_to(:route) }

  it 'should not throw anything on creation' do
    assert_nothing_raised do
      Poi.create!(@attr)
    end
  end

  describe 'validations' do
    describe 'lat lng' do
      it 'should require a valid latitude between [-180,180]' do
        no_lat_poi_neg = Poi.new(@attr.merge(:latitude  => -90.1,
                                             :longitude => 0))
        no_lat_poi_neg.should_not be_valid

        no_lat_poi_pos = Poi.new(@attr.merge(:latitude  => 90.1,
                                             :longitude => 0))
        no_lat_poi_pos.should_not be_valid
      end

      it 'should require a valid longitude between [-90,90]' do
        no_lng_poi_neg = Poi.new(@attr.merge(:latitude  => 0,
                                             :longitude => -180.1))
        no_lng_poi_neg.should_not be_valid

        no_lng_poi_pos = Poi.new(@attr.merge(:latitude  => 0,
                                             :longitude => 180.1))
        no_lng_poi_pos.should_not be_valid
      end
    end
  end
end
