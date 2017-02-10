class Post < ActiveRecord::Base
  validates :title, :author, :content, :image, :presence => true
end
