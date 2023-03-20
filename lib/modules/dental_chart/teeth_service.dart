import 'dart:convert';

import 'package:dental_on_track/modules/dental_chart/tooth_model.dart';

import '../../config/config.dart';

class TeethService{
  Future<bool> editTeeth(Tooth t,String status,String notes) async {
    var url =
        Config.publicDomainAddress + '/patient/${t.id}/editTooth';
    print(url);
    Map<String, String> headers = {
      'accept': '*/*',
      'Connection': 'keep-alive',
      'Content-Type': 'application/json;charset=UTF-8',
      'Authorization':
      'Bearer ${Config.token}'
    };
    final msg = jsonEncode({
      'status': status,
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

}