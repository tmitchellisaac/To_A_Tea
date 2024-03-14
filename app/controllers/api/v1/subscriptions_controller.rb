class Api::V1::SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.create!(strong_params.merge(status: 1))
    render json: SubscriptionSerializer.new(subscription)
  end

  private

  def strong_params
    params.permit(:customer_id, :tea_id, :frequency, :price, :title)
  end

end