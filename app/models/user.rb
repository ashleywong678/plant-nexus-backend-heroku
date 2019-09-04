class User < ApplicationRecord
  has_secure_password
  has_many :plants

  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
