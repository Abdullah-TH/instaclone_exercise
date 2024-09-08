class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  validates :username, presence: true, uniqueness: true

  def like!(likable)
    likes << Like.new(likable: likable)
  end

  def unlike!(likable)
    likes.where(likable_id: likable.id).delete_all
  end

  def like?(likable)
    !likes.where(likable_id: likable.id).empty?
  end
end
