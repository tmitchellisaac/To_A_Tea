require "rails_helper"

RSpec.describe "Customer Index Subscriptions" do
  it "returns all of a customers subscriptions" do
    customer_1 = Customer.create!(first_name: "Donna", last_name: "Bisson", address: "4444 Yellow Tail Dr", email: "donna@gmail.com")
    camomille = Tea.create!(name: "Camomille", description: "camomille tea", brew_time: "7 minutes", temperature: "170 degrees")
    sleepy_tea = Tea.create!(name: "Sleepy Tea", description: "sleepy time mix", brew_time: "8 minutes", temperature: "170 degrees")

    subscription_1 = Subscription.create!(customer_id: customer_1.id, tea_id: camomille.id, price: 1400, frequency: "1", title: "Weekly Camomille", status: 1)
    subscription_2 = Subscription.create!(customer_id: customer_1.id, tea_id: sleepy_tea.id, price: 1000, frequency: "1", title: "Sleepy Tea", status: 0)

    get "/api/v1/customers/#{customer_1.id}/subscriptions", headers: {"CONTENT_TYPE" => "application/json"}

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(json_response[:data]).to_not eq(nil)
    expect(json_response[:data].count).to eq(2)

    expect(json_response[:data].first[:id]).to eq("#{subscription_1.id}")
    expect(json_response[:data].first[:type]).to eq("subscription")
    expect(json_response[:data].first[:attributes].count).to eq(6)
    expect(json_response[:data].first[:attributes][:title]).to eq("Weekly Camomille")
    expect(json_response[:data].first[:attributes][:status]).to eq("active")
    
    expect(json_response[:data].second[:id]).to eq("#{subscription_2.id}")
    expect(json_response[:data].second[:type]).to eq("subscription")
    expect(json_response[:data].second[:attributes].count).to eq(6)
    expect(json_response[:data].second[:attributes][:title]).to eq("Sleepy Tea")
    expect(json_response[:data].second[:attributes][:status]).to eq("cancelled")
    
  end
end