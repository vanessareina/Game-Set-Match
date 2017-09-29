require 'rails_helper'

feature 'user visits posts index page' do
  let!(:post) {Post.create!(title: "Friendly singles match in Philly", level: "4.0", comments: "Looking to play to practice for a tournament", city: "Philadelphia", state: "PA", date: Date.today, preference: "Singles", gender: "Female", time: "Morning", age_group: "18-25", user: user1)}
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
    expect(page).to have_content("18-25")
    expect(page).to have_content("Morning")
  end


  scenario "User visits post to edit" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link post.title
    click_button "Edit Post"

    expect(page).to have_content("Edit this post")
    expect(find_field('Title').value).to eq(post.title)
    expect(find_field('City').value).to eq(post.city)
    expect(page).to have_button("Update Post")
  end

  scenario "User edits post successful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link post.title
    click_button "Edit Post"

    fill_in "Title", with: "Edited post with user's changes!"
    click_button "Update Post"

    expect(page).to have_content("Post updated successfully")
    expect(page).to have_content("Edited post with user's changes!")
  end

  scenario "User edits post unsuccessful" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "user_password", with: user1.password
    click_button "Sign In"
    click_link post.title
    click_button "Edit Post"

    fill_in "Title", with: ""
    click_button "Update Post"

    expect(page).to have_content("Please check your edits")
  end

  scenario "Un-authenticated user cannot edit posts" do
    visit root_path
    click_link post.title

    expect(page).to_not have_button("Edit Post")
  end
end
