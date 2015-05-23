class AdministrationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'administration'
  before_action :set_en

  def set_en
    I18n.locale = :en
  end
end
