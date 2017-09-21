require 'faker'

FactoryGirl.define do
  factory :user do
        email {Faker::Internet.email}
        password "password"
        password_confirmation "password"
        first_name "Guy"
        last_name "Fieri"
        level "4.0"
        city "Princeton"
        state "NJ"
        preference "Singles"
        age_group "pending"
        gender "female"


  end
end
