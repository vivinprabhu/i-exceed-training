class Transaction {
  String recipient;
  String type; // "Credit" or "Debit"
  double amount;
  String date;
  String image;

  Transaction({
    required this.recipient,
    required this.type,
    required this.amount,
    required this.date,
    required this.image,
  });
}

List<Transaction> trans = [
  Transaction(
    recipient: "Amazon",
    type: "Debit",
    amount: 1250.75,
    date: "2025-01-10",
    image: "assets/transactions/amazon1.png",
  ),
  Transaction(
    recipient: "Salary",
    type: "Credit",
    amount: 50000.00,
    date: "2025-01-01",
    image: "assets/transactions/salary.png",
  ),
  Transaction(
    recipient: "Electricity Bill",
    type: "Debit",
    amount: 1850.25,
    date: "2025-02-28",
    image: "assets/transactions/bill.png",
  ),
  Transaction(
    recipient: "Google Play Refund",
    type: "Credit",
    amount: 299.00,
    date: "2025-03-25",
    image: "assets/transactions/refund.png",
  ),
  Transaction(
    recipient: "Gym Membership",
    type: "Debit",
    amount: 2000.00,
    date: "2025-03-30",
    image: "assets/transactions/fitness.png",
  ),
  Transaction(
    recipient: "Flipkart",
    type: "Debit",
    amount: 999.00,
    date: "2025-04-20",
    image: "assets/transactions/flipkart.png",
  ),
  Transaction(
    recipient: "Zomato",
    type: "Debit",
    amount: 450.75,
    date: "2025-05-18",
    image: "assets/transactions/zomato.png",
  ),
  Transaction(
    recipient: "Netflix Subscription",
    type: "Debit",
    amount: 649.00,
    date: "2025-05-15",
    image: "assets/transactions/netflix.png",
  ),
  Transaction(
    recipient: "Meesho",
    type: "Credit",
    amount: 1200.00,
    date: "2025-06-12",
    image: "assets/transactions/meesho.png",
  ),
  Transaction(
    recipient: "Train Ticket Booking",
    type: "Credit",
    amount: 980.00,
    date: "2025-06-10",
    image: "assets/transactions/train.png",
  ),
  Transaction(
    recipient: "Swiggy",
    type: "Debit",
    amount: 1125.30,
    date: "2025-07-08",
    image: "assets/transactions/swiggy.png",
  ),
  Transaction(
    recipient: "Zepto",
    type: "Credit",
    amount: 100.00,
    date: "2025-07-05",
    image: "assets/transactions/zepto.png",
  ),

];