require 'spec_helper'

describe Activity do
  before(:each) do
    @attr = {
      :name => "Name",
      :desc => "Description "
    }
  end

  it 'should not thow anything on creation' do
    assert_nothing_raised do
      Activity.create!(@attr)
    end
  end

  describe "name" do
    it 'should be invalid without name' do
      not_named = Activity.new(@attr.merge(:name => ""))
      not_named.should_not be_valid
    end

    it 'should be valid with a name' do
      named = Activity.new(@attr)
      named.should be_valid
    end

    it 'should be unique in name' do
      named1 = Activity.create(@attr)
      named2 = Activity.create(@attr)
      named1.should be_valid
      named2.should_not be_valid
    end
  end
end
