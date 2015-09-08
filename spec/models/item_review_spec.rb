require 'rails_helper'

RSpec.describe ItemReview, type: :model do
  let!(:item) { create(:item) }

  it 'has a title' do
    review = ItemReview.new(body: "Review description", item: item)
    expect(review).not_to be_valid
    review.title = "Review title"
    expect(review).to be_valid
  end

  it 'has a body' do
    review = ItemReview.new(title: "Review title", item: item)
    expect(review).not_to be_valid
    review.body = "Review body"
    expect(review).to be_valid
  end

  it 'has an assosiated item' do
    review = ItemReview.new(title: "Review title", body: " Review body")
    expect(review).not_to be_valid
    review.item = item
    expect(review).to be_valid
  end
end
