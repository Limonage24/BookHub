class User < ApplicationRecord
  has_secure_password
  has_many :listuserlikedbooks
  has_many :books, through: :listuserlikedbooks
end
