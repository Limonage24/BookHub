require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book1)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should get new' do
    sign_in_as(users(:admin))

    get new_book_url
    assert_response :success
  end

  test 'should create book' do
    sign_in_as(users(:admin))

    assert_difference('Book.count') do
      post books_url, params: { book: { cover: @book.cover, description: @book.description, name: @book.name },
                                authors_attributes: [{ name: authors(:author1).name }],
                                genres_attributes: [{ name: genres(:genre1).name }] }
    end

    assert_redirected_to book_url(Book.last)
    assert_equal 'Book was successfully created.', flash[:notice]
  end

  test 'should not create book with errors' do
    sign_in_as(users(:admin))

    assert_no_difference('Book.count') do
      post books_url, params: { book: { cover: @book.cover, description: @book.description, name: '' },
                                authors_attributes: [{ name: authors(:author1).name }],
                                genres_attributes: [{ name: genres(:genre1).name }] }
    end

    assert_response :unprocessable_entity
  end

  test 'should show book without comments' do
    get book_url(@book)
    assert_response :success
  end

  test 'should show book with comments without' do
    @book = books(:book2)

    get book_url(@book)
    assert_response :success
  end

  test 'should show book with comments and replies' do
    @book = books(:book3)

    get book_url(@book)
    assert_response :success
  end

  test 'should get edit' do
    sign_in_as(users(:admin))

    get edit_book_url(@book)
    assert_response :success
  end

  test 'should update book' do
    sign_in_as(users(:admin))

    patch book_url(@book), params: { book: { cover: @book.cover, description: @book.description, name: @book.name },
                                     authors_attributes: [{ name: authors(:author1).name }],
                                     genres_attributes: [{ name: genres(:genre1).name }] }
    assert_redirected_to book_url(@book)
    assert_equal 'Book was successfully updated.', flash[:notice]
  end

  test 'should not update book with errors' do
    sign_in_as(users(:admin))

    patch book_url(@book), params: { book: { cover: @book.cover, description: @book.description, name: '' },
                                     authors_attributes: [{ name: authors(:author1).name }],
                                     genres_attributes: [{ name: genres(:genre1).name }] }
    assert_response :unprocessable_entity
  end

  test 'should destroy book' do
    sign_in_as(users(:admin))

    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
    assert_equal 'Book was successfully destroyed.', flash[:notice]
  end

  test 'should search for book' do
    get search_books_url, params: { search_request: { book_name: 'мир' } }
    assert_response :success
  end

  test 'should like book by user (book is not liked yet)' do
    user = users(:user1)
    sign_in_as(user)
    assert_difference('Listuserlikedbook.count') do
      post like_book_url(@book), params: { book_liked: { already_liked: false }, user: { id: user.id }}
    end
    assert_redirected_to book_url(@book)
  end

  test 'should dislike book by user (book is already liked)' do
    user = users(:admin)
    sign_in_as(user)
    assert_difference('Listuserlikedbook.count', -1) do
      post like_book_url(@book), params: { book_liked: { already_liked: true }, user: { id: user.id } }
    end

    assert_redirected_to book_url(@book)
  end

  test 'should mark as read book by user (book is not marked yet)' do
    user = users(:user1)
    sign_in_as(user)

    assert_difference('Listuserreadbook.count') do
      post read_book_url(@book), params: { book_read: { already_read: false }, user: { id: user.id }}
    end
    assert_redirected_to book_url(@book)
  end

  test 'should unmark as read book by user (book is already marked)' do
    user = users(:user2)
    sign_in_as(user)

    assert_difference('Listuserreadbook.count', -1) do
      post read_book_url(@book), params: { book_read: { already_read: true }, user: { id: user.id }}
    end
    assert_redirected_to book_url(@book)
  end
end
