require 'rails_helper'

feature 'user visits posts index page' do
let!(:post) {Post.create!(title: "Friendly singles match in Philly", level: "4.0", comments: "Looking to play to practice for a tournament", city: "Philadelphia", state: "PA", date: Date.today, preference: "Singles", gender: "Female", time: "Morning", age_group: "18-25")}

    scenario 'user sees a list of posts' do
    visit posts_path

    expect(page).to have_content("Friendly singles match")
  end
end
