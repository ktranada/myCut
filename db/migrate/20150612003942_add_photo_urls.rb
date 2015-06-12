class AddPhotoUrls < ActiveRecord::Migration
  def change
    remove_attachment :users, :avatar
    remove_attachment :pictures, :image
    remove_attachment :barbers, :personal_picture

    add_column :users, :photo_url, :string
    add_column :barbers, :photo_url, :string
    add_column :pictures, :photo_url, :string, null: false
    add_column :shops, :photo_url, :string
  end
end
