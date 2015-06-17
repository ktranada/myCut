class AddBarberIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :barber_id, :int, null: false
    remove_column :barbers, :rating, :float
  end
end
