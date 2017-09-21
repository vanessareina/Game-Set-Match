require 'rails_helper'

feature 'user visits posts index page' do
  let!(:post) {Post.create!(title: "Friendly singles match in Philly", level: "4.0", comments: "Looking to play to practice for a tournament", city: "Philadelphia", state: "PA", date: Date.today, preference: "Singles", gender: "Female", time: "Morning", age_group: "18-25")}
  scenario "user sees a list of posts" do
    visit posts_path
    click_on post.title

    expect(page).to have_content("Friendly singles match in Philly")
    expect(page).to have_content("Looking to play to practice for a tournament")
    expect(page).to have_content("Philadelphia")
    expect(page).to have_content("PA")
    expect(page).to have_content(Date.today)
    expect(page).to have_content("Singles")
    expect(page).to have_content("Morning")
    expect(page).to have_content("18-25")
    expect(page).to have_content("Female")
  end
end
