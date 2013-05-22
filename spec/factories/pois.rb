# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poi do
    sequence(:latitude) { |n| 51.175806 + 0.01 * n}
    sequence(:longitude) { |n| 10.454119 + 0.01 * n}
    sequence(:street) { |n| "Street#{n}"}
    sequence(:zip ) { |n| "0000#{n}"}
    sequence(:city) { |n| "city#{n}"}
    sequence(:state) { |n| "state#{n}"}
    sequence(:country) { |n| "country#{n}"}
  end
end
