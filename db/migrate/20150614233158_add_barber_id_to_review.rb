class AddBarberIdToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :barber_id, :float, null: false
    remove_column :barbers, :rating, :float
    remove_column :reviews, :barber_rating, :float
  end
end
