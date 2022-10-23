require "application_system_test_case"

class ListuserlikedbooksTest < ApplicationSystemTestCase
  setup do
    @listuserlikedbook = listuserlikedbooks(:one)
  end

  test "visiting the index" do
    visit listuserlikedbooks_url
    assert_selector "h1", text: "Listuserlikedbooks"
  end

  test "should create listuserlikedbook" do
    visit listuserlikedbooks_url
    click_on "New listuserlikedbook"

    fill_in "Book", with: @listuserlikedbook.book_id
    fill_in "User", with: @listuserlikedbook.user_id
    click_on "Create Listuserlikedbook"

    assert_text "Listuserlikedbook was successfully created"
    click_on "Back"
  end

  test "should update Listuserlikedbook" do
    visit listuserlikedbook_url(@listuserlikedbook)
    click_on "Edit this listuserlikedbook", match: :first

    fill_in "Book", with: @listuserlikedbook.book_id
    fill_in "User", with: @listuserlikedbook.user_id
    click_on "Update Listuserlikedbook"

    assert_text "Listuserlikedbook was successfully updated"
    click_on "Back"
  end

  test "should destroy Listuserlikedbook" do
    visit listuserlikedbook_url(@listuserlikedbook)
    click_on "Destroy this listuserlikedbook", match: :first

    assert_text "Listuserlikedbook was successfully destroyed"
  end
end
