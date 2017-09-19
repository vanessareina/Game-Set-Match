require 'rails_helper'

feature 'user visits posts index page' do
  before(:each) do
    Post.create(name: "Friendly singles match in Philly", city: "Philadelphia", state: "PA", date: Date.today, preference: "Singles", time: "Morning")
  end
  scenario 'user sees a list of posts' do
    visit posts_path

    expect(page).to have_content("Friendly singles match in Philly")
  end
end
