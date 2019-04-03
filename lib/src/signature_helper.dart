import 'dart:convert';
import 'package:crypto/crypto.dart';

class SignatureHelper {
  static String calculate(String secretKey, Map data) {
    var filteredData = Map.from(data);
    filteredData
      ..removeWhere((k, v) => v == "")
      ..removeWhere((k, v) => k == "signature");

    final keys = filteredData.keys
        .map((k) => "$k=${_calculateBase64(filteredData[k])}")
        .toList();
    keys.sort();

    final values = keys.reduce((s1, s2) => "$s1&$s2");

    return _calculateSha1(secretKey + _calculateSha1(secretKey + values));
  }

  static String _calculateSha1(String input) {
    var bytes = utf8.encode(input);
    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  static String _calculateBase64(String input) {
    var bytes = utf8.encode(input);
    var digest = base64.encode(bytes);
    return digest.toString();
  }
}