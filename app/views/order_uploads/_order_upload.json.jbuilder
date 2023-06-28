json.extract! order_upload, :id, :csv_file, :created_at, :updated_at
json.url order_upload_url(order_upload, format: :json)
json.csv_file url_for(order_upload.csv_file)
