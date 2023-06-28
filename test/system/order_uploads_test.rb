require "application_system_test_case"

class OrderUploadsTest < ApplicationSystemTestCase
  setup do
    @order_upload = order_uploads(:one)
  end

  test "visiting the index" do
    visit order_uploads_url
    assert_selector "h1", text: "Order uploads"
  end

  test "should create order upload" do
    visit order_uploads_url
    click_on "New order upload"

    click_on "Create Order upload"

    assert_text "Order upload was successfully created"
    click_on "Back"
  end

  test "should update Order upload" do
    visit order_upload_url(@order_upload)
    click_on "Edit this order upload", match: :first

    click_on "Update Order upload"

    assert_text "Order upload was successfully updated"
    click_on "Back"
  end

  test "should destroy Order upload" do
    visit order_upload_url(@order_upload)
    click_on "Destroy this order upload", match: :first

    assert_text "Order upload was successfully destroyed"
  end
end
