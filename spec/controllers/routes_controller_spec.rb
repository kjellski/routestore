require 'spec_helper'

describe RoutesController do

  before (:each) do
    @empty_route = create(:route)
    @one_poi_route = create(:route)
    @one_poi_route.pois << create(:poi, :route => @one_poi_route)
    
  end

  describe "GET 'index'" do    
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should list all routes" do
      get :index
      assigns(:routes).should == Route.all
    end
  end

  describe "GET 'show'" do 
    it "should be successful" do
      get :index, :id => @empty_route.id
      response.should be_success
    end
    
    
    it "should find the right route" do
      get :show, :id => @empty_route.id
      assigns(:route).should == @empty_route
    end
  end
end
