require "test_helper"

class ListbookgenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @listbookgenre = listbookgenres(:one)
  end

  test "should get index" do
    get listbookgenres_url
    assert_response :success
  end

  test "should get new" do
    get new_listbookgenre_url
    assert_response :success
  end

  test "should create listbookgenre" do
    assert_difference("Listbookgenre.count") do
      post listbookgenres_url, params: { listbookgenre: { book_id: @listbookgenre.book_id, genre_id: @listbookgenre.genre_id } }
    end

    assert_redirected_to listbookgenre_url(Listbookgenre.last)
  end

  test "should show listbookgenre" do
    get listbookgenre_url(@listbookgenre)
    assert_response :success
  end

  test "should get edit" do
    get edit_listbookgenre_url(@listbookgenre)
    assert_response :success
  end

  test "should update listbookgenre" do
    patch listbookgenre_url(@listbookgenre), params: { listbookgenre: { book_id: @listbookgenre.book_id, genre_id: @listbookgenre.genre_id } }
    assert_redirected_to listbookgenre_url(@listbookgenre)
  end

  test "should destroy listbookgenre" do
    assert_difference("Listbookgenre.count", -1) do
      delete listbookgenre_url(@listbookgenre)
    end

    assert_redirected_to listbookgenres_url
  end
end
