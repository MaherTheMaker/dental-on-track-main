// To parse this JSON data, do
//
//     final clinic = clinicFromJson(jsonString);

import 'dart:convert';

import 'secure_storage.dart';

Clinic clinicFromJson(String str) => Clinic.fromJson(json.decode(str));

String clinicToJson(Clinic data) => json.encode(data.toJson());

class Clinic {
  Clinic({
    this.id,
    this.ownerName,
    this.username,
    this.clinicName,
    this.createDate,
    this.updateDate,
    this.mobilePhone,
    this.clinicAddress,
    this.clinicPhone,
    this.actPlan,
    this.clinicPlans,
  });

  int? id;
  String? ownerName;
  String? username;
  String? clinicName;
  dynamic createDate;
  dynamic updateDate;
  dynamic mobilePhone;
  dynamic clinicAddress;
  dynamic clinicPhone;
  dynamic actPlan;
  dynamic clinicPlans;

  factory Clinic.fromJson(Map<String, dynamic> json) => Clinic(
    id: json["id"],
    ownerName: json["ownerName"],
    username: json["username"],
    clinicName: json["clinicName"],
    createDate: json["createDate"],
    updateDate: json["updateDate"],
    mobilePhone: json["mobilePhone"],
    clinicAddress: json["clinicAddress"],
    clinicPhone: json["clinicPhone"],
    actPlan: json["actPlan"],
    clinicPlans: json["clinicPlans"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ownerName": ownerName,
    "username": username,
    "clinicName": clinicName,
    "createDate": createDate,
    "updateDate": updateDate,
    "mobilePhone": mobilePhone,
    "clinicAddress": clinicAddress,
    "clinicPhone": clinicPhone,
    "actPlan": actPlan,
    "clinicPlans": clinicPlans,
  };
  static late SecureStorage secureStorage;

  saveData() async {
    secureStorage = SecureStorage();
    secureStorage.storeValue('clinic_id', id.toString());
    secureStorage.storeValue('clinic_ownername', ownerName);
    secureStorage.storeValue('clinic_username', username);
    secureStorage.storeValue('clinic_name', clinicName);
    secureStorage.storeValue('clinic_createdate', createDate);
    secureStorage.storeValue('clinic_updatedate', updateDate);
    secureStorage.storeValue('clinic_mobilephone', clinicPhone);
    secureStorage.storeValue('phone', mobilePhone);
    secureStorage.storeValue('clinic_address', clinicAddress);
    secureStorage.storeValue('actPlan', actPlan);
    secureStorage.storeValue('clinicPlans', clinicPlans);
  }

  updateData() {
    secureStorage = SecureStorage();
    secureStorage.storeValue('clinic_id', id);
    secureStorage.storeValue('clinic_ownername', ownerName);
    secureStorage.storeValue('clinic_username', username);
    secureStorage.storeValue('clinic_name', clinicName);
    secureStorage.storeValue('clinic_createdate', createDate);
    secureStorage.storeValue('clinic_updatedate', updateDate);
    secureStorage.storeValue('clinic_mobilephone', clinicPhone);
    secureStorage.storeValue('phone', mobilePhone);
    secureStorage.storeValue('clinic_address', clinicAddress);
    secureStorage.storeValue('actPlan', actPlan);
    secureStorage.storeValue('clinicPlans', clinicPlans);
  }
  Future<Clinic> readData() async{
    secureStorage = SecureStorage();
    Clinic clinic;
    String? id=await secureStorage.readValue('clinic_id');
    int clinicId=int.parse(id!);
    String? ownerName=await secureStorage.readValue('clinic_ownername');
    String? userName=await secureStorage.readValue('clinic_username');
    String? clinicName=await secureStorage.readValue('clinic_name');
    String? clinicMobilePhone=await secureStorage.readValue('clinic_mobilephone');
    String? phone=await secureStorage.readValue('phone');
    String? clinicAddress=await secureStorage.readValue('clinic_address');


    clinic=Clinic(
      id: clinicId,
      ownerName: ownerName,
      username: userName,
      clinicName: clinicName,
      clinicPhone: clinicMobilePhone,
      mobilePhone: phone,
      clinicAddress: clinicAddress
    );
    return clinic;
  }

  static clearData() async {
    secureStorage.deleteValue('clinic_id');
    secureStorage.deleteValue('clinic_ownername');
    secureStorage.deleteValue('clinic_username');
    secureStorage.deleteValue('clinic_name');
    secureStorage.deleteValue('clinic_createdate');
    secureStorage.deleteValue('clinic_updatedate');
    secureStorage.deleteValue('clinic_mobilephone');
    secureStorage.deleteValue('phone');
    secureStorage.deleteValue('clinic_address');
    secureStorage.deleteValue('actPlan');
    secureStorage.deleteValue('clinicPlans');
  }
}
