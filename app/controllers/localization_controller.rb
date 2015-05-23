class LocalizationController < ApplicationController
  def set_locale
    if [:ua, :ru].include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
      I18n.locale = params[:locale]
    end

    puts '+++++++'
    puts I18n.locale
    redirect_to request.referrer
  end
end
