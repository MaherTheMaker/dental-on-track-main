// To parse this JSON data, do
//
//     final planStatus = planStatusFromJson(jsonString);

import 'dart:convert';

PlanStatus planStatusFromJson(String str) => PlanStatus.fromJson(json.decode(str));

String planStatusToJson(PlanStatus data) => json.encode(data.toJson());

class PlanStatus {
  PlanStatus({
    this.id,
    this.cId,
    this.pId,
    this.activate,
  });

  int? id;
  int? cId;
  int? pId;
  bool? activate;

  factory PlanStatus.fromJson(Map<String, dynamic> json) => PlanStatus(
    id: json["id"],
    cId: json["cId"],
    pId: json["pId"],
    activate: json["activate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cId": cId,
    "pId": pId,
    "activate": activate,
  };
}
