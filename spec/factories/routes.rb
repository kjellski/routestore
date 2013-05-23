# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :route do
    sequence(:name) { |n| "name#{n}" }
    sequence(:desc) { |n| "desc#{n}" }
  end
end
