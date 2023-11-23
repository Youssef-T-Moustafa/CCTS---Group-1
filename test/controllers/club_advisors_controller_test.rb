require "test_helper"

class ClubAdvisorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_advisor = club_advisors(:one)
  end

  test "should get index" do
    get club_advisors_url
    assert_response :success
  end

  test "should get new" do
    get new_club_advisor_url
    assert_response :success
  end

  test "should create club_advisor" do
    assert_difference("ClubAdvisor.count") do
      post club_advisors_url, params: { club_advisor: { club_id: @club_advisor.club_id, staff_id: @club_advisor.staff_id } }
    end

    assert_redirected_to club_advisor_url(ClubAdvisor.last)
  end

  test "should show club_advisor" do
    get club_advisor_url(@club_advisor)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_advisor_url(@club_advisor)
    assert_response :success
  end

  test "should update club_advisor" do
    patch club_advisor_url(@club_advisor), params: { club_advisor: { club_id: @club_advisor.club_id, staff_id: @club_advisor.staff_id } }
    assert_redirected_to club_advisor_url(@club_advisor)
  end

  test "should destroy club_advisor" do
    assert_difference("ClubAdvisor.count", -1) do
      delete club_advisor_url(@club_advisor)
    end

    assert_redirected_to club_advisors_url
  end
end
