class Page < ActiveRecord::Base
  has_unique_slug :subject => Proc.new {|page| "#{page.title.to_lat.urlize({:convert_spaces => true})}"}
  validates :title, :body, presence: true

  enum reserved_for: [:home_page]
end
