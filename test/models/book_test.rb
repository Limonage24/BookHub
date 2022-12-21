require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "shouldn't create Book without name" do
    book = Book.new
    book.genres << genres(:genre1)
    book.authors << authors(:author1)
    assert_not book.save
  end

  test "shouldn't create Book without author" do
    book = Book.new
    book.name = 'Hamlet'
    book.genres << genres(:genre1)
    assert_not book.save
  end

  test "shouldn't create Book without genre" do
    book = Book.new
    book.name = 'Hamlet'
    book.authors << authors(:author1)
    assert_not book.save
  end

  test 'should create Book with name, author and genre' do
    book = Book.new
    book.name = 'Hamlet'
    book.authors << authors(:author1)
    book.genres << genres(:genre1)
    assert book.save
  end
end
