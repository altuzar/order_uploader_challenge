class CreateOrderUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :order_uploads do |t|

      t.timestamps
    end
  end
end
