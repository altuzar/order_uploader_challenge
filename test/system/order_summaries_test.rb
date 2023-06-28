require "application_system_test_case"

class OrderSummariesTest < ApplicationSystemTestCase
  setup do
    @order_summary = order_summaries(:one)
  end

  test "visiting the index" do
    visit order_summaries_url
    assert_selector "h1", text: "Order summaries"
  end

  test "should create order summary" do
    visit order_summaries_url
    click_on "New order summary"

    fill_in "Customer name", with: @order_summary.customer_name
    fill_in "Description", with: @order_summary.description
    fill_in "Item count", with: @order_summary.item_count
    fill_in "Merchant address", with: @order_summary.merchant_address
    fill_in "Merchant name", with: @order_summary.merchant_name
    fill_in "Price", with: @order_summary.price
    click_on "Create Order summary"

    assert_text "Order summary was successfully created"
    click_on "Back"
  end

  test "should update Order summary" do
    visit order_summary_url(@order_summary)
    click_on "Edit this order summary", match: :first

    fill_in "Customer name", with: @order_summary.customer_name
    fill_in "Description", with: @order_summary.description
    fill_in "Item count", with: @order_summary.item_count
    fill_in "Merchant address", with: @order_summary.merchant_address
    fill_in "Merchant name", with: @order_summary.merchant_name
    fill_in "Price", with: @order_summary.price
    click_on "Update Order summary"

    assert_text "Order summary was successfully updated"
    click_on "Back"
  end

  test "should destroy Order summary" do
    visit order_summary_url(@order_summary)
    click_on "Destroy this order summary", match: :first

    assert_text "Order summary was successfully destroyed"
  end
end
