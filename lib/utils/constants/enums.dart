//List of Enums
//Can't be created inside a class

enum TextSizes { small, medium, large }

enum OrderStatus {
  placed,
  confirmed,
  processing,
  readyToShip,
  shipped,
  delivered,
  unCompleted,
  cancelled,
}

enum ProductType { single, variable }

enum PaymentStatus { pendingPayment, paidPayment, cashPayment }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm,
}
