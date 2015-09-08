require "rails_helper"

RSpec.describe ItemReview, type: :feature do
  let!(:item) { create(:item) }

  it "has an assosiated item" do
    visit item_path(item)
    click_link "Review"
    within("#new_item_review") do
      fill_in "item_review_title", with: "Review title"
      fill_in "item_review_body", with: "Review body"
    end
    save_and_open_page
    click_button "Submit Review"
    expect(page).to have_content "Thank you for the review"
  end

end
