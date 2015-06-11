# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  picture_comment    :string
#  imageable_id       :integer          not null
#  imageable_type     :string           not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class Picture < ActiveRecord::Base
  validates :imageable_id, :imageable_type, presence: true
  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
      :styles => { :med => "300x300>", :thumb => "100x100>" },
      :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image,
      :content_type => /\Aimage\/.*\Z/,
      size: { in: 0..3.megabytes }

end
