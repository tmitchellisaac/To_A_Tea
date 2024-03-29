require "rails_helper"

RSpec.describe "Update Subscription" do
  
  describe "Cancellation" do
    it "will change status of a customer's subscription to cancelled/0" do
      customer_1 = Customer.create!(first_name: "Donna", last_name: "Bisson", address: "4444 Yellow Tail Dr", email: "donna@gmail.com")
      camomille = Tea.create!(name: "Camomille", description: "camomille tea", brew_time: "7 minutes", temperature: "170 degrees")

      subscription_data = {
          customer_id: customer_1.id,
          tea_id: camomille.id,
          frequency: 1,
          price: 1400,
          title: "Weekly Camomille"
        }
    
      post "/api/v1/customers/#{customer_1.id}/subscriptions", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(subscription_data)
    
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:data][:attributes][:status]).to eq("active")
      subscription_id = json_response[:data][:id].to_i
      subscription = Subscription.last
      expect(subscription.status).to eq("active")

      patch "/api/v1/customers/#{customer_1.id}/subscriptions/#{subscription_id}?status=cancelled", headers: {"CONTENT_TYPE" => "application/json"}
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to eq({success: "Subscription Successfully Cancelled"})

      subscription = Subscription.find(subscription_id)
      expect(subscription.status).to eq("cancelled")
    end
  end
end