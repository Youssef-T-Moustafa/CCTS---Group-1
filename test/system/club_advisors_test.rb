require "application_system_test_case"

class ClubAdvisorsTest < ApplicationSystemTestCase
  setup do
    @club_advisor = club_advisors(:one)
  end

  test "visiting the index" do
    visit club_advisors_url
    assert_selector "h1", text: "Club advisors"
  end

  test "should create club advisor" do
    visit club_advisors_url
    click_on "New club advisor"

    fill_in "Club", with: @club_advisor.club_id
    fill_in "Staff", with: @club_advisor.staff_id
    click_on "Create Club advisor"

    assert_text "Club advisor was successfully created"
    click_on "Back"
  end

  test "should update Club advisor" do
    visit club_advisor_url(@club_advisor)
    click_on "Edit this club advisor", match: :first

    fill_in "Club", with: @club_advisor.club_id
    fill_in "Staff", with: @club_advisor.staff_id
    click_on "Update Club advisor"

    assert_text "Club advisor was successfully updated"
    click_on "Back"
  end

  test "should destroy Club advisor" do
    visit club_advisor_url(@club_advisor)
    click_on "Destroy this club advisor", match: :first

    assert_text "Club advisor was successfully destroyed"
  end
end
