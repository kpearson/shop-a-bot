describe "the items", :type => :feature do
  before :each do
    Item.create(:name => 'Item name', :description => 'Item description')
  end

  it "edit prosess" do
    visit '/items/1'
    click_link "Edit"
    within("#item") do
      fill_in 'item_name', :with => 'updated item name'
      fill_in 'item_description', :with => 'updated description'
    end
    click_button 'Update Item'
    expect(page).to have_content 'Success'
  end
end
