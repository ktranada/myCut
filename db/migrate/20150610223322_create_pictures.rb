class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_comment
      t.integer :imageable_id
      t.string :imageable_type
      t.string :photo_url, null: false

      t.timestamps
    end

    add_index :pictures, [:imageable_id, :imageable_type]
  end
end
