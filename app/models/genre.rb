class Genre < ApplicationRecord
  has_many :listbookgenres
  has_many :books, through: :listbookgenres
  validates :name, presence: true
end
