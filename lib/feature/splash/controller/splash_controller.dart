import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nxcar/api/error_handling/app_response.dart';

class SplashController extends GetxController {
  RxInt selctedIndex = 0.obs;
  PageController controller = PageController();
  List<String> titleList = [
    "Buy a Pre Owned Car with Confidence",
    "Rev Up Your Dreams with Our Used Car Loans",
    "Simplified Used Car Financing with Nxcar",
  ];
}
