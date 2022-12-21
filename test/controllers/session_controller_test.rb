require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  teardown do
    Rails.cache.clear
  end

  test 'should get login' do
    get session_login_url
    assert_response :success

    assert_select 'h1', 'Вход в систему'
  end

  test 'should create session' do
    get session_create_url, params: { login: 'admin', password: 'admin' }
    assert_redirected_to root_url
    assert_not cookies[:user_id].nil?
  end

  test 'should not create session with incorrect params' do
    get session_create_url, params: { login: 'admin', password: 'admin1' }
    assert_redirected_to session_login_url
    assert cookies[:user_id].nil?
    assert_equal 'Incorrect login or password, try again', flash[:alert]
  end

  test 'should get logout' do
    sign_in_as(users(:user1))

    get session_logout_url
    assert_redirected_to root_url
  end
end
