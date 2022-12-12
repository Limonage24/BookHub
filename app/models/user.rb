class User < ApplicationRecord
  has_secure_password
  has_many :listuserlikedbooks, dependent: :delete_all
  has_many :listuserreadbooks, dependent: :delete_all
  has_many :books, through: :listuserlikedbooks
  has_many :books, through: :listuserreadbooks
  has_many :comments, dependent: :nullify
end
