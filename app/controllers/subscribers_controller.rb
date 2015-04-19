class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(subscribers_params)

    if @subscriber.save
      redirect_to root_path, :notice => 'Ви успішно підписалися на новини!'
    else
      redirect_to root_path, :alert => 'Ви ввели не всі необхідні данні, спробуйте ще ...'
    end
  end

  private
  def subscribers_params
    params.require(:subscriber).permit(:name, :email)
  end
end
