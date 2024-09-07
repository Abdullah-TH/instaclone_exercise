class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, dependent: :destroy
end
