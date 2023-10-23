class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false, foreign_key: true
      t.string :name_item,             null: false
      t.text :details_item,            null: false
      t.integer :category_item_id,     null: false
      t.integer :status_item_id,       null: false
      t.integer :shipping_fee_id,      null: false
      t.integer :prefecture_id,        null: false
      t.integer :lead_time_id,         null: false
      t.integer :price,                null: false

      t.timestamps
    end
  end
end
