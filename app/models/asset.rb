class Asset < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image

  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] },
                                :size => { :in => 0..10.megabytes }

end
