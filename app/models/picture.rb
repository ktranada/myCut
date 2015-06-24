# == Schema Information
#
# Table name: pictures
#
#  id              :integer          not null, primary key
#  picture_comment :string
#  imageable_id    :integer
#  imageable_type  :string
#  photo_url       :string           not null
#  thumb_url       :string
#  medium_url      :string
#  created_at      :datetime
#  updated_at      :datetime
#

class Picture < ActiveRecord::Base
  validates :photo_url, presence: true
  belongs_to :imageable, polymorphic: true

end
