require "test_helper"

class ClubMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @club_member = club_members(:one)
  end

  test "should get index" do
    get club_members_url
    assert_response :success
  end

  test "should get new" do
    get new_club_member_url
    assert_response :success
  end

  test "should create club_member" do
    assert_difference("ClubMember.count") do
      post club_members_url, params: { club_member: { club_id: @club_member.club_id, student_id: @club_member.student_id } }
    end

    assert_redirected_to club_member_url(ClubMember.last)
  end

  test "should show club_member" do
    get club_member_url(@club_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_club_member_url(@club_member)
    assert_response :success
  end

  test "should update club_member" do
    patch club_member_url(@club_member), params: { club_member: { club_id: @club_member.club_id, student_id: @club_member.student_id } }
    assert_redirected_to club_member_url(@club_member)
  end

  test "should destroy club_member" do
    assert_difference("ClubMember.count", -1) do
      delete club_member_url(@club_member)
    end

    assert_redirected_to club_members_url
  end
end
