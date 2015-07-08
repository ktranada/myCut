# == Schema Information
#
# Table name: shops
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  name         :string           not null
#  address      :string           not null
#  city         :string           not null
#  state        :string           not null
#  zip          :integer          not null
#  phone        :integer          not null
#  latitude     :float            not null
#  longitude    :float            not null
#  rating       :float            default(0.0), not null
#  created_at   :datetime
#  updated_at   :datetime
#  photo_url    :string
#

class Shop < ActiveRecord::Base
  acts_as_taggable_on :tags, :locations
  validates :name, :state, :latitude, :longitude, :zip, :city, presence: true
  validates :address, :phone, presence: true, uniqueness: true
  validate :shop_photo
  # Will tell geocoder which method returns geocodable address
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode, if: :address_changed?


  validates_inclusion_of :rating, {in: 0..5 }

  has_many :reviews, dependent: :destroy
  has_many :barbers, dependent: :destroy

  before_validation :convert_tags

  belongs_to :moderator, class_name: "User", foreign_key: :moderator_id

  validates_format_of :zip, with: /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"
  validates_format_of :phone,:with => /\A\d{10}/, message: "should be in the form  4083334444"



  def average_rating
    reviews = self.reviews
    # ActiveRecord calculation sum on column ratings
    reviews.empty? ? nil : (reviews.sum(:rating) / reviews.length.to_f)
  end

  def check_valid_shop
    self.barbers.empty?
  end

  def convert_tags
    [].push(self.tag_list) unless self.tag_list.is_a?(Array)
  end

  def number_reviews
    self.reviews.count
  end


  def full_street_address
    return "#{self.address}, #{self.city}, #{self.state}, #{self.zip}"
  end

  def parse_phone_number
    number = self.phone.to_s
    return "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  def shop_photo
    errors.add(:base, "You must upload a shop photo.") unless self.photo_url.present?
  end
end
