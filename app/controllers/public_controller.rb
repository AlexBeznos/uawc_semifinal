class PublicController < ApplicationController
  def index
    @advertisments = Advertisment.unscoped.limit(10)
  end
end
