  # == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :text
#  firstname       :text
#  lastname        :text
#  email           :text
#  dob             :date
#  password_digest :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def self.search(search)
    where("username ILIKE ? OR firstname ILIKE ? OR lastname ILIKE ? OR email ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
