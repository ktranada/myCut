# == Schema Information
#
# Table name: reviews
#
#  id            :integer          not null, primary key
#  body          :text             not null
#  author_id     :integer          not null
#  shop_id       :integer          not null
#  rating        :float            default(0.0), not null
#  created_at    :datetime
#  updated_at    :datetime
#  barber_rating :float            default(0.0)
#  barber_id     :integer          not null
#

class Review < ActiveRecord::Base
  acts_as_taggable
  validates :body, :rating, :shop_id, :author_id, :barber_id, presence: true
  validates_inclusion_of :rating, {in: 0.0..5.0 }
  # TODO validate :user_id uniquess : { scope: :shop_id}
  # so user can comment once for each shop, but can edit comments

  belongs_to(:author, class_name: "User", foreign_key: :author_id)
  belongs_to :shop
  belongs_to :barber
  has_many :pictures, as: :imageable, dependent: :destroy

end
