import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import '../utils/constants.dart';
import 'database_service.dart';

class BackupService {
  static Future<String?> createBackup() async {
    try {
      final accounts = await DatabaseService.getAccounts();
      final transactions = await DatabaseService.getTransactions();
      final data = jsonEncode({'accounts': accounts.map((e) => e.toJson()).toList(), 'transactions': transactions.map((e) => e.toJson()).toList()});
      
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/ledger_backup_${DateTime.now().millisecondsSinceEpoch}.json');
      await file.writeAsString(data);
      return file.path;
    } catch (e) => null;
  }

  static Future<bool> restoreFromBackup() async {
    try {
      final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['json']);
      if (result == null) return false;
      final file = File(result.files.single.path!);
      final content = await file.readAsString();
      final data = jsonDecode(content) as Map<String, dynamic>;
      
      await DatabaseService.clearAll();
      for (var acc in data['accounts'] as List) await DatabaseService.insertAccount(acc);
      for (var tx in data['transactions'] as List) await DatabaseService.insertTransaction(tx);
      return true;
    } catch (_) => false;
  }
}
