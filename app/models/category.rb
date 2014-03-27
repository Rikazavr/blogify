class Category < ActiveRecord::Base
  has_many :cat_associations
  has_many :posts, through: :cat_associations
end
