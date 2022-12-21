require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user1)
  end

  test 'should get index' do
    sign_in_as(users(:admin))
    assert_redirected_to root_url
    get users_url
    assert_response :success

    assert_select 'ul' do
      assert_select 'div', User.count
    end
  end

  test 'should get new' do
    get new_user_url
    assert_response :success

    assert_select 'h1', 'Регистрация'
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { avatar: @user.avatar, description: @user.description, password: 'secret',
                                        password_confirmation: 'secret', role: @user.role,
                                        username: "#{@user.username}2" } }
    end

    assert_redirected_to user_url(User.last)
    assert_equal 'User was successfully created.', flash[:notice]
  end

  test 'should show user' do
    sign_in_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    sign_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
    
    assert_select 'h1', 'Редактирование информации профиля'
  end

  test 'should update user' do
    sign_in_as(@user)
    patch user_url(@user), params: { user: { avatar: @user.avatar, description: @user.description, password: 'secret',
                                             password_confirmation: 'secret', role: @user.role,
                                             username: @user.username } }
    assert_redirected_to user_url(@user)
    assert_equal 'User was successfully updated.', flash[:notice]
  end

  test 'should destroy user' do
    sign_in_as(@user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_url
    assert_equal 'User was successfully destroyed.', flash[:notice]
  end

  test 'should not create user with errors' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { avatar: @user.avatar, description: @user.description, password: 'secret',
                                        password_confirmation: 'secret', role: @user.role,
                                        username: @user.username } }
    end

    assert_response :unprocessable_entity
  end

  test 'should not update user with errors' do
    sign_in_as(@user)
    patch user_url(@user), params: { user: { avatar: @user.avatar, description: @user.description, password: 'secret',
                                             password_confirmation: 'secret2', role: @user.role,
                                             username: @user.username } }

    assert_response :unprocessable_entity
  end

  test "should not create user unless it's saved" do
    assert_no_difference('User.count') do
      post users_url, params: { user: { avatar: @user.avatar, description: @user.description, password: 'secret',
                                        password_confirmation: 'secret', role: @user.role,
                                        username: @user.username } }
    end

    assert_response :unprocessable_entity
  end

  test "should get user's liked books" do
    sign_in_as(@user)
    get liked_books_user_url(@user)

    assert_response :success

    assert_select 'h1', 'Избранное'
  end

  test "should get user's read books" do
    sign_in_as(@user)
    get read_books_user_url(@user)

    assert_response :success

    assert_select 'h1', 'Прочитанные книги'
  end
end
