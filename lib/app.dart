import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';
import 'views/screens/pin_screen.dart';
import 'views/screens/dashboard_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountingLedgerApp extends ConsumerWidget {
  const AccountingLedgerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => MaterialApp(
        title: AppConstants.appName,
        theme: AppTheme.light(lightDynamic),
        darkTheme: AppTheme.dark(darkDynamic),
        themeMode: ThemeMode.system,
        locale: const Locale('en'),
        supportedLocales: AppConstants.supportedLocales,
        localizationsDelegates: AppConstants.localizationsDelegates,
        initialRoute: '/',
        routes: {
          '/': (context) => const PinScreen(),
          '/dashboard': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
