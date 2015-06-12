class AddBarberRatingToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :barber_rating, :float, default: 0.0 
  end
end
