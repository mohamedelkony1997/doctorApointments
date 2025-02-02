import 'package:doc/Features/login/data/models/login_request_body.dart';
import 'package:doc/Features/login/logic/cubit/login_cubit.dart';
import 'package:doc/Features/login/widgets/already_have_account.dart';
import 'package:doc/Features/login/widgets/email_and_password.dart';
import 'package:doc/Features/login/widgets/login_bloc_listener.dart';
import 'package:doc/Features/login/widgets/terms_and_conditions.dart';
import 'package:doc/core/Helpers/spacing.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:doc/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalspace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14greyRegular,
                ),
                verticalspace(36),
                Column(
                  children: [
                    const EmailAndPassword(),
                    verticalspace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13blueRegular,
                      ),
                    ),
                    verticalspace(40),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalspace(16),
                    const TermsAndConditionsText(),
                    verticalspace(60),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}