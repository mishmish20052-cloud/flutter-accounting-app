import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppConstants {
  static const String appName = 'Accounting Ledger';
  static const String dbName = 'ledger.db';
  static const int dbVersion = 1;
  static const String pinKey = 'ledger_pin_hash';
  static const String themeKey = 'app_theme_mode';
  static const String localeKey = 'app_locale';
  static const String backupDir = 'ledger_backups';
  static const String defaultCurrency = 'USD';

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
