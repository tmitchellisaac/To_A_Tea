# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customer_1 = Customer.create!(first_name: "Donna", last_name: "Bisson", address: "4444 Yellow Tail Dr", email: "donna@gmail.com")
camomille = Tea.create!(name: "Camomille", description: "camomille tea", brew_time: "7 minutes", temperature: "170 degrees")
sleepy_tea = Tea.create!(name: "Sleepy Tea", description: "sleepy time mix", brew_time: "8 minutes", temperature: "170 degrees")

subscription_1 = Subscription.create!(customer_id: customer_1.id, tea_id: camomille.id, price: 1400, frequency: "1", title: "Weekly Camomille", status: 1)
