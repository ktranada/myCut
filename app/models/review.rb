# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  author_id  :integer          not null
#  shop_id    :integer          not null
#  rating     :float            default(0.0), not null
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  validates :body, :rating, :shop, :user, presence: true
  validates_inclusion_of :rating, {in: 0..5 }
  # TODO validate :user_id uniquess : { scope: :shop_id}
  # so user can comment once for each shop, but can edit comments

  belongs_to(:user, class_name: "User", foreign_key: :author_id)
  belongs_to :shop
  has_many :pictures, as: :imageable, dependent: :destroy

end
