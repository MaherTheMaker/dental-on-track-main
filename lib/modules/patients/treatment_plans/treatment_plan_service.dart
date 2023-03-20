import 'package:dental_on_track/config/config.dart';
import 'package:dental_on_track/modules/patients/treatment_plans/treatment_plan_model.dart';

class TreatmentPlanService {

  Future<List<TreatmentPlanResponse>> getAllTreatmentPlans(int patientId) async {
    var url = Config.publicDomainAddress +
        '/TreatmentPlan/' +
        '$patientId' +
        '/GetAllPatientTreatmentPlan';
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
    if (response.statusCode == 202) {
      List<TreatmentPlanResponse> jsonResponse = treatmentPlanResponseFromMap(response.body);
      return jsonResponse;
    } else {
      return [];
    }
  }
}