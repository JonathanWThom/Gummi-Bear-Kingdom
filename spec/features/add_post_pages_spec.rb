require 'rails_helper'

describe 'the add a post path' do
  it 'will add a post' do
    visit root_path
    click_link 'Blog'
    click_link 'Add A New Post'
    fill_in 'Title', :with => 'Blog Title'
    fill_in 'Author', :with => 'Me'
    fill_in 'Content', :with => 'Blog Content'
    fill_in 'Image URL', :with => 'image.com'
    click_on 'Create Post'
    expect(page).to have_content('Blog Title')
  end

  it 'will fail to add a post' do
    visit new_post_path
    click_on 'Create Post'
    expect(page).to have_content('errors')
  end
end
