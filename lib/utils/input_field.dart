import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nxcar/utils/colors.dart';

class TextFieldDefault extends StatelessWidget {
  TextEditingController? controller;
  String? text;
  String? hintText;
  String? suffixIcon;
  String? errorText;
  TextInputType? textInputType;
  bool disable = false;
  bool? autoValidateMode;
  Color? disableColor;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;
  ValueChanged<String>? onChanged;
  TextCapitalization? textCapitalization;
  bool autofocus;
  bool obscureText;
  bool floatingBehaviour;
  int? maxLength;
  bool isFilled = false;
  Function()? onTap;
  EdgeInsetsGeometry? contentPadding;
  FocusNode? focusNode;

  TextFieldDefault(
      {super.key,
      this.onTap,
      this.autofocus = false,
      this.autoValidateMode = false,
      required this.controller,
      required this.text,
      this.hintText,
      this.suffixIcon,
      this.errorText,
      this.textInputType,
      this.disable = false,
      this.disableColor,
      this.validator,
      this.inputFormatters,
      this.textCapitalization,
      this.onChanged,
      this.floatingBehaviour = true,
      this.obscureText = false,
      this.isFilled = false,
      this.contentPadding,
      this.focusNode,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      autofocus: autofocus,
      focusNode: focusNode,
      autovalidateMode:
          autoValidateMode == true ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
      controller: controller,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: obscureText,
      cursorHeight: 25,
      readOnly: disable ?? false,
      validator: validator,
      onChanged: onChanged,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      style: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: (isFilled ?? false) ? true : false,
        fillColor: neutrals_07,
        isDense: true,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(width: 1, color: Color(0x66333846))),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: neutrals_07, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        labelStyle: TextStyle(
          color: Color(0xB2333846),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0.10,
        ),
        labelText: text ?? "",
        hintText: text ?? "",
        hintStyle: TextStyle(
          color: Color(0xB2333846),
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0.10,
        ),
        errorText: errorText,
        floatingLabelBehavior:
            floatingBehaviour == true ? FloatingLabelBehavior.auto : FloatingLabelBehavior.never,
        suffix: suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  controller?.text = "";
                },
                child: suffixIcon!.contains('assets')
                    ? SvgPicture.asset(suffixIcon!)
                    : SvgPicture.network(suffixIcon ?? ""),
              )
            : null,
      ),
    );
  }
}
