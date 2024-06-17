import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nxcar/feature/login/controller/login_controller.dart';
import 'package:nxcar/feature/login/view/home.dart';
import 'package:nxcar/utils/button.dart';
import 'package:nxcar/utils/colors.dart';
import 'package:nxcar/utils/typo.dart';

class Otp extends StatefulWidget {
  final String? phnNumber;
  final String? code;
  String? from;
  Otp({Key? key, this.phnNumber, this.from, this.code}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  void initState() {
    super.initState();
  }

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    loginController.height = MediaQuery.of(context).size.height;
    loginController.width = MediaQuery.of(context).size.height;
    return Obx(() {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Enter your OTP", style: headlineMedium24(Colors.black)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "99******89",
                  style: titleMedium16(Colors.black),
                ),
                SizedBox(
                  height: loginController.height! / 38,
                ),
                // input pin enter++++
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false, controllerr: loginController.otpcontrller1),
                        _textFieldOTP(first: false, last: false, controllerr: loginController.otpcontrller2),
                        _textFieldOTP(first: false, last: false, controllerr: loginController.otpcontrller3),
                        _textFieldOTP(first: false, last: true, controllerr: loginController.otpcontrller4),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          loginController.errostate.value ? "Invalid OTP!" : "Resend OTP?",
                          style: bodyMedium14(loginController.errostate.value ? Colors.red : textColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: loginController.height! / 28,
                    ),
                    PrimaryButtonLarge(
                        onTap: () {
                          if (loginController.otpcontrller1!.text.isNotEmpty &&
                              loginController.otpcontrller2!.text.isNotEmpty &&
                              loginController.otpcontrller3!.text.isNotEmpty &&
                              loginController.otpcontrller4!.text.isNotEmpty) {
                            print("done");
                            if ("1234" ==
                                "${loginController.otpcontrller1!.text + loginController.otpcontrller2!.text + loginController.otpcontrller3!.text + loginController.otpcontrller4!.text}") {
                              loginController.errostate.value = false;
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                            } else {
                              loginController.errostate.value = true;
                            }
                          }
                        },
                        text: "Verify")
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _textFieldOTP({bool? first, last, TextEditingController? controllerr}) {
    return Container(
      height: loginController.height! / 12,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controllerr,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black54),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
