class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes
  has_many :comments

  validates :username, presence: true, uniqueness: true

  def like!(post)
    likes << Like.new(likable: post)
  end

  def unlike!(post)
    likes.where(likable_id: post.id).delete_all
  end

  def like?(post)
    !likes.where(likable_id: post.id).empty?
  end
end
