class Api::V1::SubscriptionsController < ApplicationController

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
    #definitely could add some error handling here
  end


  def create
    subscription = Subscription.create!(strong_params.merge(status: "active"))
    render json: SubscriptionSerializer.new(subscription)
    #definitely could add some error handling here too
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(strong_params)
    if params[:status] == "cancelled" && subscription.save
      render json: {success: "Subscription Successfully Cancelled"}
    else
      render json: {error: "Functionality not created yet, please be patient"}
    end
  end

  private

  def strong_params
    params.permit(:customer_id, :tea_id, :frequency, :price, :title, :status)
  end

end