class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :reply_to, class_name: 'Comment'
  belongs_to :reply_to, class_name: 'Comment', optional: true
end
