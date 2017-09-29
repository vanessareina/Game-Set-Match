require 'rails_helper'

feature "Vistor signs up as a new user" do
  scenario "specifies vaild and required information" do
    ActionMailer::Base.deliveries.clear

    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    page.select 'Male', from: 'Gender'
    page.select '4.0', from: 'Level'
    fill_in 'City', with: "Princeton"
    page.select 'NJ', from: 'State'
    page.select '18-25', from: 'Age Group'
    page.select 'Singles', from: 'Preference'
    click_button 'Sign Up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_button("Sign Out")
    expect(page).to_not have_content("Sign Up")

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end


    scenario "required information is not supplied" do
      visit root_path
      click_link 'Sign Up'

      click_button 'Sign Up'

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("can't be blank")
  end

  scenario "password confirmation does not match" do
    visit root_path
    click_link 'Sign Up'

    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'wrongpassword'
    page.select 'Male', from: 'Gender'
    page.select '4.0', from: 'Level'
    fill_in 'City', with: "Princeton"
    page.select 'NJ', from: 'State'
    page.select '18-25', from: 'Age Group'
    page.select 'Singles', from: 'Preference'
    click_button 'Sign Up'

    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Password confirmation doesn't match")
  end
end
