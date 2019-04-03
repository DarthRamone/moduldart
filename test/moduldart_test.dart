import 'package:flutter_test/flutter_test.dart';
import 'package:moduldart/src/signature_helper.dart';

void main() {
  test("signature helper test", () {
    final testSecretKey = "A549535729FE7AA0D81FE0382D740EC2";
    final data = {
      "amount": "24",
      "description": "Заказ №57487143",
      "merchant": "ad25ef06-1824-413f-8ef1-c08115b9b979",
      "order_id": "53536534563563",
      "signature": "754dc9402036c6a8c3d5c56ea0f1c635fe912489",
      "testing": "1",
      "unix_timestamp": "1538124620",
      "month": "01",
      "year": "19",
      "client_ip": "127.0.0.1"
    };

    expect(SignatureHelper.calculate(testSecretKey, data),
        "68fa535e26892e6f2be3a204996e26cf1004d07d");
  });
}
