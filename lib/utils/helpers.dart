import 'package:intl/intl.dart';

class Helpers {
  static String formatCurrency(double amount, {String currency = 'USD'}) {
    final formatter = NumberFormat.currency(symbol: _getSymbol(currency), locale: 'en_US');
    return formatter.format(amount);
  }

  static String _getSymbol(String currency) {
    switch(currency.toUpperCase()) {
      case 'USD': return '\$';
      case 'EUR': return '€';
      case 'GBP': return '£';
      case 'SAR': return 'ر.س';
      case 'AED': return 'د.إ';
      case 'EGP': return 'ج.م';
      default: return currency;
    }
  }

  static String formatDate(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  static bool isValidEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}
