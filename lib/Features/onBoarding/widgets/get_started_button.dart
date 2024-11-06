import 'package:doc/core/Helpers/extenasions.dart';
import 'package:doc/core/Routing/routes.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(Size(double.infinity, 50.h)),
          shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))),
      child: Text(
        "Get Strated",
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
