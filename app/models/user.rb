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
end
