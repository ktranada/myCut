class RemoveAttachment < ActiveRecord::Migration
  def change
    remove_attachment :shops, :store_picture
  end
end
