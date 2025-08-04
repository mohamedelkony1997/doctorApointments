import 'package:doc/Features/onBoarding/widgets/doc_image_and_text.dart';
import 'package:doc/Features/onBoarding/widgets/doc_logo_and_name.dart';
import 'package:doc/Features/onBoarding/widgets/get_started_button.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
        child: Column(
          children: [
            const DocLogoAndName(),
            SizedBox(
              height: 30.h,
            ),
            const DocImageAndText(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Text(
                    "Manage and schedule all of your medical appointments easily\n with Docdoc to get a new experience.",
                    style: TextStyles.font13greyRegular,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const GetStartedButton(),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
