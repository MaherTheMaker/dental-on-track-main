import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dental_on_track/components/circled_profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../components/home_page_button.dart';
import '../../components/logo.dart';
import '../../config/constants.dart';
import '../../config/size_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * .925,
                      height: MediaQuery.of(context).size.height * .3,
                      child: CarouselWithIndicatorDemo()),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30)
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/all_appointments');
                          },
                         width: MediaQuery.of(context).size.width*.425,
                         height: getProportionateScreenHeight(120),
                          text: "Appointments",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansBold",
                            color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/appointments.png",
                        ),
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/patients_list');
                          },
                         width: MediaQuery.of(context).size.width*.425,
                         height: getProportionateScreenHeight(120),
                          text: "Patients",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansBold",
                            color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/patients.png",
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomePageButton(
                          onTap: (){

                          },
                         width: MediaQuery.of(context).size.width*.425,
                         height: getProportionateScreenHeight(120),
                          text: "Account Settings",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansBold",
                            color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/account_settings.png",
                        ),
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/finance_screen');
                          },
                         width: MediaQuery.of(context).size.width*.425,
                         height: getProportionateScreenHeight(120),
                          text: "Finance",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontFamily: "OpenSansBold",
                            color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/finance.png",
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/procedures_list');
                          },
                          width: MediaQuery.of(context).size.width*.425,
                          height: getProportionateScreenHeight(120),
                          text: "Procedures",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontFamily: "OpenSansBold",
                              color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/account_settings.png",
                        ),
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/create_sub_user');
                          },
                          width: MediaQuery.of(context).size.width*.425,
                          height: getProportionateScreenHeight(120),
                          text: "Create Sub User",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontFamily: "OpenSansBold",
                              color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/patients.png",
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(25),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HomePageButton(
                          onTap: (){
                            Get.toNamed('/all_illnesses');
                          },
                          width: MediaQuery.of(context).size.width*.425,
                          height: getProportionateScreenHeight(120),
                          text: "Illnesses",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontFamily: "OpenSansBold",
                              color: buttonColor
                          ),
                          buttonColor: Colors.white,
                          iconColor: buttonColor,
                          imageUrl: "assets/images/account_settings.png",
                        ),
                      ],
                    ),
                  ),
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
                      Align(
                        alignment: const Alignment(-.8, 0),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            width: getProportionateScreenWidth(50),
                            height: getProportionateScreenWidth(50),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                  offset: Offset(0,1),
                                  spreadRadius: 1.0
                                ),
                              ]
                            ),
                            child: const Center(
                              child: FaIcon(FontAwesomeIcons.list,color:buttonColor),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(.8, 0),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            width: getProportionateScreenWidth(50),
                            height: getProportionateScreenWidth(50),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  offset: Offset(0,3),
                                  spreadRadius: 3.0
                                ),
                              ]
                            ),
                            child: ProfilePic(
                                color: Colors.transparent,
                                width: getProportionateScreenWidth(50), height: getProportionateScreenWidth(50))
                          ),
                        ),
                      ),
                      Center(
                        child: Logo(
                          width: MediaQuery.of(context).size.width * .4,
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key? key}) : super(key: key);

  // List<Ad>? ads;

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imageSlider = [
    "assets/images/first_welcome_screen.png",
    "assets/images/second_welcome_screen.png",
    "assets/images/second_welcome_screen.png",
    "assets/images/second_welcome_screen.png",
    "assets/images/second_welcome_screen.png",

  ];

  // List<Ad>? ads;

  @override
  Widget build(BuildContext context) {
    final List<Widget> sliders = imageSlider
        .map((item) => Stack(
      children: <Widget>[
        Image.asset(
          item,
          width: SizeConfig.screenWidth,
          fit: BoxFit.fill,
        ),
      ],
    ))
        .toList();
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: sliders,
          carouselController: _controller,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .3,
              viewportFraction: .8,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      const SizedBox(
        height: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageSlider.asMap().entries.map((entry) {
          return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key ? buttonColor : Colors.grey,
                ),
              ));
        }).toList(),
      ),
    ]);
  }
}
