FactoryGirl.define do
  factory :post do

    title "Looking to play a match!"
    # description "Really need to practice for a tournament"
    # email {Faker::Internet.email}
    # password "password"
    # password_confirmation "password"
    # first_name "Eddie"
    # last_name "Vedder"
    level "4.0"
    city "Princeton"
    state "NJ"
    preference "Singles"
    age_group "18-25"
    gender "Female"
    time "Morning"
    date "2017-3-30"
  end
end
