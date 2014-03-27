class Tag < ActiveRecord::Base
  has_many :tag_associations
  has_many :posts, through: :tag_associations
end
