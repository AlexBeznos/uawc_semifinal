class Administration::SubscribersController < AdministrationController
  def index
    @subscribers = Subscriber.all
  end
end
