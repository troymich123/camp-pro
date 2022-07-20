class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :brand
  has_one_attached :image

  validates :image, presence: true
  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :brand_id
  end
  validates :gearmodel, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
