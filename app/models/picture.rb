# == Schema Information
#
# Table name: pictures
#
#  id              :integer          not null, primary key
#  picture_comment :string
#  imageable_id    :integer          not null
#  imageable_type  :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#  photo_url       :string           not null
#

class Picture < ActiveRecord::Base
  validates :photo_url, presence: true
  belongs_to :imageable, polymorphic: true

end
