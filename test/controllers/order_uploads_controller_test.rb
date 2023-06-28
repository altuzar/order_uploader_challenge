require "test_helper"

class OrderUploadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_upload = order_uploads(:one)
  end

  test "should get index" do
    get order_uploads_url
    assert_response :success
  end

  test "should get new" do
    get new_order_upload_url
    assert_response :success
  end

  test "should create order_upload" do
    assert_difference("OrderUpload.count") do
      post order_uploads_url, params: { order_upload: {  } }
    end

    assert_redirected_to order_upload_url(OrderUpload.last)
  end

  test "should show order_upload" do
    get order_upload_url(@order_upload)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_upload_url(@order_upload)
    assert_response :success
  end

  test "should update order_upload" do
    patch order_upload_url(@order_upload), params: { order_upload: {  } }
    assert_redirected_to order_upload_url(@order_upload)
  end

  test "should destroy order_upload" do
    assert_difference("OrderUpload.count", -1) do
      delete order_upload_url(@order_upload)
    end

    assert_redirected_to order_uploads_url
  end
end
