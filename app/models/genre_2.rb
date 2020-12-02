class Genre2 < ActiveHash::Base
  self.data = [
    {id:1, name: '---'},
    {id:2, name: 'お弁当' },
    {id:3, name: '和食' },
    {id:4, name: '洋食' },
    {id:5, name: '中華' },
    {id:6, name: 'その他'},
  ]
  include ActiveHash::Associations
  has_many :posts
end
