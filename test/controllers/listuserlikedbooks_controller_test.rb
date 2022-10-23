require "test_helper"

class ListuserlikedbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listuserlikedbook = listuserlikedbooks(:one)
  end

  test "should get index" do
    get listuserlikedbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_listuserlikedbook_url
    assert_response :success
  end

  test "should create listuserlikedbook" do
    assert_difference("Listuserlikedbook.count") do
      post listuserlikedbooks_url, params: { listuserlikedbook: { book_id: @listuserlikedbook.book_id, user_id: @listuserlikedbook.user_id } }
    end

    assert_redirected_to listuserlikedbook_url(Listuserlikedbook.last)
  end

  test "should show listuserlikedbook" do
    get listuserlikedbook_url(@listuserlikedbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_listuserlikedbook_url(@listuserlikedbook)
    assert_response :success
  end

  test "should update listuserlikedbook" do
    patch listuserlikedbook_url(@listuserlikedbook), params: { listuserlikedbook: { book_id: @listuserlikedbook.book_id, user_id: @listuserlikedbook.user_id } }
    assert_redirected_to listuserlikedbook_url(@listuserlikedbook)
  end

  test "should destroy listuserlikedbook" do
    assert_difference("Listuserlikedbook.count", -1) do
      delete listuserlikedbook_url(@listuserlikedbook)
    end

    assert_redirected_to listuserlikedbooks_url
  end
end
