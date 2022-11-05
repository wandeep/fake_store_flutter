import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../logger_custom.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  Future<Map<String, String>> readAll() async {
    var map = <String, String>{};
    try {
      map = await _storage.readAll();
    } catch (error) {
      logger.d('SecureStorage readAll() error: $error');
    }
    return map;
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll();
    } catch (error) {
      logger.d('SecureStorage deleteAll() error: $error');
    }
  }

  Future<String> readSecureData(String key) async {
    String value = "";
    try {
      value = (await _storage.read(key: key)) ?? "";
    } catch (error) {
      logger.d('SecureStorage readSecureData() error: $error');
    }
    return value;
  }

  Future<void> deleteSecureData(String key) async {
    try {
      await _storage.delete(key: key);
    } catch (error) {
      logger.d('SecureStorage deleteSecureData() error: $error');
    }
  }

  Future<void> writeSecureData(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
      );
    } catch (error) {
      logger.d('SecureStorage writeSecureData() error: $error');
    }
  }

  Future<bool> containsSecureData(String key) async {
    var containsData = false;
    try {
      containsData = await _storage.containsKey(key: key);
    } catch (error) {
      logger.d('SecureStorage containsSecureData() error: $error');
    }
    return containsData;
  }
}
