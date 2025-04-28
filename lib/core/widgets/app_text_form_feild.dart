import 'package:doc/core/Theming/colors.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFeild extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedborder;
  final InputBorder? enabledborder;
  final TextStyle? inputtextstyle;
  final TextStyle? hinttextstyle;
  final String hinttext;
  final bool? isObsure;
  final Widget? suffixicon;
  final Color? fillcolor;
  final TextEditingController? controller;
  final Function(String?) validator;

  const AppTextFormFeild(
      {super.key,
      this.contentPadding,
      this.focusedborder,
      this.enabledborder,
      this.inputtextstyle,
      this.isObsure,
      this.suffixicon,
      required this.hinttext,
      this.hinttextstyle,
      this.fillcolor,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: focusedborder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: ColorsManger.mainBlue, width: 1.3)),
          enabledBorder: enabledborder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    const BorderSide(color: ColorsManger.lightgray, width: 1.3),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintText: hinttext,
          suffixIcon: suffixicon,
          filled: true,
          hintStyle: hinttextstyle ?? TextStyles.font14greyRegular,
          fillColor: fillcolor ?? ColorsManger.morelightgray),
      obscureText: isObsure ?? false,
      style: TextStyles.font14DarkblueMeduiem,
      validator: (value) {
        return validator(value);
      },
    );
  }
}
