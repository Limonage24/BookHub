class Author < ApplicationRecord
  has_many :listbookauthors, dependent: :delete_all
  has_many :books, through: :listbookauthors, dependent: :destroy
  validates :name, presence: true
end
