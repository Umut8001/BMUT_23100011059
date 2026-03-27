import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;

class AESHelper {
  static final _key = encrypt.Key.fromUtf8(
    'NecmettinErbakanUniversitesi4242',
  ); // 32 byte = AES-256
  static final _iv = encrypt.IV.fromLength(16); // 16 byte IV

  static String encryptText(String plainText) {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc),
    );

    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return base64Encode(encrypted.bytes);
  }

  static String decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(_key, mode: encrypt.AESMode.cbc),
    );

    final decrypted = encrypter.decryptBytes(
      encrypt.Encrypted(base64Decode(encryptedText)),
      iv: _iv,
    );

    return utf8.decode(decrypted);
  }
}
