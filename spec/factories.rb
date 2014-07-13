# This will guess the User class
FactoryGirl.define do
  factory :user do
		email "user@example.com"
		password "password"
		steps_today 0
		steps_month 0
  end
end

