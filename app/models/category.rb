class Category < ActiveRecord::Base
  has_attached_file :image

  has_many :categories, :foreign_key => 'category_id', :dependent => :destroy
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] },
                                :size => { :in => 0..10.megabytes }, if: 'category_id.nil?'

end
