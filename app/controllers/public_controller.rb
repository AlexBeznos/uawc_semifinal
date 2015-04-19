class PublicController < ApplicationController
  def index
    @advertisments = Advertisment.unscoped.limit(10)
    @news = News.limit(4)
  end
end
