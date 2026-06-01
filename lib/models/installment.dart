class Installment {
  final String id;
  final String transactionId;
  final int totalInstallments;
  final int paidInstallments;
  final double installmentAmount;
  final DateTime nextDueDate;

  Installment({required this.id, required this.transactionId, required this.totalInstallments,
    this.paidInstallments = 0, required this.installmentAmount, required this.nextDueDate});

  Map<String, dynamic> toJson() => {
    'id': id, 'transaction_id': transactionId, 'total': totalInstallments, 'paid': paidInstallments,
    'amount': installmentAmount, 'next_due': nextDueDate.toIso8601String()
  };
}
