require "application_system_test_case"

class ExtraActivitiesTest < ApplicationSystemTestCase
  setup do
    @extra_activity = extra_activities(:one)
  end

  test "visiting the index" do
    visit extra_activities_url
    assert_selector "h1", text: "Extra activities"
  end

  test "should create extra activity" do
    visit extra_activities_url
    click_on "New extra activity"

    fill_in "Description", with: @extra_activity.description
    fill_in "End date", with: @extra_activity.end_date
    fill_in "Name", with: @extra_activity.name
    fill_in "Start date", with: @extra_activity.start_date
    fill_in "Student", with: @extra_activity.student_id
    click_on "Create Extra activity"

    assert_text "Extra activity was successfully created"
    click_on "Back"
  end

  test "should update Extra activity" do
    visit extra_activity_url(@extra_activity)
    click_on "Edit this extra activity", match: :first

    fill_in "Description", with: @extra_activity.description
    fill_in "End date", with: @extra_activity.end_date
    fill_in "Name", with: @extra_activity.name
    fill_in "Start date", with: @extra_activity.start_date
    fill_in "Student", with: @extra_activity.student_id
    click_on "Update Extra activity"

    assert_text "Extra activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Extra activity" do
    visit extra_activity_url(@extra_activity)
    click_on "Destroy this extra activity", match: :first

    assert_text "Extra activity was successfully destroyed"
  end
end
