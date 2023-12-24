require "test_helper"

class FormCapacitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get form_capacities_edit_url
    assert_response :success
  end

  test "should get update" do
    get form_capacities_update_url
    assert_response :success
  end
end
