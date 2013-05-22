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

  it 'should be invalid without name' do
    not_named = Activity.new(@attr.merge(:name => ""))
    not_named.should_not be_valid
  end

  it 'should be valid with a name' do
    named = Activity.new(@attr)
    named.should be_valid
  end
end
