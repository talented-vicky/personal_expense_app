class Transaction {
  final String id, title;
  final double amount;
  final DateTime date;
  Transaction({
    required this.id,
    required this.amount,
    required this.title,
    required this.date,
  });
}
