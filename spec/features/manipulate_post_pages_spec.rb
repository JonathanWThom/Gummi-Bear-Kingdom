require 'rails_helper'

describe 'the manipulate post pages path' do
  before() do
    @post = Post.create(title: 'The Post', author: 'Me', content: 'Great Content!', image: 'image.com')
  end

  it 'will view and edit a post' do
    visit post_path(@post)
    click_link 'Edit This Post'
    fill_in 'Title', :with => 'Definitely Not The Post'
    click_on 'Update Post'
    expect(page).to have_content('Definitely Not The Post')
  end

  it 'will fail to edit a post' do
    visit edit_post_path(@post)
    fill_in 'Title', :with => ''
    click_on 'Update Post'
    expect(page).to have_content('errors')
  end

  it 'will delete a post' do
    visit post_path(@post)
    click_link 'Delete This Post'
    expect(page).to_not have_content('This Post')
  end
end
