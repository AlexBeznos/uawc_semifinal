class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :menu_categories
  layout 'public'
  before_action :set_locale

  def menu_categories
    return @menu_categories if defined?(@menu_categories)
    @menu_categories = Category.where(category_id: nil)
  end

  private

    def set_locale
      if !session[:locale] || !I18n.available_locales.include?(session[:locale].to_sym)
        locale = http_accept_language.compatible_language_from(I18n.available_locales)
        if locale && I18n.available_locales.include?(locale.to_sym)
          I18n.locale = locale
          session[:locale] = locale
        else
          I18n.locale = :ua
          session[:locale] = :ua
        end
      else
        I18n.locale = session[:locale]
      end
    end
end
