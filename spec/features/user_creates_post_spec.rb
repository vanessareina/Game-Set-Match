require 'rails_helper'

feature "User creates new post" do
  let!(:user1) {FactoryGirl.create(:user)}

  scenario "User visits create page" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_button "Create New Post"

    expect(page).to have_content("Play Some Tennis!")
    expect(page).to have_button("Post")
  end



  scenario "Un-authenticated user cannot create posts" do
    visit root_path

    expect(page).to_not have_button("Create New Post")
  end
end
