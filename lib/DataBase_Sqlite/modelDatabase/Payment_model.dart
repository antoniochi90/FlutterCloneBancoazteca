class Payment {
  final int? id;
  final double amount;
  final String service;
  final String paymentType;
  final String persona;

  Payment({
    this.id,
    required this.amount,
    required this.service,
    required this.paymentType,
    required this.persona,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'service': service,
      'payment_type': paymentType,
      'persona': persona,

    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      id: map['id'],
      amount: map['amount'],
      service: map['service'],
      paymentType: map['payment_type'],
      persona: map['persona'],
    );
  }
}
