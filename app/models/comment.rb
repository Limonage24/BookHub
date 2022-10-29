class Comment < ApplicationRecord
  has_one :user
  has_one :book
  has_one :reply_to, class_name: 'Comment', optional: true
end
