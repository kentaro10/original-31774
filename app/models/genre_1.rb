class Genre1 < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '飲食店'},
    {id: 3, name: '手作り'},
    {id: 4, name: 'コンビニ・スーパー'},
    {id: 5, name: 'その他'},
  ]
  include ActiveHash::Associations
  has_many :posts
end
