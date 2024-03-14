class SubscriptionSerializer
  include JSONAPI::Serializer

  belongs_to :customer
  belongs_to :tea

  attributes  :price,
              :frequency,
              :title,
              :status,
              :customer_id,
              :tea_id

end