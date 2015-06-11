# == Schema Information
#
# Table name: shops
#
#  id                         :integer          not null, primary key
#  moderator_id               :integer          not null
#  name                       :string           not null
#  address                    :string           not null
#  city                       :string           not null
#  state                      :string           not null
#  zip                        :integer          not null
#  phone                      :integer          not null
#  latitude                   :float            not null
#  longitude                  :float            not null
#  rating                     :float            default(0.0), not null
#  store_picture_file_name    :string
#  store_picture_content_type :string
#  store_picture_file_size    :integer
#  store_picture_updated_at   :datetime
#  created_at                 :datetime
#  updated_at                 :datetime
#

class Shop < ActiveRecord::Base
  acts_as_taggable_on :tags, :locations
  validates :name, :address, :city, :state, :zip, :phone, :rating, presence: true
  validates_inclusion_of :rating, {in: 0..5 }

  has_many :store_pictures, as: :imageable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :barbers, dependent: :destroy

  belongs_to :moderator, class_name: "User", foreign_key: :moderator_id

  validates_inclusion_of :zip, { in: 10000..99999 }
  validates_inclusion_of :phone, { in: 1000000000..9999999999 }

  # Will tell geocoder which method returns geocodable address
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates


  has_attached_file :store_picture,
      :styles => { :med => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :store_picture,
      :content_type => /\Aimage\/.*\Z/,
      size: { in: 0..3.megabytes }

  def full_street_address
    return "#{this.address}, #{this.city}, #{this.state}, #{this.zip}"
  end

  def parse_phone_number
    number = self.phone
    return "(#{number[0..2]}) - #{number[3..5]} - #{number[6..9]})"
  end

  def average_rating
    reviews = self.reviews
    # ActiveRecord calculation sum on column ratings
    return reviews.empty? ? nil : (reviews.sum(:rating) / reviews.length.to_f)
  end

  def number_reviews
    return self.reviews.count
  end


end
