import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../utils/constants.dart';
import '../models/account.dart';
import '../models/transaction.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    final dbPath = await getDatabasesPath();
    _db = await openDatabase(
      join(dbPath, AppConstants.dbName),
      version: AppConstants.dbVersion,
      onCreate: _onCreate,
    );
    return _db!;
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE accounts (id TEXT PRIMARY KEY, name TEXT, type TEXT, currency TEXT, balance REAL, created_at TEXT)
    ''');
    await db.execute('''
      CREATE TABLE transactions (id TEXT PRIMARY KEY, account_id TEXT, amount REAL, currency TEXT,
      type TEXT, date TEXT, note TEXT, is_installment INTEGER, is_recurring INTEGER, created_at TEXT)
    ''');
    await db.execute('''
      CREATE TABLE installments (id TEXT PRIMARY KEY, transaction_id TEXT, total INTEGER, paid INTEGER, amount REAL, next_due TEXT)
    ''');
  }

  static Future<List<Account>> getAccounts() async {
    final db = await database;
    final maps = await db.query('accounts');
    return maps.map((e) => Account.fromJson(e)).toList();
  }

  static Future<void> insertAccount(Account acc) async {
    final db = await database;
    await db.insert('accounts', acc.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Transaction>> getTransactions() async {
    final db = await database;
    final maps = await db.query('transactions', orderBy: 'date DESC');
    return maps.map((e) => Transaction.fromJson(e)).toList();
  }

  static Future<void> insertTransaction(Transaction tx) async {
    final db = await database;
    await db.insert('transactions', tx.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> clearAll() async {
    final db = await database;
    await db.delete('installments');
    await db.delete('transactions');
    await db.delete('accounts');
  }
}
