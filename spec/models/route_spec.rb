require 'spec_helper'

describe Route do
  before(:each) do
    @attr = {
      :name => "RouteName",
      :desc => "RouteDesc"
    }
    @route1 = create(:route)
  end

  it 'should get created without error' do
    assert_nothing_raised do
      Route.create!(@attr)
    end
  end

  it 'should be able save pois for routes' do
    @route1.pois << create(:poi)
    @route1.reload
    assert_equal 1, @route1.pois.count

    @route1.pois << create(:poi)
    @route1.reload
    assert_equal 2, @route1.pois.count
  end

  it 'should delete all pois for the route when deleted' do
    poi = create(:poi)
    @route1.pois << poi
    @route1.destroy #don't reload, this will fail, it's destroyed
    assert_equal true, poi.destroyed?
  end
end
