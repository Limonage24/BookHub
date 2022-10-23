require "application_system_test_case"

class ListbookgenresTest < ApplicationSystemTestCase
  setup do
    @listbookgenre = listbookgenres(:one)
  end

  test "visiting the index" do
    visit listbookgenres_url
    assert_selector "h1", text: "Listbookgenres"
  end

  test "should create listbookgenre" do
    visit listbookgenres_url
    click_on "New listbookgenre"

    fill_in "Book", with: @listbookgenre.book_id
    fill_in "Genre", with: @listbookgenre.genre_id
    click_on "Create Listbookgenre"

    assert_text "Listbookgenre was successfully created"
    click_on "Back"
  end

  test "should update Listbookgenre" do
    visit listbookgenre_url(@listbookgenre)
    click_on "Edit this listbookgenre", match: :first

    fill_in "Book", with: @listbookgenre.book_id
    fill_in "Genre", with: @listbookgenre.genre_id
    click_on "Update Listbookgenre"

    assert_text "Listbookgenre was successfully updated"
    click_on "Back"
  end

  test "should destroy Listbookgenre" do
    visit listbookgenre_url(@listbookgenre)
    click_on "Destroy this listbookgenre", match: :first

    assert_text "Listbookgenre was successfully destroyed"
  end
end
