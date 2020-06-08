class CreateCustomerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_items do |t|
      t.references :customer, index: true
      t.references :item, index: true, foreign_key: true
      t.timestamps null: true
    end
  end
end
