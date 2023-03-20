import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dental_on_track/components/custom_button.dart';
import 'package:dental_on_track/config/constants.dart';
import 'package:dental_on_track/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          CarouselWithIndicatorDemo(),
          Positioned(bottom: 0.0, child: _buildBottomSheet(context)),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .4,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24), topLeft: Radius.circular(24)),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                gradientColor.withOpacity(.75),
                Colors.white,
              ],
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Logo(
              width: MediaQuery.of(context).size.width * .75,
              height: MediaQuery.of(context).size.height * .15,
            ),
            Text(
              "This is a product for dentist clinic systems",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSansSemiBold",
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            CustomButton(
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color:Colors.white,
                  fontFamily: "OpenSansBold",
                ),
                width: MediaQuery.of(context).size.width*.8,
                height: getProportionateScreenHeight(56),
                color: buttonColor,
                onTap: (){
                  Get.toNamed("/sign_up");
                },
                text: "Get Started")
          ],
        ));
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
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
                  height: SizeConfig.screenWidth,
                  fit: BoxFit.cover,
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
              height: MediaQuery.of(context).size.height * .8,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
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
    ]);
  }
}
