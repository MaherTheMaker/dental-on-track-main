import 'package:dental_on_track/modules/dental_chart/dental_chart_service.dart';
import 'package:dental_on_track/modules/dental_chart/tooth_model.dart';
import 'package:get/get.dart';

class DentalChartController extends GetxController{
  var isLoading=true.obs;
  List<Tooth> teeth=[];
  var patientId;

  List<Tooth> adult=[];

  List<Tooth> pediatric=[];

  DentalChartService _service=DentalChartService();


  @override
  void onInit() {
    super.onInit();
    patientId=Get.arguments;
    getTeeth();
  }

  Future<void> getTeeth() async{
    var response = await _service.getTeeth(patientId);
    teeth = response;
    for(int i=0;i<32;i++){
      adult.add(teeth[i]);
    }
    for(int i=32;i<52;i++){
      pediatric.add(teeth[i]);
    }
    isLoading.value = false;
    update();
  }
}