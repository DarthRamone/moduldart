library moduldart;

import 'dart:convert';

import 'package:moduldart/src/models.dart';
import 'package:http/http.dart' as http;
import 'package:moduldart/src/signature_helper.dart';

class ModulBankClient {
  String _merchantId;
  String _secretKey;

  final _headers = {"Authorization": "Bearer"};

  ModulBankClient({String merchantId, String secretKey}) {
    _merchantId = merchantId;
    _secretKey = secretKey;
  }

  Future<Bill> createBill(BillPayload payload) async {
    payload.merchant = _merchantId;
    final signedPayload = _getSignedPayload(payload);
    final response = await http.post("https://pay.modulbank.ru/api/v1/bill/",
        headers: _headers,
        body: signedPayload,
        encoding: Encoding.getByName("utf8"));

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      var bill = responseJson["bill"];
      return Bill.fromJson(bill);
    } else {
      final descr = response.body;
      print(descr);
      throw Exception('Failed to load post');
    }
  }

  Map<String, dynamic> _getSignedPayload(BillPayload payload) {
    var jsonBody = payload.toJson();
    final signature = SignatureHelper.calculate(_secretKey, jsonBody);
    jsonBody["signature"] = signature;
    return jsonBody;
  }
}
