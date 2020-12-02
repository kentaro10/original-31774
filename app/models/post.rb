class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_1
  belongs_to :genre_2

  
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  
end
