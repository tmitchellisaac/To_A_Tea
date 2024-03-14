# User Stories

## US #1 --> Subscription
- As a FE developer/user,
- when I send a POST request to the endpoint 
`<domain>/api/v1/customers/customer_id/subscription`
  
- with json body like: 
```
  {
    tea_id: 1
    frequency: 1
    price: 1400
    title: "Weekly Camomille"
  }
```
- A subscription for the given user is created on the BE,
- And I recieve the JSON response:
```
  {
  "data": {
    "type": "subscription",
    "id": "1",
    "attributes": {
      "title": "Weekly Camomille",
      "frequency": "1",
      "price": "1400"
      "status": "1"
      "tea_id": "1"
      "customer_id": "1"
    }
  }
}
```

## US #2 --> Cancellation

As a FE developer when I send a POST request to the endpoint

'domain/api/v1/customers/customer_id/subscriptions/sub_id/cancel`

- The status of the customer's subscription is changed to 'cancelled'
- And I recieve the following data back

```
{
  "success": "subscription successfully cancelled"
}
```

## US #3 --> Get All Subscriptions

- As a FE developer
- When I send a GET request
`domain/api/v1/customers/customer_id/subscriptions'
- I get a list of the active and cancelled subscriptions for that customer

```
  {
  "data": [
    {
    "type": "subscription",
    "id": "1",
    "attributes": {
      "title": "Weekly Camomille",
      "frequency": "1",
      "price": "1400"
      "status": "1"
      "tea_id": "1"
      "customer_id": "1"
    }
  },
    {
      "type": "subscription",
      "id": "2",
      "attributes": {
        "title": "Bedtime Tea",
        "frequency": "2",
        "price": "1000"
        "status": "0"
        "tea_id": "2"
        "customer_id": "1"
      }
    }
  ]
}
```
