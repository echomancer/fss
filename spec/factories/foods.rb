# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :food do
    name "MyString"
    producer nil
    upc ""
    servings "9.99"
    serving_size "9.99"
    unit nil
  end
end
