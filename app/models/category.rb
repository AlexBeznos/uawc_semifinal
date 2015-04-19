require 'ext/string'
require 'cyrillizer'

class Category < ActiveRecord::Base
  has_attached_file :image
  has_unique_slug :subject => Proc.new {|category| "#{category.name.to_lat.urlize({:convert_spaces => true})}"}

  has_many :categories, :foreign_key => 'category_id', :dependent => :destroy
  has_and_belongs_to_many :products
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] },
                                :size => { :in => 0..10.megabytes }, if: 'category_id.nil?'

end
