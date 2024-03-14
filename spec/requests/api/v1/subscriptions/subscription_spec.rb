require "rails_helper"

RSpec.describe "Customer Subscription" do
  it "can create a tea subscription for a customer" do
  customer_1 = Customer.create!(first_name: "Donna", last_name: "Bisson", address: "4444 Yellow Tail Dr", email: "donna@gmail.com")
  camomille = Tea.create!(name: "Camomille", description: "camomille tea", brew_time: "7 minutes", temperature: "170 degrees")

  subscription_data = {
        tea_id: camomille.id,
        frequency: 1,
        price: 1400,
        title: "Weekly Camomille"
      }
  
  post "/api/v1/customers/#{customer_1.id}/subscriptions", headers: {"CONTENT_TYPE" => "application/json"}, params: JSON.generate(subscription_data)
  
  expect(response).to be_successful
  json_response = JSON.parse(response.body, symbolize_names: true)

  expect(json_response[:data][:id]).to_not eq(nil)
  expect(json_response[:data][:type]).to eq("subscription")
  expect(json_response[:data][:attributes].count).to eq(6)
  expect(json_response[:data][:attributes][:frequency]).to eq("1")
  expect(json_response[:data][:attributes][:title]).to eq("Weekly Camomille")
  expect(json_response[:data][:attributes][:status]).to eq("active")
  expect(json_response[:data][:attributes][:customer_id]).to eq(customer_1.id)
  expect(json_response[:data][:attributes][:tea_id]).to eq(camomille.id)
  expect(json_response[:data][:relationships]).to be_a(Hash)
  end
end
