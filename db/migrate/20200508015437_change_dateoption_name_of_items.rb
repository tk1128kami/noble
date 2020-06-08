class ChangeDateoptionNameOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :name, :string, null: false
    change_column :customers, :phone, :string, unique: true
  end
end
