require 'ext/string'
require 'cyrillizer'

class Product < ActiveRecord::Base
  include Filterable

  has_many :assets, :dependent => :destroy
  has_and_belongs_to_many :categories
  belongs_to :category
  belongs_to :manufacturer

  scope :search, ->(search) { where("name like ? or description like ?", "#{search}%", "#{search}%") }

  accepts_nested_attributes_for :assets
  has_unique_slug :subject => Proc.new {|product| "#{product.name.to_lat.urlize({:convert_spaces => true})}"}

  enum color: [:purple, :blue, :yellow, :red]

  validates :name, :material, :volume, :width, :height, :depth, :color, :cost, presence: true
  validates :cost, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}

  before_save :set_categories

  def set_categories
    self.categories.delete_all
    self.set_associations(self.category_id)
  end

  def set_associations(category_id)
    category = Category.find(category_id)
    self.categories << category

    unless category.category_id.nil?
      self.set_associations(category.category_id)
    end
  end
end
