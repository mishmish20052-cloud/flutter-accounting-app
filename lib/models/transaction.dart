class Transaction {
  final String id;
  final String accountId;
  final double amount;
  final String currency;
  final String type; // 'income', 'expense', 'transfer'
  final DateTime date;
  final String note;
  final bool isInstallment;
  final bool isRecurring;
  final DateTime createdAt;

  Transaction({
    required this.id, required this.accountId, required this.amount, required this.currency,
    required this.type, required this.date, required this.note, this.isInstallment = false,
    this.isRecurring = false, required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id, 'account_id': accountId, 'amount': amount, 'currency': currency,
    'type': type, 'date': date.toIso8601String(), 'note': note,
    'is_installment': isInstallment, 'is_recurring': isRecurring, 'created_at': createdAt.toIso8601String()
  };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'], accountId: json['account_id'], amount: json['amount'],
    currency: json['currency'], type: json['type'], date: DateTime.parse(json['date']),
    note: json['note'], isInstallment: json['is_installment'] == 1 || json['is_installment'] == true,
    isRecurring: json['is_recurring'] == 1 || json['is_recurring'] == true, createdAt: DateTime.parse(json['created_at']),
  );
}
