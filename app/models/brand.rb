class Brand < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'Coleman' }, 
    { id: 3, name: 'THE NORTH FACE' }, 
    { id: 4, name: 'GREGORY' },
    { id: 5, name: 'Snow Peak' },
    { id: 6, name: 'CAPTAIN STAG' },
  ]

  include ActiveHash::Associations
  has_many :posts
end