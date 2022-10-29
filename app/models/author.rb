class Author < ApplicationRecord
  has_many :listbookauthors
  has_many :books, through: :listbookauthors
  validates :name, presence: true
end
