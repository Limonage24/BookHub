require 'test_helper'

class GenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = genres(:genre1)
  end

  test 'should get index' do
    get genres_url
    assert_response :success

    assert_select 'h1', 'Список жанров'
    assert_select 'ul.genre-list' do
      assert_select 'li', Genre.count
    end
  end

  test 'should get index for admin' do
    sign_in_as(users(:admin))
    get genres_url
    assert_response :success

    assert_select 'div.admin-book-tools' do
      assert_select 'form' do
        assert_select 'button', 'Добавить новый жанр'
      end
    end
  end

  test 'should get new' do
    sign_in_as(users(:admin))

    get new_genre_url
    assert_response :success

    assert_select 'h1', 'Добавление нового жанра'
    assert_select 'form', { count: 1 }
  end

  test 'should create genre' do
    sign_in_as(users(:admin))

    assert_difference('Genre.count') do
      post genres_url, params: { genre: { name: @genre.name, description: @genre.description } }
    end

    assert_redirected_to genre_url(Genre.last)
    assert_equal 'Genre was successfully created.', flash[:notice]
  end

  test 'should not create genre with errors' do
    sign_in_as(users(:admin))

    assert_no_difference('Genre.count') do
      post genres_url, params: { genre: { name: '', description: @genre.description } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show genre' do
    get genre_url(@genre)
    assert_response :success

    assert_select 'h2', @genre.name
    assert_select 'div.genre-description', @genre.description
  end

  test 'should show genre for admin' do
    sign_in_as(users(:admin))

    get genre_url(@genre)
    assert_response :success

    assert_select 'div.admin-book-tools' do
      assert_select 'form.button_to', { count: 2 }
    end
  end

  test 'should get edit' do
    sign_in_as(users(:admin))

    get edit_genre_url(@genre)
    assert_response :success

    assert_select 'h1', 'Редактирование информации о жанре'
    assert_select 'form', { count: 1 }
  end

  test 'should update genre' do
    sign_in_as(users(:admin))

    patch genre_url(@genre), params: { genre: { name: @genre.name, description: @genre.description  } }
    assert_redirected_to genre_url(@genre)
    assert_equal 'Genre was successfully updated.', flash[:notice]
  end

  test 'should not update genre with errors' do
    sign_in_as(users(:admin))

    patch genre_url(@genre), params: { genre: { name: '', description: @genre.description } }
    assert_response :unprocessable_entity
  end

  test 'should destroy genre' do
    sign_in_as(users(:admin))

    assert_difference('Genre.count', -1) do
      delete genre_url(@genre)
    end

    assert_redirected_to genres_url
    assert_equal 'Genre was successfully destroyed.', flash[:notice]
  end
end
