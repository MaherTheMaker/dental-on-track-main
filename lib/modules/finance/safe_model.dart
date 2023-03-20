// To parse this JSON data, do
//
//     final safe = safeFromJson(jsonString);

import 'dart:convert';

Safe safeFromJson(String str) => Safe.fromJson(json.decode(str));

String safeToJson(Safe data) => json.encode(data.toJson());

class Safe {
  Safe({
    this.id,
    this.name,
    this.daoUsers,
    this.type,
    this.balance,
    this.receipt,
    this.expenses,
    this.transactionList,
  });

  int? id;
  String? name;
  dynamic daoUsers;
  String? type;
  double? balance;
  List<Receipt>? receipt;
  List<Expense>? expenses;
  List<dynamic>? transactionList;

  factory Safe.fromJson(Map<String, dynamic> json) => Safe(
    id: json["id"],
    name: json["name"],
    daoUsers: json["daoUsers"],
    type: json["type"],
    balance: json["balance"].toDouble(),
    receipt: List<Receipt>.from(json["receipt"].map((x) => Receipt.fromJson(x))),
    expenses: List<Expense>.from(json["expenses"].map((x) => Expense.fromJson(x))),
    transactionList: List<dynamic>.from(json["transactionList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "daoUsers": daoUsers,
    "type": type,
    "balance": balance,
    "receipt": List<dynamic>.from(receipt!.map((x) => x.toJson())),
    "expenses": List<dynamic>.from(expenses!.map((x) => x.toJson())),
    "transactionList": List<dynamic>.from(transactionList!.map((x) => x)),
  };
}

class Expense {
  Expense({
    this.daoUserName,
    this.date,
    this.totalPrice,
    this.details,
    this.safeName,
  });

  String? daoUserName;
  String? date;
  double? totalPrice;
  String? details;
  String? safeName;

  factory Expense.fromJson(Map<String, dynamic> json) => Expense(
    daoUserName: json["daoUserName"],
    date: json["date"],
    totalPrice: json["totalPrice"],
    details: json["details"],
    safeName: json["safeName"],
  );

  Map<String, dynamic> toJson() => {
    "daoUserName": daoUserName,
    "date": date,
    "totalPrice": totalPrice,
    "details": details,
    "safeName": safeName,
  };
}

class Receipt {
  Receipt({
    this.id,
    this.userName,
    this.patientName,
    this.safeName,
    this.date,
    this.procedure,
    this.total,
    this.discount,
  });

  int? id;
  String? userName;
  String? patientName;
  String? safeName;
  String? date;
  List<dynamic>? procedure;
  double? total;
  bool? discount;

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(
    id: json["id"],
    userName: json["userName"],
    patientName: json["patientName"],
    safeName: json["safeName"],
    date: json["date"],
    procedure: List<dynamic>.from(json["procedure"].map((x) => x)),
    total: json["total"].toDouble(),
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "patientName": patientName,
    "safeName": safeName,
    "date": date,
    "procedure": List<dynamic>.from(procedure!.map((x) => x)),
    "total": total,
    "discount": discount,
  };
}



class AllSafesResponse {
  AllSafesResponse({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
  });

  int id;
  String name;
  String type;
  double balance;

  factory AllSafesResponse.fromJson(String str) => AllSafesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllSafesResponse.fromMap(Map<String, dynamic> json) => AllSafesResponse(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    type: json["type"] == null ? null : json["type"],
    balance: json["balance"] == null ? null : json["balance"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "type": type == null ? null : type,
    "balance": balance == null ? null : balance,
  };
}
