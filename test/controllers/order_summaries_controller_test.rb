require "test_helper"

class OrderSummariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_summary = order_summaries(:one)
  end

  test "should get index" do
    get order_summaries_url
    assert_response :success
  end

  test "should get new" do
    get new_order_summary_url
    assert_response :success
  end

  test "should create order_summary" do
    assert_difference("OrderSummary.count") do
      post order_summaries_url, params: { order_summary: { customer_name: @order_summary.customer_name, description: @order_summary.description, item_count: @order_summary.item_count, merchant_address: @order_summary.merchant_address, merchant_name: @order_summary.merchant_name, price: @order_summary.price } }
    end

    assert_redirected_to order_summary_url(OrderSummary.last)
  end

  test "should show order_summary" do
    get order_summary_url(@order_summary)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_summary_url(@order_summary)
    assert_response :success
  end

  test "should update order_summary" do
    patch order_summary_url(@order_summary), params: { order_summary: { customer_name: @order_summary.customer_name, description: @order_summary.description, item_count: @order_summary.item_count, merchant_address: @order_summary.merchant_address, merchant_name: @order_summary.merchant_name, price: @order_summary.price } }
    assert_redirected_to order_summary_url(@order_summary)
  end

  test "should destroy order_summary" do
    assert_difference("OrderSummary.count", -1) do
      delete order_summary_url(@order_summary)
    end

    assert_redirected_to order_summaries_url
  end
end
