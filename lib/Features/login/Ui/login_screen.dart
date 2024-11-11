import 'package:doc/Features/login/widgets/already_have_account.dart';
import 'package:doc/Features/login/widgets/terms_and_conditions.dart';
import 'package:doc/core/Helpers/spacing.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:doc/core/widgets/app_text_button.dart';
import 'package:doc/core/widgets/app_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObsuretext = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalspace(8),
              Text(
                "We\'re excited to have you back, can\'t wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14greyRegular,
              ),
              verticalspace(36),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      AppTextFormFeild(hinttext: "Email"),
                      verticalspace(18),
                      AppTextFormFeild(
                        hinttext: "Password",
                        isObsure: isObsuretext,
                        suffixicon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObsuretext = !isObsuretext;
                              });
                            },
                            child: Icon(isObsuretext
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),
                      verticalspace(24),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            "Forget Password?",
                            style: TextStyles.font13blueRegular,
                          )),
                      verticalspace(40),
                      AppTextButton(
                        buttonText: "Login",
                        onPressed: () {},
                        textStyle: TextStyles.font16WhiteSemiBold,
                      ),
                      verticalspace(16),
                      const TermsAndConditionsText(),
                      verticalspace(60),
                      const DontHaveAccountText()
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
