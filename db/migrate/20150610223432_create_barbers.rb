class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.integer :shop_id, null: false
      t.string :name, null: false
      t.float :rating, default: 5 ,null: false
      t.string :photo_url

      t.timestamps
    end
    add_index :barbers, :shop_id
  end
end
