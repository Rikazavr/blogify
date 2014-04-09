class Post < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :post_type
  has_many :tag_associations
  has_many :tags, through: :tag_associations
  has_many :cat_associations
  has_many :categories, through: :cat_associations
  has_many :comments
end
