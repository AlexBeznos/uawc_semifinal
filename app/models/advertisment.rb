class Advertisment < ActiveRecord::Base
  default_scope { order(created_at: :desc) }
  has_attached_file :image
  has_attached_file :background_image

  enum kind: [:product, :collection, :advice, :question]
  enum title_position: [:top, :bottom]
  enum line_color: [:red, :blue, :yellow]

  validates :kind, presence: true
  validates :background_image, :title, :body, :title_position, presence: true, if: 'kind.to_sym == :collection'
  validates :image, :title, :body, :line_color, presence: true, if: 'kind.to_sym == :question || kind.to_sym == :advice'
  validates :image, :title, :body, :background_image, :price, presence: true, if: 'kind.to_sym == :product'
  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0}, if: 'price.present?'
  validates_attachment :image, :background_image,
                                :content_type => { :content_type => ["image/jpeg", "image/png", "image/gif"] },
                                :size => { :in => 0..10.megabytes }
end
