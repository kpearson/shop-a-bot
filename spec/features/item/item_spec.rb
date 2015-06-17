describe "the items", :type => :feature do
  before :each do
    Item.create(:name => 'Item name', :description => 'Item description')
  end

  it "edit prosess" do
    visit '/items/1'
    within("#item") do
      fill_in 'name', :with => 'updated item name'
      fill_in 'description', :with => 'updated description'
    end
    click_button 'submit'
    expect(page).to have_content 'Success'
  end
end
