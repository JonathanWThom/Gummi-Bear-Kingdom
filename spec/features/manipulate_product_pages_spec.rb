require 'rails_helper'

describe 'the manipulate product path' do
  before() do
    @product = Product.create(name: 'Gummy1', country: 'Korea', cost: 5, image: 'image.com')
  end

  it 'will edit a product' do
    visit products_path
    click_link 'Learn More'
    click_link 'Edit This Product'
    fill_in 'Name', :with => 'Gummy2'
    click_on 'Update Product'
    expect(page).to have_content('Gummy2')
  end

  it 'will fail to edit a product' do
    visit edit_product_path(@product)
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content('errors')
  end

  it 'will delete a product' do
    visit product_path(@product)
    click_link 'Delete This Product'
    expect(page).to_not have_content('Gummy1')
  end
end
