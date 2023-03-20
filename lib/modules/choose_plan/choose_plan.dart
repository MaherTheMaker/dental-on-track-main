import 'package:dental_on_track/modules/choose_plan/choose_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../components/custom_button.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class ChoosePlan extends StatefulWidget {
  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  ChoosePlanController _controller=Get.put(ChoosePlanController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx((){
          if(_controller.isLoading.value){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Center(
                      child: Text(
                        "Choose Plan",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(22),
                          fontFamily: "OpenSansBold",
                          color: buttonColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(35),
                    ),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*.6,
                        width: MediaQuery.of(context).size.width*.9,
                        child: ListView.builder(
                            itemCount: _controller.plans.length,
                            itemBuilder: (BuildContext context,int index){
                              print(_controller.plans[index].pName);
                              print("asnfhibadsv");
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap:(){
                                      setState(() {
                                        _controller.selected.value=index;

                                      });
                                    },
                                    child: Container(
                                      height:MediaQuery.of(context).size.height*.1,
                                      decoration: _controller.selected.value!=index?BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0,1),
                                                color: Colors.grey.withOpacity(.5),
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.circular(10.0))
                                      ):const BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0,1),
                                                color: Colors.black,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(Radius.circular(10.0))
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${_controller.plans[index].pName}",
                                              style: TextStyle(
                                                fontSize: getProportionateScreenWidth(18),
                                                color:buttonColor,
                                                fontFamily: "OpenSansBold",
                                              ),
                                            ),
                                            Text(
                                              "${_controller.plans[index].price}",
                                              style: TextStyle(
                                                fontSize: getProportionateScreenWidth(18),
                                                color:buttonColor,
                                                fontFamily: "OpenSansBold",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(15),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Center(
                      child: CustomButton(
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color:Colors.white,
                            fontFamily: "OpenSansBold",
                          ),
                          width: MediaQuery.of(context).size.width*.8,
                          height: getProportionateScreenHeight(56),
                          color: buttonColor,
                          onTap: () async{
                            EasyLoading.show(status: "Loading");
                            await _controller.addPlan();
                          },
                          text: "Save"),
                    ),

                  ],
                ),
                Positioned(
                    top: 0.0,
                    child: Container(
                      color: Colors.white,
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Center(
                            child: Logo(
                              width: MediaQuery.of(context).size.width * .5,
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }
        })
      ),
    );
  }
}
