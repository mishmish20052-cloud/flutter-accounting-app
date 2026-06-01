import 'package:dio/dio.dart';
import '../models/currency.dart';

class CurrencyService {
  static final _dio = Dio(BaseOptions(baseUrl: 'https://api.exchangerate-api.com/v4/latest/USD'));
  static Map<String, double> _cachedRates = {'USD': 1.0};

  static Future<void> fetchRates() async {
    try {
      final res = await _dio.get('/latest');
      final data = res.data['rates'] as Map<String, dynamic>;
      _cachedRates = {
        'USD': 1.0,
        'EUR': (data['EUR'] as num).toDouble(),
        'GBP': (data['GBP'] as num).toDouble(),
        'SAR': (data['SAR'] as num).toDouble(),
        'AED': (data['AED'] as num).toDouble(),
        'EGP': (data['EGP'] as num).toDouble(),
      };
    } catch (_) {}
  }

  static double convert(double amount, String from, String to) {
    final fromRate = _cachedRates[from] ?? 1.0;
    final toRate = _cachedRates[to] ?? 1.0;
    return (amount / fromRate) * toRate;
  }
}
