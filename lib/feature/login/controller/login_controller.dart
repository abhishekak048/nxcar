import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nxcar/api/error_handling/app_response.dart';
import 'package:nxcar/feature/login/repo/login_repo.dart';

class LoginController extends GetxController {
  TextEditingController number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  RxBool numberFocous = false.obs;
  RxBool nameFocous = false.obs;
  RxBool emailFocous = false.obs;
  RxBool vehicleNumberfocous = false.obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController otpcontrller1 = TextEditingController();
  TextEditingController otpcontrller2 = TextEditingController();
  TextEditingController otpcontrller3 = TextEditingController();
  TextEditingController otpcontrller4 = TextEditingController();

  double? height;
  double? width;
  RxBool errostate = false.obs;

  // Rx<ApiResponse> valueDemo = ApiResponse.initial('Empty data').obs;

  // Future<void> fetchData() async {
  //   valueDemo.value = ApiResponse.loading('Fetching artist data');
  //   try {
  //     valueDemo.value = ApiResponse.completed(await LoginRepo().fetchData());
  //   } catch (e) {
  //     valueDemo.value = ApiResponse.error(e.toString());
  //   }
  // }
}
