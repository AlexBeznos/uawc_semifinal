require 'ext/string'
require 'cyrillizer'

class News < ActiveRecord::Base
  has_unique_slug :subject => Proc.new {|news| "#{news.title.to_lat.urlize({:convert_spaces => true})}"}
  validates :title, :body, presence: true
end
