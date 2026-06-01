import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import '../utils/constants.dart';

class AuthService {
  static final _storage = FlutterSecureStorage();
  static final _localAuth = LocalAuthentication();

  static Future<bool> hasPin() async => await _storage.read(key: AppConstants.pinKey) != null;

  static Future<void> setPin(String pin) async {
    final hashed = sha256.convert(utf8.encode(pin)).toString();
    await _storage.write(key: AppConstants.pinKey, value: hashed);
  }

  static Future<bool> verifyPin(String pin) async {
    final stored = await _storage.read(key: AppConstants.pinKey);
    if (stored == null) return false;
    return stored == sha256.convert(utf8.encode(pin)).toString();
  }

  static Future<bool> canCheckBiometrics() async => await _localAuth.canCheckBiometrics;

  static Future<bool> authenticateBiometric() async {
    final canCheck = await _localAuth.canCheckBiometrics;
    if (!canCheck) return false;
    try {
      return await _localAuth.authenticate(
        localizedReason: 'Authenticate to access ledger',
        options: const AuthenticationOptions(stickyAuth: true),
      );
    } catch (_) => false;
  }
}
