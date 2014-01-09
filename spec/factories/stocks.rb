# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    food nil
    price "9.99"
    quantity "9.99"
    store nil
    discount "9.99"
    bought "2014-01-08 22:44:59"
    user nil
  end
end
