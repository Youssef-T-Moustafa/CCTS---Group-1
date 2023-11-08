require "application_system_test_case"

class ClubMembersTest < ApplicationSystemTestCase
  setup do
    @club_member = club_members(:one)
  end

  test "visiting the index" do
    visit club_members_url
    assert_selector "h1", text: "Club members"
  end

  test "should create club member" do
    visit club_members_url
    click_on "New club member"

    fill_in "Club", with: @club_member.club_id
    fill_in "Student", with: @club_member.student_id
    click_on "Create Club member"

    assert_text "Club member was successfully created"
    click_on "Back"
  end

  test "should update Club member" do
    visit club_member_url(@club_member)
    click_on "Edit this club member", match: :first

    fill_in "Club", with: @club_member.club_id
    fill_in "Student", with: @club_member.student_id
    click_on "Update Club member"

    assert_text "Club member was successfully updated"
    click_on "Back"
  end

  test "should destroy Club member" do
    visit club_member_url(@club_member)
    click_on "Destroy this club member", match: :first

    assert_text "Club member was successfully destroyed"
  end
end
