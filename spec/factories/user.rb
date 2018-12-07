FactoryGirl.define do
  factory :user do
    name "Test User"
    email "Unique@email.com"
    phone "1234567890"
    address "Ngu Hanh Son, Da Nang"
    password "123456"
    password_confirmation "123456"
  end
end
