class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :brand
  has_one_attached :image

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end
end
