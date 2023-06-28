json.extract! order_summary, :id, :customer_name, :description, :price, :item_count, :merchant_address, :merchant_name, :created_at, :updated_at
json.url order_summary_url(order_summary, format: :json)
