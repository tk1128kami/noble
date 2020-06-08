class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :name_kana
      t.string :nickname
      t.date :birthday
      t.string :phone
      t.string :email
      t.text :text
      t.timestamps null: true
    end
  end
end
