class RemovePhotoUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :photo_url, :string
    add_column :users, :avatar, :string
  end
end
