# == Schema Information
#
# Table name: barbers
#
#  id         :integer          not null, primary key
#  shop_id    :integer          not null
#  name       :string           not null
#  rating     :float            default(5.0), not null
#  created_at :datetime
#  updated_at :datetime
#  photo_url  :string
#

class Barber < ActiveRecord::Base
  validates :name, :rating, presence: true
  validates_inclusion_of :rating, {in: 0..5 }
  has_many :pictures, as: :imageable, dependent: :destroy

  belongs_to :shop
  # has_attached_file :personal_picture,
  #     :styles => { :med => "300x300>", :thumb => "100x100>" },
  #     :default_url => "/images/:style/missing.png"
  #
  #
  # validates_attachment_content_type :personal_picture,
  #     :content_type => /\Aimage\/.*\Z/,
  #     size: { in: 0..3.megabytes }


end
