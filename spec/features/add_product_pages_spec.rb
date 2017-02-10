require 'rails_helper'

describe 'the add a product path' do
  it 'will add a product' do
    visit root_path
    click_link 'Explore Our Collection'
    click_link 'Add A New Product'
    fill_in 'Name', :with => 'Gummy1'
    fill_in 'Country of Origin', :with => 'Korea'
    fill_in 'Cost', :with => 5
    fill_in 'Image URL', :with => 'image.com'
    click_on 'Create Product'
    expect(page).to have_content('Gummy1')
  end

  it 'will fail add a product' do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content('errors')
  end
end
