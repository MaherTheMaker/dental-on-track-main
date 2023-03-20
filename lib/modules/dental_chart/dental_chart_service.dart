import 'package:dental_on_track/modules/dental_chart/tooth_model.dart';

import '../../config/config.dart';

class DentalChartService{

  Future<List<Tooth>> getTeeth(int id) async{
    var url = Config.publicDomainAddress + Config.getTeeth+'$id/Teeth';
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
      List<Tooth> jsonResponse = toothFromJson(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
}