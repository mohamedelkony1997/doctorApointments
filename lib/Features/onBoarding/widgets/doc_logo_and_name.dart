import 'package:doc/Features/onBoarding/widgets/doc_image_and_text.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svgs/Frame.svg",
        ),
        SizedBox(width: 10.h),
        Text(
          "Docdoc",
          style:TextStyles.font24Black700Weight,
        ),
       
      ],
    );
    
  }
}
