class Manufacturer < ActiveRecord::Base
  has_attached_file :image

  has_many :products
  phony_normalize :phone, :default_country_code => 'UA'

  validates :name, :address, :phone, :site, presence: true
  validates :site, :url => true
  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] },
                                :size => { :in => 0..10.megabytes }
end
