require 'spec_helper'

describe Route do
  before(:each) do
    @attr = {
      :name => "RouteName",
      :desc => "RouteDesc"
    }

    @route1 = create(:route)
    @poi1   = Poi.create({ :latitude       => 0.0,
                           :longitude      => 0.0,
                           :position => 1 })
    @poi2   = Poi.create({ :latitude       => 0.0,
                           :longitude      => 0.0,
                           :position => 2 })
    @poi3   = Poi.create({ :latitude       => 0.0,
                           :longitude      => 0.0,
                           :position => 3 })
  end

  it 'should get created without error' do
    assert_nothing_raised do
      Route.create!(@attr)
    end
  end

  it 'should be able save pois for routes' do
    @route1.pois << create(:poi, :route => @route1)
    @route1.reload
    assert_equal 1, @route1.pois.count

    @route1.pois << create(:poi, :route => @route1)
    @route1.reload
    assert_equal 2, @route1.pois.count
  end

  it 'should delete all pois for the route when deleted' do
    poi = create(:poi, :route => @route1)
    @route1.pois << poi
    @route1.destroy #don't reload, this will fail, it's destroyed
    assert_equal true, poi.destroyed?
  end

  it 'should add first poi with position 1' do
    assert_nothing_raised do
      @route1.pois << @poi1
    end
  end
end
