class Post < ActiveRecord::Base
  validates :name, presence: {message: 'Please write name'}
  validates :content, presence: { message: 'Please write content.'}
  has_many :comments
end
