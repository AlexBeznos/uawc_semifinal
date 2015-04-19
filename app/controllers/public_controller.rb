class PublicController < ApplicationController
  def index
    @advertisments = Advertisment.unscoped.limit(9)
    @news = News.limit(4)
    @page = Page.find_by(reserved_for: Page.reserved_fors[:home_page])
    @subscriber = Subscriber.new
  end
end
