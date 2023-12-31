require "test_helper"

class StaffActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @staff_activity = staff_activities(:one)
  end

  test "should get index" do
    get staff_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_staff_activity_url
    assert_response :success
  end

  test "should create staff_activity" do
    assert_difference("StaffActivity.count") do
      post staff_activities_url, params: { staff_activity: { activity_id: @staff_activity.activity_id, staff_id: @staff_activity.staff_id } }
    end

    assert_redirected_to staff_activity_url(StaffActivity.last)
  end

  test "should show staff_activity" do
    get staff_activity_url(@staff_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_staff_activity_url(@staff_activity)
    assert_response :success
  end

  test "should update staff_activity" do
    patch staff_activity_url(@staff_activity), params: { staff_activity: { activity_id: @staff_activity.activity_id, staff_id: @staff_activity.staff_id } }
    assert_redirected_to staff_activity_url(@staff_activity)
  end

  test "should destroy staff_activity" do
    assert_difference("StaffActivity.count", -1) do
      delete staff_activity_url(@staff_activity)
    end

    assert_redirected_to staff_activities_url
  end
end
