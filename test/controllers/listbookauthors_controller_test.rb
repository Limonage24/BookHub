require "test_helper"

class ListbookauthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listbookauthor = listbookauthors(:one)
  end

  test "should get index" do
    get listbookauthors_url
    assert_response :success
  end

  test "should get new" do
    get new_listbookauthor_url
    assert_response :success
  end

  test "should create listbookauthor" do
    assert_difference("Listbookauthor.count") do
      post listbookauthors_url, params: { listbookauthor: { author_id: @listbookauthor.author_id, book_id: @listbookauthor.book_id } }
    end

    assert_redirected_to listbookauthor_url(Listbookauthor.last)
  end

  test "should show listbookauthor" do
    get listbookauthor_url(@listbookauthor)
    assert_response :success
  end

  test "should get edit" do
    get edit_listbookauthor_url(@listbookauthor)
    assert_response :success
  end

  test "should update listbookauthor" do
    patch listbookauthor_url(@listbookauthor), params: { listbookauthor: { author_id: @listbookauthor.author_id, book_id: @listbookauthor.book_id } }
    assert_redirected_to listbookauthor_url(@listbookauthor)
  end

  test "should destroy listbookauthor" do
    assert_difference("Listbookauthor.count", -1) do
      delete listbookauthor_url(@listbookauthor)
    end

    assert_redirected_to listbookauthors_url
  end
end
