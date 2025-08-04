import 'package:doc/Features/login/logic/cubit/login_cubit.dart';
import 'package:doc/Features/login/widgets/password_valdation.dart';
import 'package:doc/core/Helpers/app_regex.dart';
import 'package:doc/core/Helpers/spacing.dart';
import 'package:doc/core/widgets/app_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final formkey = GlobalKey<FormState>();
  bool isObsecureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setUpPasswordControllerListener();
  }

  void setUpPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormFeild(
              hinttext: "Email",
              validator: (String? value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return "please enter valid email";
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            verticalspace(18),
            AppTextFormFeild(
              hinttext: "Password",
              isObsure: isObsecureText,
              suffixicon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObsecureText = !isObsecureText;
                    });
                  },
                  child: Icon(isObsecureText
                      ? Icons.visibility_off
                      : Icons.visibility)),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "please enter valid password";
                }
              },
              controller: context.read<LoginCubit>().passwordController,
            ),
            verticalspace(24),
            PasswordValdation(
              hasLowerCase: hasLowercase,
              hasUpperCase: hasUppercase,
              hasSpecialCharcters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
          ],
        ));
  }


}
  