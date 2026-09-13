import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';

import 'consts_values_manager.dart';

class FlutterSecureStorageManager {
  final FlutterSecureStorage storage;

  const FlutterSecureStorageManager(this.storage);

  // ============ Access Token ============
  Future<String?> getAccessToken() => _getToken(
    secureKey: ConstsValuesManager.accessTokenKeySecured,
    boxName: ConstsValuesManager.accessTokenBoxName,
    hiveKey: ConstsValuesManager.accessTokenKeyHive,
  );

  Future<void> writeAccessToken(String token) => _writeToken(
    token: token,
    secureKey: ConstsValuesManager.accessTokenKeySecured,
    boxName: ConstsValuesManager.accessTokenBoxName,
    hiveKey: ConstsValuesManager.accessTokenKeyHive,
  );

  Future<void> deleteAccessToken() => _deleteToken(
    secureKey: ConstsValuesManager.accessTokenKeySecured,
    boxName: ConstsValuesManager.accessTokenBoxName,
    hiveKey: ConstsValuesManager.accessTokenKeyHive,
  );

  // ============ Refresh Token ============
  Future<String?> getRefreshToken() => _getToken(
    secureKey: ConstsValuesManager.refreshTokenKeySecured,
    boxName: ConstsValuesManager.refreshTokenBoxName,
    hiveKey: ConstsValuesManager.refreshTokenKeyHive,
  );

  Future<void> writeRefreshToken(String token) => _writeToken(
    token: token,
    secureKey: ConstsValuesManager.refreshTokenKeySecured,
    boxName: ConstsValuesManager.refreshTokenBoxName,
    hiveKey: ConstsValuesManager.refreshTokenKeyHive,
  );

  Future<void> deleteRefreshToken() => _deleteToken(
    secureKey: ConstsValuesManager.refreshTokenKeySecured,
    boxName: ConstsValuesManager.refreshTokenBoxName,
    hiveKey: ConstsValuesManager.refreshTokenKeyHive,
  );

  // ============ Core Generic Logic ============
  Future<String?> _getToken({
    required String secureKey,
    required String boxName,
    required String hiveKey,
  }) async {
    final box = await _openEncryptedBox(secureKey: secureKey, boxName: boxName);
    return box.get(hiveKey);
  }

  Future<void> _writeToken({
    required String token,
    required String secureKey,
    required String boxName,
    required String hiveKey,
  }) async {
    final box = await _openEncryptedBox(secureKey: secureKey, boxName: boxName);
    await box.put(hiveKey, token);
  }

  Future<void> _deleteToken({
    required String secureKey,
    required String boxName,
    required String hiveKey,
  }) async {
    final box = await _openEncryptedBox(secureKey: secureKey, boxName: boxName);
    await box.delete(hiveKey);
    await storage.delete(key: secureKey);
  }

  Future<Box<String>> _openEncryptedBox({
    required String secureKey,
    required String boxName,
  }) async {
    String? encodedKey = await storage.read(key: secureKey);

    if (encodedKey == null) {
      final newKey = _generateSecureKey();
      encodedKey = base64UrlEncode(newKey);
      await storage.write(key: secureKey, value: encodedKey);
    }

    return Hive.openBox<String>(
      boxName,
      encryptionCipher: HiveAesCipher(base64Url.decode(encodedKey)),
    );
  }

  Uint8List _generateSecureKey() {
    final random = Random.secure();
    return Uint8List.fromList(
      List<int>.generate(32, (_) => random.nextInt(256)),
    );
  }
}
