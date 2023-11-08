require "test_helper"

class ExtraActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extra_activity = extra_activities(:one)
  end

  test "should get index" do
    get extra_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_extra_activity_url
    assert_response :success
  end

  test "should create extra_activity" do
    assert_difference("ExtraActivity.count") do
      post extra_activities_url, params: { extra_activity: { description: @extra_activity.description, end_date: @extra_activity.end_date, name: @extra_activity.name, start_date: @extra_activity.start_date, student_id: @extra_activity.student_id } }
    end

    assert_redirected_to extra_activity_url(ExtraActivity.last)
  end

  test "should show extra_activity" do
    get extra_activity_url(@extra_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_extra_activity_url(@extra_activity)
    assert_response :success
  end

  test "should update extra_activity" do
    patch extra_activity_url(@extra_activity), params: { extra_activity: { description: @extra_activity.description, end_date: @extra_activity.end_date, name: @extra_activity.name, start_date: @extra_activity.start_date, student_id: @extra_activity.student_id } }
    assert_redirected_to extra_activity_url(@extra_activity)
  end

  test "should destroy extra_activity" do
    assert_difference("ExtraActivity.count", -1) do
      delete extra_activity_url(@extra_activity)
    end

    assert_redirected_to extra_activities_url
  end
end
