json.extract! comment, :id, :user_id, :book_id, :reply_to, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
