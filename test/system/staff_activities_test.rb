require "application_system_test_case"

class StaffActivitiesTest < ApplicationSystemTestCase
  setup do
    @staff_activity = staff_activities(:one)
  end

  test "visiting the index" do
    visit staff_activities_url
    assert_selector "h1", text: "Staff activities"
  end

  test "should create staff activity" do
    visit staff_activities_url
    click_on "New staff activity"

    fill_in "Activity", with: @staff_activity.activity_id
    fill_in "Staff", with: @staff_activity.staff_id
    click_on "Create Staff activity"

    assert_text "Staff activity was successfully created"
    click_on "Back"
  end

  test "should update Staff activity" do
    visit staff_activity_url(@staff_activity)
    click_on "Edit this staff activity", match: :first

    fill_in "Activity", with: @staff_activity.activity_id
    fill_in "Staff", with: @staff_activity.staff_id
    click_on "Update Staff activity"

    assert_text "Staff activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Staff activity" do
    visit staff_activity_url(@staff_activity)
    click_on "Destroy this staff activity", match: :first

    assert_text "Staff activity was successfully destroyed"
  end
end
