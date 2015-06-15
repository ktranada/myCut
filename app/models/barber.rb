# == Schema Information
#
# Table name: barbers
#
#  id         :integer          not null, primary key
#  shop_id    :integer          not null
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  photo_url  :string
#

class Barber < ActiveRecord::Base
  validates :name, presence: true
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :reviews
  acts_as_taggable_on :skills

  belongs_to :shop

  def average_rating
    reviews = self.reviews
    # ActiveRecord calculation sum on column ratings
    reviews.empty? ? 0.0 : (reviews.sum(:rating) / reviews.length.to_f)
  end

  def number_reviews
    self.reviews.count
  end

end
