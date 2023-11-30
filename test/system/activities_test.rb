require "application_system_test_case"

class ActivitiesTest < ApplicationSystemTestCase
  setup do
    @activity = activities(:one)
  end

  test "visiting the index" do
    visit activities_url
    assert_selector "h1", text: "Activities"
  end

  test "should create activity" do
    visit activities_url
    click_on "New activity"

    fill_in "Activity title", with: @activity.activity_title
    fill_in "Allocated budget", with: @activity.requested_budget
    fill_in "Club", with: @activity.club_id
    fill_in "Description", with: @activity.description
    fill_in "End date", with: @activity.end_date
    fill_in "Start date", with: @activity.start_date
    click_on "Create Activity"

    assert_text "Activity was successfully created"
    click_on "Back"
  end

  test "should update Activity" do
    visit activity_url(@activity)
    click_on "Edit this activity", match: :first

    fill_in "Activity title", with: @activity.activity_title
    fill_in "Allocated budget", with: @activity.requested_budget
    fill_in "Club", with: @activity.club_id
    fill_in "Description", with: @activity.description
    fill_in "End date", with: @activity.end_date
    fill_in "Start date", with: @activity.start_date
    click_on "Update Activity"

    assert_text "Activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Activity" do
    visit activity_url(@activity)
    click_on "Destroy this activity", match: :first

    assert_text "Activity was successfully destroyed"
  end
end
