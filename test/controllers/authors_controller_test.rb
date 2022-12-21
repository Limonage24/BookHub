require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:author1)
  end

  test 'should get index' do
    get authors_url
    assert_response :success

    assert_select 'h1', 'Список авторов'
    assert_select 'ul.author-list' do
      assert_select 'li', Author.count
    end
  end

  test 'should get index for admin' do
    sign_in_as(users(:admin))
    get authors_url
    assert_response :success

    assert_select 'div.admin-book-tools' do
      assert_select 'form' do
        assert_select 'button', 'Добавить нового автора'
      end
    end
  end

  test 'should get new' do
    sign_in_as(users(:admin))

    get new_author_url
    assert_response :success

    assert_select 'h1', 'Добавление нового автора'
    assert_select 'form', { count: 1 }
  end

  test 'should create author' do
    sign_in_as(users(:admin))

    assert_difference('Author.count') do
      post authors_url, params: { author: { description: @author.description, name: @author.name } }
    end

    assert_redirected_to author_url(Author.last)
    assert_equal 'Author was successfully created.', flash[:notice]
  end

  test 'should not create author with errors' do
    sign_in_as(users(:admin))

    assert_no_difference('Author.count') do
      post authors_url, params: { author: { description: @author.description, name: '' } }
    end

    assert_response :unprocessable_entity
  end

  test 'should show author' do
    get author_url(@author)
    assert_response :success

    assert_select 'h2', @author.name
    assert_select 'div.author-description', @author.description
  end

  test 'should show author for admin' do
    sign_in_as(users(:admin))

    get author_url(@author)
    assert_response :success

    assert_select 'div.admin-book-tools' do
      assert_select 'form.button_to', { count: 2 }
    end
  end

  test 'should get edit' do
    sign_in_as(users(:admin))

    get edit_author_url(@author)
    assert_response :success

    assert_select 'h1', 'Редактирование информации об авторе'
    assert_select 'form', { count: 1 }
  end

  test 'should update author' do
    sign_in_as(users(:admin))

    patch author_url(@author), params: { author: { description: @author.description, name: @author.name } }
    assert_redirected_to author_url(@author)
    assert_equal 'Author was successfully updated.', flash[:notice]
  end

  test 'should not update author with errors' do
    sign_in_as(users(:admin))

    patch author_url(@author), params: { author: { description: @author.description, name: '' } }
    assert_response :unprocessable_entity
  end

  test 'should destroy author' do
    sign_in_as(users(:admin))

    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
    assert_equal 'Author was successfully destroyed.', flash[:notice]
  end
end
