# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :unit, :class => 'Units' do
    name "MyString"
  end
end
