import 'package:flutter/material.dart';
import 'package:nxcar/utils/colors.dart';

String? validateEmailNumber(String value) {
  final regExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  if (value.isEmpty) {
    return 'Email number cannot be empty';
  } else if (!regExp.hasMatch(value.trim())) {
    return 'Invalid Email address';
  }
  return null;
}

String? validateRegistrationNumber(String value) {
  final regExp = RegExp(r'^[A-Z]{2}[0-9]{2}[A-HJ-NP-Z]{1,2}[0-9]{4}$');
  if (value.isEmpty) {
    return 'Registration number cannot be empty';
  } else if (!regExp.hasMatch(value.trim())) {
    return 'Invalid registration number';
  }
  return null;
}

String? validateMobile(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

bool checkNullOrEmpty(String? value) {
  if (value == "null") {
    return true;
  } else if (value != null && value.isNotEmpty) {
    return false;
  } else {
    return true;
  }
}

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 40 : 12,
      decoration: BoxDecoration(
        color: isActive ? secondaryColor : const Color(0xFF868686).withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
