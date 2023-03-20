import 'dart:convert';

import 'package:dental_on_track/config/config.dart';

import 'medical_hes_model.dart';

class AllMedicalHestoryService {
  Future<bool> addMedHis(int IllId, String notes, int patientId) async {
    var url =
        Config.publicDomainAddress + '/patient/' + '$patientId' + '/addMedHis';
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
          'Bearer ${Config.token}'
    };
    final msg = jsonEncode({
      'IllId': IllId,
      'notes': notes,
    });

    var response =
        await Config.client.post(Uri.parse(url), headers: headers, body: msg);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
  Future<bool> addNewIllness(String name, String notes, String gender) async {
    var url =
        Config.publicDomainAddress + '/clinic/AddIllness';
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
          'Bearer ${Config.token}'
    };
    final msg = jsonEncode({
      'name': name,
      'gender': gender,
      'notes': notes,
    });

    var response =
        await Config.client.post(Uri.parse(url), headers: headers, body: msg);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200||response.statusCode==202) {
      return true;
    }
    return false;
  }

  Future<List<Illnesses>> getAllIIllnesses() async {
    var url = Config.publicDomainAddress + Config.getAllIllnesses;
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
          'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<Illnesses> jsonResponse = illnessesFromJson(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }

  Future<List<MedicalHistory>> getAllMedHis(int patientId) async {
    var url = Config.publicDomainAddress +
        '/patient/' +
        '$patientId' +
        '/getAllMedHis';
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
          'Bearer ${Config.token}'
    };

    var response = await Config.client.get(Uri.parse(url), headers: headers);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<MedicalHistory> jsonResponse = medicalHistoryFromJson(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
}
