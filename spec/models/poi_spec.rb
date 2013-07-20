require 'spec_helper'

describe Poi do
  before(:each) do
    @attr = {
      :latitude       => 53.553812,
      :longitude      => 9.942261,
      :position       => 1,
      :street         => 'Lornsenstrasse',
      :zip            => '12345',
      :city           => 'Hamburg',
      :state          => 'Hamburg',
      :country        => 'Germany'
    }

    @poi1 = create(:poi)
    @poi2 = create(:poi)

    @route1 = create(:route)
  end

  it { should belong_to(:route) }

  it 'should not throw anything on creation' do
    assert_nothing_raised do
      Poi.create!(@attr)
    end
  end

  describe 'validations' do
    describe 'lat lng have to be in a valid range' do
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

    describe 'no two pois with the same position are added to the same route' do
      it "should add one poi to one route" do
        @route1.pois << @poi1

        @route1.should be_valid
      end

      it "should not add the same poi to the same route" do
        first_poi = Poi.new(@attr)
        second_poi = Poi.new(@attr)

        @route1.pois << first_poi
        @route1.pois << second_poi

        @route1.should_not be_valid
      end
    end
  end
end
