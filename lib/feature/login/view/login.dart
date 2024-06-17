import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nxcar/feature/login/controller/login_controller.dart';
import 'package:nxcar/feature/login/view/otp_view.dart';
import 'package:nxcar/utils/button.dart';
import 'package:nxcar/utils/input_field.dart';
import 'package:nxcar/utils/typo.dart';
import 'package:nxcar/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Obx(() {
            return Form(
              key: loginController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back!",
                    style: headlineMedium24(Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Please fill out the details",
                    style: titleMedium16(Colors.black),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  //here textfield .....
                  Focus(
                    onFocusChange: (hasFocus) {
                      loginController.numberFocous.value = hasFocus;
                    },
                    child: TextFieldDefault(
                      controller: loginController.number,
                      text: "Enter your number",
                      textInputType: TextInputType.number,
                      isFilled: loginController.numberFocous.value,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      validator: (value) {
                        return validateMobile(value ?? "");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      loginController.nameFocous.value = hasFocus;
                    },
                    child: TextFieldDefault(
                      controller: loginController.name,
                      text: "Enter your name",
                      isFilled: loginController.nameFocous.value,
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return "Name cannot be empty";
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      loginController.emailFocous.value = hasFocus;
                    },
                    child: TextFieldDefault(
                      controller: loginController.email,
                      text: "Enter your email",
                      isFilled: loginController.emailFocous.value,
                      validator: (value) {
                        return validateEmailNumber(value ?? "");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      loginController.vehicleNumberfocous.value = hasFocus;
                    },
                    child: TextFieldDefault(
                      controller: loginController.vehicleNumber,
                      text: "Enter your vehicle number",
                      isFilled: loginController.vehicleNumberfocous.value,
                      validator: (value) {
                        return validateRegistrationNumber(value ?? "");
                      },
                      // GJ 01 AA 1234
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  //button
                  PrimaryButtonLarge(
                    onTap: () {
                      if (loginController.formKey.currentState?.validate() ?? false) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Otp()));
                      }
                    },
                    text: "Next",
                  )
                ],
              ),
            );
          }),
        ));
  }
}
