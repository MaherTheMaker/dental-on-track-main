// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

List<Plan> planFromJson(String str) => List<Plan>.from(json.decode(str).map((x) => Plan.fromJson(x)));

String planToJson(List<Plan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plan {
  Plan({
    this.id,
    this.pName,
    this.price,
    this.maxUser,
    this.setOfFeatures,
  });

  int? id;
  String? pName;
  String? price;
  int? maxUser;
  String? setOfFeatures;

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    pName: json["pName"],
    price: json["price"],
    maxUser: json["maxUser"],
    setOfFeatures: json["setOfFeatures"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pName": pName,
    "price": price,
    "maxUser": maxUser,
    "setOfFeatures": setOfFeatures,
  };
}
