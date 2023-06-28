class CreateOrderSummaries < ActiveRecord::Migration[7.0]
  def change
    create_table :order_summaries do |t|
      t.string :customer_name
      t.string :description
      t.decimal :price
      t.integer :item_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end
  end
end
