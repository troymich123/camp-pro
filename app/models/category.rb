class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'テント、タープ' }, 
    { id: 3, name: 'ライト、ランタン' }, 
    { id: 4, name: 'ストーブ、コンロ' },
    { id: 5, name: '寝袋、寝具' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end