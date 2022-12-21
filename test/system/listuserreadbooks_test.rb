require "application_system_test_case"

class ListuserreadbooksTest < ApplicationSystemTestCase
  setup do
    @listuserreadbook = listuserreadbooks(:one)
  end

  test "visiting the index" do
    visit listuserreadbooks_url
    assert_selector "h1", text: "Listuserreadbooks"
  end

  test "should create listuserreadbook" do
    visit listuserreadbooks_url
    click_on "New listuserreadbook"

    fill_in "Book", with: @listuserreadbook.book_id
    fill_in "User", with: @listuserreadbook.user_id
    click_on "Create Listuserreadbook"

    assert_text "Listuserreadbook was successfully created"
    click_on "Back"
  end

  test "should update Listuserreadbook" do
    visit listuserreadbook_url(@listuserreadbook)
    click_on "Edit this listuserreadbook", match: :first

    fill_in "Book", with: @listuserreadbook.book_id
    fill_in "User", with: @listuserreadbook.user_id
    click_on "Update Listuserreadbook"

    assert_text "Listuserreadbook was successfully updated"
    click_on "Back"
  end

  test "should destroy Listuserreadbook" do
    visit listuserreadbook_url(@listuserreadbook)
    click_on "Destroy this listuserreadbook", match: :first

    assert_text "Listuserreadbook was successfully destroyed"
  end
end
