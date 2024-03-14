class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates :customer_id, :tea_id, :price, :frequency, :title, :status, presence: true

  enum :status, {cancelled: 0, active: 1}
end