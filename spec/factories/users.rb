FactoryGirl.define do
  factory :user do
    name "Alice"
    email "alice@example.com"
    password 'password'
    password_confirmation 'password'
  end
end
