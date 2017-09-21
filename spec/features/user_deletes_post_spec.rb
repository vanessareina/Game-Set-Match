require 'rails_helper'

feature 'user visits posts index page' do
  let!(:post) {Post.create!(title: "Friendly singles match in Philly", level: "4.0", comments: "Looking to play to practice for a tournament", city: "Philadelphia", state: "PA", date: Date.today, preference: "Singles", gender: "Female", time: "Morning", age_group: "18-25")}
  let!(:user1) {FactoryGirl.create(:user)}
  scenario 'user sees a list of posts' do
    visit posts_path
    click_on post.title

    expect(page).to have_content("Friendly singles match in Philly")
    expect(page).to have_content("Looking to play to practice for a tournament")
    expect(page).to have_content("Philadelphia")
    expect(page).to have_content("PA")
    expect(page).to have_content(Date.today)
    expect(page).to have_content("Singles")
    expect(page).to have_content("Female")
    expect(page).to have_content("Morning")
    expect(page).to have_content("18-25")
  end


  scenario "User deletes post" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link post.title
    click_button "Delete Post"

    expect(page).to_not have_content(post.title)
  end

  scenario "Un-authenticated user cannot delete posts" do
    visit root_path
    click_link post.title

  expect(page).to_not have_button("Delete This Post")

  end
end
