require 'rails_helper'

describe "the signin process", :type => :feature do
  let!(:user) { create :user }

  it "signs me in" do
    visit login_path
    within(".session") do
      fill_in 'Email', :with => 'alice@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome'
  end
end
