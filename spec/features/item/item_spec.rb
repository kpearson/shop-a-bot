describe "the items", :type => :feature do
  let(:item) { create(:item) }

  it "edit prosess" do
    visit "/items/#{item.id}"
    click_link "Edit"
    within("#item") do
      fill_in 'item_name', :with => 'updated item name'
      fill_in 'item_description', :with => 'updated description'
    end
    click_button 'Update Item'
    expect(page).to have_content 'Success'
  end

  it "create prosess" do
    visit "/items"
    click_link "New Item"
    within(".item_form") do
      fill_in 'item_name', with: "new item"
      fill_in 'item_description', with: "new item description"
    end
    click_button 'Create Item'
    expect(page).to have_content "new item"
  end
end
