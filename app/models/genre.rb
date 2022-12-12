class Genre < ApplicationRecord
  has_many :listbookgenres, dependent: :delete_all
  has_many :books, through: :listbookgenres
  validates :name, presence: true
end
