require "application_system_test_case"

class InventoryHistoriesTest < ApplicationSystemTestCase
  setup do
    @inventory_history = inventory_histories(:one)
  end

  test "visiting the index" do
    visit inventory_histories_url
    assert_selector "h1", text: "Inventory histories"
  end

  test "should create inventory history" do
    visit inventory_histories_url
    click_on "New inventory history"

    fill_in "Inventory", with: @inventory_history.inventory_id
    fill_in "Quantity", with: @inventory_history.quantity
    click_on "Create Inventory history"

    assert_text "Inventory history was successfully created"
    click_on "Back"
  end

  test "should update Inventory history" do
    visit inventory_history_url(@inventory_history)
    click_on "Edit this inventory history", match: :first

    fill_in "Inventory", with: @inventory_history.inventory_id
    fill_in "Quantity", with: @inventory_history.quantity
    click_on "Update Inventory history"

    assert_text "Inventory history was successfully updated"
    click_on "Back"
  end

  test "should destroy Inventory history" do
    visit inventory_history_url(@inventory_history)
    click_on "Destroy this inventory history", match: :first

    assert_text "Inventory history was successfully destroyed"
  end
end
