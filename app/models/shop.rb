class Shop < ActiveRecord
  acts_as_taggable_on :tags, :locations
  has_many :pictures, as: :imageable

end
