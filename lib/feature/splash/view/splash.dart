import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nxcar/feature/login/view/login.dart';
import 'package:nxcar/feature/splash/controller/splash_controller.dart';
import 'package:nxcar/utils/colors.dart';
import 'package:nxcar/utils/typo.dart';
import 'package:nxcar/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(
                  "assets/nxcar.svg",
                ),
              ),
              //this part used for the stack of images...
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/circle_round.svg",
                    height: 523,
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: SvgPicture.asset(
                      "assets/car_insurance.svg",
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 10,
                    child: SvgPicture.asset(
                      "assets/car_handover.svg",
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      "assets/car_loan_key.svg",
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 10,
                    child: SvgPicture.asset(
                      "assets/car_info.svg",
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      "assets/car_loan.svg",
                      height: 80,
                      width: 80,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 120,
                // this page view builder used for make like crousal ui
                child: PageView.builder(
                  controller: splashController.controller,
                  itemCount: splashController.titleList.length,
                  itemBuilder: (context, index) {
                    return Text(
                      splashController.titleList[index],
                      style: headlineMedium28(Colors.black),
                      textAlign: TextAlign.center,
                    );
                  },
                  onPageChanged: (value) {
                    splashController.selctedIndex.value = value;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //here we are using the animated dots inducator...
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashController.titleList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: AnimatedDot(isActive: splashController.selctedIndex.value == index),
                        ),
                      ),
                    ),
                    InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      onTap: () {
                        splashController.controller
                            .nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                        if (splashController.selctedIndex.value == 2) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
                        }
                      },
                      child: CircleAvatar(
                          backgroundColor: secondaryColor,
                          maxRadius: 30,
                          child: Icon(
                            Icons.keyboard_arrow_right,
                          )),
                    )
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
