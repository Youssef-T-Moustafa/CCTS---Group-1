require "test_helper"

class InventoryHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory_history = inventory_histories(:one)
  end

  test "should get index" do
    get inventory_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_history_url
    assert_response :success
  end

  test "should create inventory_history" do
    assert_difference("InventoryHistory.count") do
      post inventory_histories_url, params: { inventory_history: { inventory_id: @inventory_history.inventory_id, quantity: @inventory_history.quantity } }
    end

    assert_redirected_to inventory_history_url(InventoryHistory.last)
  end

  test "should show inventory_history" do
    get inventory_history_url(@inventory_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_history_url(@inventory_history)
    assert_response :success
  end

  test "should update inventory_history" do
    patch inventory_history_url(@inventory_history), params: { inventory_history: { inventory_id: @inventory_history.inventory_id, quantity: @inventory_history.quantity } }
    assert_redirected_to inventory_history_url(@inventory_history)
  end

  test "should destroy inventory_history" do
    assert_difference("InventoryHistory.count", -1) do
      delete inventory_history_url(@inventory_history)
    end

    assert_redirected_to inventory_histories_url
  end
end
