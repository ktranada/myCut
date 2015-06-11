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
      :storage => :s3,
      :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image,
      :content_type => /\Aimage\/.*\Z/,
      size: { in: 0..3.megabytes }

  def s3_credentials
    bucket_loc = Rails.env.production? ? ENV'S3_BUCKET_NAME'] : ENV['DEV_S3_BUCKET_NAME']

   { bucket: bucket_loc,
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }
  end

end
