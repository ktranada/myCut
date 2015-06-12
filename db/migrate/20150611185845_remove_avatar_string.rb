class RemoveAvatarString < ActiveRecord::Migration
  def change
    remove_column :users, :avatar, :string
    add_attachment :users, :avatar
  end
end
