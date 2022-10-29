# frozen_string_literal: true

class Book < ApplicationRecord
  include ActiveModel::Validations
  has_many :listbookauthors
  has_many :listbookgenres
  has_many :listuserlikedbooks
  has_many :authors, through: :listbookauthors
  has_many :genres, through: :listbookgenres
  has_many :users, through: :listuserlikedbooks
  # accepts_nested_attributes_for :authors
  # accepts_nested_attributes_for :genres
  validates :authors, presence: true
  validates :genres, presence: true
  validate :author_validation, :genre_validation

  def genre_validation
    genres.each do |genre|
      errors.add(:genre, 'does not exist') if genre.id.nil?
    end
  end

  def author_validation
    authors.each do |author|
      errors.add(:author, 'does not exist') if author.id.nil?
    end
  end
end
