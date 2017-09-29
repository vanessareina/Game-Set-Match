require 'rails_helper'

feature 'email is sent to post owner for new response', %Q{
  As the owner of an post
  I want to receive an email when someone submits a response for my post
  So I can stay respond accordingly
} do


  scenario 'Email notification successfully sent to post owner' do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    user2 = FactoryGirl.create(:user)
    ActionMailer::Base.deliveries.clear


    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password

    click_button 'Sign In'

    visit posts_path(post)
    click_on post.title
    click_button "Contact this user about playing"

    expect(page).to have_button("Contact this user about playing")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

    scenario 'Email notification available to be sent to post owner' do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post, user: user)
      ActionMailer::Base.deliveries.clear


      visit root_path
      click_link 'Sign In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Sign In'

      visit posts_path(post)
      click_on post.title

      expect(page).to_not have_button("Contact this user about playing")
    end
  end
