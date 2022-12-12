class Book < ApplicationRecord
  include ActiveModel::Validations
  has_many :listbookauthors, dependent: :delete_all
  has_many :listbookgenres, dependent: :delete_all
  has_many :listuserlikedbooks, dependent: :delete_all
  has_many :listuserreadbooks, dependent: :delete_all
  has_many :authors, through: :listbookauthors
  has_many :genres, through: :listbookgenres
  has_many :users, through: :listuserlikedbooks
  has_many :users, through: :listuserreadbooks
  has_many :comments, dependent: :delete_all
  validates :authors, presence: true
  validates :genres, presence: true
  validates :name, presence: true
end
