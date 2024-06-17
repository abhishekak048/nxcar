import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nxcar/utils/colors.dart';

class PrimaryButtonLarge extends StatelessWidget {
  Rx<bool> pressState = false.obs;
  VoidCallback onTap;
  String text;

  PrimaryButtonLarge({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // pressState.value = true;
          onTap();
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
          decoration: ShapeDecoration(
            color: secondaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ));
  }
}
