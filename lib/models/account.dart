class Account {
  final String id;
  final String name;
  final String type; // 'asset', 'liability', 'equity', 'income', 'expense'
  final String currency;
  final double balance;
  final DateTime createdAt;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    this.balance = 0.0,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id, 'name': name, 'type': type, 'currency': currency, 'balance': balance, 'created_at': createdAt.toIso8601String()
  };

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    id: json['id'], name: json['name'], type: json['type'], currency: json['currency'],
    balance: json['balance'] ?? 0.0, createdAt: DateTime.parse(json['created_at']),
  );

  Account copyWith({double? balance}) => Account(
    id: id, name: name, type: type, currency: currency, balance: balance ?? this.balance, createdAt: createdAt
  );
}
