class Payment {
  final int? id;
  final int paymentId;
  final double amount;
  final String date;
  final String paymentType;

  Payment({
    this.id,
    required this.paymentId,
    required this.amount,
    required this.date,
    required this.paymentType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'payment_id': paymentId,
      'amount': amount,
      'date': date,
      'payment_type': paymentType,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'],
      paymentId: map['payment_id'],
      amount: map['amount'],
      date: map['date'],
      paymentType: map['payment_type'],
    );
  }
}
