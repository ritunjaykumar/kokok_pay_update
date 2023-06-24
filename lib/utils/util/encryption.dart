import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:kokok_pay/application/application.dart';
import 'package:pointycastle/asymmetric/api.dart';

class RSAEncryption {
  final RSAPublicKey publicKey;
  final Random random;

  RSAEncryption(this.publicKey) : random = Random.secure();

  String encryptData(String msg) {
    logger.i('to encrypt: $msg');
    final encryptor = Encrypter(RSA(publicKey: publicKey));
    Encrypted encrypt = encryptor.encrypt(msg);
    logger.i('encrypted data: ${encrypt.base64}');
    return encrypt.base64;
  }

  String getHashedData(String msg) {
    logger.i('to hashed: $msg');
    var bytes1 = utf8.encode(msg);
    Digest digest = sha512.convert(bytes1);
    logger.i('hashed value: $digest');
    return digest.toString();
  }

  String getSalt() {
    const int max = 4294967296;
    var nextInt = random.nextInt(max);
    return nextInt.toString();
  }
}
