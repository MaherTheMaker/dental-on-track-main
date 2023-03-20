import 'package:dental_on_track/dashboard/request_info.dart';
import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../config/constants.dart';
import '../config/size_config.dart';

class DashboardHome extends StatelessWidget {
  const DashboardHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              gradientColor.withOpacity(.75),
              Colors.white,
            ],
          )),
          child: Column(
            children: [
              Center(
                  child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .35,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                        ),
                        CustomButton(
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.white,
                              fontFamily: "OpenSansBold",
                            ),
                            width: MediaQuery.of(context).size.width * .25,
                            height: getProportionateScreenHeight(100),
                            color: buttonColor,
                            onTap: () {},
                            text: "Clinics"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                        ),
                        CustomButton(
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.white,
                              fontFamily: "OpenSansBold",
                            ),
                            width: MediaQuery.of(context).size.width * .25,
                            height: getProportionateScreenHeight(100),
                            color: buttonColor,
                            onTap: () {},
                            text: "Plans"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .15,
                        ),
                        CustomButton(
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.white,
                              fontFamily: "OpenSansBold",
                            ),
                            width: MediaQuery.of(context).size.width * .25,
                            height: getProportionateScreenHeight(100),
                            color: buttonColor,
                            onTap: () {},
                            text: "Feedbacks"),
                      ],
                    ),
                  ),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .65,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .1,
                            ),
                            Center(
                              child: Text(
                                "Pending Requests",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: getProportionateScreenWidth(20),
                                  fontFamily: "OpenSansBold",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .6,
                              child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => PendingRequestInfo()));
                                          },
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .5,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10.0)),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 1.0,
                                                    spreadRadius: 1.0,
                                                    color: Colors.grey
                                                        .withOpacity(.5),
                                                    offset: const Offset(0, 1),
                                                  ),
                                                ]),
                                            child: Center(
                                              child: Text(
                                                "Pending Request Info",
                                                style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          18),
                                                  color: Colors.white,
                                                  fontFamily: "OpenSansBold",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        )),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
