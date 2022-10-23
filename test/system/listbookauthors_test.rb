require "application_system_test_case"

class ListbookauthorsTest < ApplicationSystemTestCase
  setup do
    @listbookauthor = listbookauthors(:one)
  end

  test "visiting the index" do
    visit listbookauthors_url
    assert_selector "h1", text: "Listbookauthors"
  end

  test "should create listbookauthor" do
    visit listbookauthors_url
    click_on "New listbookauthor"

    fill_in "Author", with: @listbookauthor.author_id
    fill_in "Book", with: @listbookauthor.book_id
    click_on "Create Listbookauthor"

    assert_text "Listbookauthor was successfully created"
    click_on "Back"
  end

  test "should update Listbookauthor" do
    visit listbookauthor_url(@listbookauthor)
    click_on "Edit this listbookauthor", match: :first

    fill_in "Author", with: @listbookauthor.author_id
    fill_in "Book", with: @listbookauthor.book_id
    click_on "Update Listbookauthor"

    assert_text "Listbookauthor was successfully updated"
    click_on "Back"
  end

  test "should destroy Listbookauthor" do
    visit listbookauthor_url(@listbookauthor)
    click_on "Destroy this listbookauthor", match: :first

    assert_text "Listbookauthor was successfully destroyed"
  end
end
