class Transaction {
  final String name;
  final String status;
  final String date;
  final double amount;

  Transaction({
    required this.name,
    required this.status,
    required this.date,
    required this.amount,
  });

  // Convert a Transaction object to a Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
      'date': date,
      'amount': amount,
    };
  }

  // Create a Transaction object from a JSON map
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      name: json['name'],
      status: json['status'],
      date: json['date'],
      amount: json['amount'],
    );
  }
}
