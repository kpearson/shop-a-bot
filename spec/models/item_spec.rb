require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a name' do
    item = Item.create(name: "item 1", description: "item 1 description")
    expect(item).to be_valid
  end

  it 'has a name' do
    item = Item.create(name: "item 1", description: "item 1 description")
    expect(item.name).to eq "item 1"
  end
end
