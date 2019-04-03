class BillPayload {
  String id;
  String merchant;
  String description;
  double amount;
  DateTime expires;
  String emailForNotification;
  String receiptContact;
  String clientEmail;
  bool testing = false;
  String signature;
  DateTime timestamp;
  bool sendLinkViaEmail = false;
  List<ReceiptItem> receiptItems;
  String salt;

  Map<String, dynamic> toJson() {
    var result = {
      "merchant": merchant,
      "amount": amount?.toStringAsFixed(2)?.replaceAll(",", "."),
      "description": description,
      "testing": "1", //testing ? "1" : "0",
      "client_email": clientEmail,
      "send_letter": "1", //sendLinkViaEmail ? "1" : "0",
      "receipt_contact": receiptContact,
      "receipt_items":
          "[${receiptItems?.map((i) => i.toJson().toString())?.join(',')}]",
      "unix_timestamp": timestamp?.millisecondsSinceEpoch?.toString(),
      "salt": salt,
      "signature": signature
    };

    result.removeWhere((k, v) => v == null);

    return result;
  }
}

class ReceiptItem {
  double price;
  double discountSum;
  String name;
  int quantity;
  String description;
  String sno;
  String paymentObject;
  String paymentMethod;
  String vat;

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "quantity": quantity?.toString(),
      "price": price?.toStringAsFixed(2)?.replaceAll(",", "."),
      "sno": sno,
      "discount_sum": discountSum?.toStringAsFixed(2)?.replaceAll(",", "."),
      "payment_obejct": paymentObject,
      "payment_method": paymentMethod,
      "vat": vat
    };
  }
}

class Bill {
  double amount;
  String id;
  String clientEmail;
  DateTime createdDateTime;
  String currency;
  String description;
  bool expired;
  String merchant;
  int number;
  bool paid;
  bool sendLetter;
  bool testing;
  //Transaction transaction; TODO: implement transaction
  String url;

  Bill();

  factory Bill.fromJson(Map<String, dynamic> json) {
    var bill = new Bill()
      ..amount = double.parse(json["amount"])
      ..id = json["id"]
      ..clientEmail = json["client_email"]
      //..createdDateTime TODO: implement createdDateTime
      ..currency = json["currency"]
      ..description = json["description"]
      ..expired = json["expired"] == 1
      ..merchant = json["merchant"]
      ..number = json["number"]
      ..paid = json["paid"] == 1
      ..sendLetter = json["sendLetter"] == 1
      ..testing = json["testing"] == 1
      ..url = json["url"];

    return bill;
  }
}
