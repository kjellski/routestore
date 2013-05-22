require 'spec_helper'

describe Poi do
    before(:each) do
        @poi       = create(:poi)
        @poi_attrs = {
            :latitude  => 53.553812,
            :longitude => 9.942261,
            :street    => "Lornsenstrasse",
            :zip       => "12345",
            :city      => "Hamburg",
            :state     => "Hamburg",
            :country   => "Germany"
        }
    end

    it "should not throw anything on creation" do
        assert_nothing_raised do
            Poi.create!(@poi_attrs)
        end
    end

    describe "lat lng" do
        it "should require a valid latitude between [-180,180]" do
            no_lat_poi_neg = Poi.new(@poi_attrs.merge(:latitude => -180.01))
            no_lat_poi_neg.should_not be_valid

            no_lat_poi_pos = Poi.new(@poi_attrs.merge(:latitude => 180.01))
            no_lat_poi_pos.should_not be_valid
        end

        it "should require a valid longitude between [-90,90]" do
            no_lng_poi_neg = Poi.new(@poi_attrs.merge(:latitude => -90.01))
            no_lng_poi_neg.should_not be_valid

            no_lng_poi_pos = Poi.new(@poi_attrs.merge(:latitude => 90.01))
            no_lng_poi_pos.should_not be_valid
        end

        it "uses geocoding for reverse geocoding" do
            lornsenstrasse = Poi.new(@poi_attrs.merge(:street  => "",
                                                      :zip     => "",
                                                      :city    => "",
                                                      :state   => "",
                                                      :country => ""))
            lornsenstrasse.should be_valid
            assert_not_equal lornsenstrasse.street, ""
            assert_match /Lornsenstra/, lornsenstrasse.street

            assert_not_equal lornsenstrasse.zip, ""
            assert_match /22767/, lornsenstrasse.zip

            assert_not_equal lornsenstrasse.city, ""
            assert_match /Hamburg/, lornsenstrasse.city

            assert_not_equal lornsenstrasse.state, ""
            assert_match /Hamburg/, lornsenstrasse.state

            assert_not_equal lornsenstrasse.country, ""
            assert_match /DE/, lornsenstrasse.country
        end
    end
end
