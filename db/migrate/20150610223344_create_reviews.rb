class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :author_id, null: false
      t.integer :shop_id, null: false
      t.float :rating, default: 0, null: false

      t.timestamps
    end
    add_index :reviews, :author_id
    add_index :reviews, :shop_id
    add_index :reviews, [:author_id, :shop_id]
  end
end
