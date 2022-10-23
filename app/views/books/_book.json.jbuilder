json.extract! book, :id, :name, :description, :cover
json.url book_url(book, format: :json)
