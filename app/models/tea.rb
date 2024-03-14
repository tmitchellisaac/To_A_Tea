class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions 

  validates :name, :description, :brew_time, :temperature, presence: true

end