class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id, null: false
      t.integer :shop_id, null: false
      t.float :rating, default: 0

      t.timestamps
    end
    add_index :reviews, :author_id
    add_index :reviews, :shop_id
  end
end
