class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :menu_categories
  layout 'public'

  def menu_categories
    return @menu_categories if defined?(@menu_categories)
    @menu_categories = Category.where(category_id: nil)
  end
end
