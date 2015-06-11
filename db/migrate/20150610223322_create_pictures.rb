class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_comment
      t.integer :imageable_id, null: false
      t.string :imageable_type, null: false
      t.attachment :image

      t.timestamps
    end

    add_index :pictures, [:imageable_id, :imageable_type]
  end
end
