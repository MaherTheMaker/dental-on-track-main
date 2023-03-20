import 'package:dental_on_track/components/dental_chart.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/modules/dental_chart/dental_chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/pediatric_dental_chart.dart';
import '../../config/size_config.dart';

class DentalChart extends StatefulWidget {
  @override
  State<DentalChart> createState() => _DentalChartState();
}

class _DentalChartState extends State<DentalChart> with SingleTickerProviderStateMixin  {
  late TabController tabController;
  DentalChartController _controller=Get.put(DentalChartController());

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async{
        Get.delete<DentalChartController>();
        return true;
      },
      child: Scaffold(
        body: Obx((){
          if(_controller.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    SliverToBoxAdapter(
                      child: TabBar(
                        controller: tabController,
                        indicatorColor: buttonColor,
                        labelColor: buttonColor,
                        tabs: [
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  .5,
                              height:  MediaQuery.of(context).size.height*.1,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Text(
                                    "Adult",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:
                                        getProportionateScreenWidth(
                                            12)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: SizedBox(
                                width:
                                MediaQuery.of(context).size.width *
                                    .5,
                                child: Text(
                                  "Pediatric",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                      getProportionateScreenWidth(
                                          12)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  children: [
                    AdultDentalChart(_controller.adult),
                    PediatricDentalChart(_controller.pediatric),
                  ],
                ),
              ),
            );
          }
        })
      ),
    );
  }
}
