// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc/core/Helpers/spacing.dart';
import 'package:doc/core/Theming/colors.dart';
import 'package:doc/core/Theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValdation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharcters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValdation({
    Key? key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharcters,
    required this.hasNumber,
    required this.hasMinLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildValidationRow("At least 1 lowercase letter", hasLowerCase),
        verticalspace(2),
        buildValidationRow("At least 1 Uppercase letter", hasUpperCase),
        verticalspace(2),
        buildValidationRow("At least 1 special character", hasSpecialCharcters),
        verticalspace(2),
        buildValidationRow("At least 1 number", hasNumber),
        verticalspace(2),
        buildValidationRow("At least 8 characters long", hasMinLength),
      ],
    );
  }
}

Widget buildValidationRow(String text, bool hasValidated) {
  return Row(
    children: [
      CircleAvatar(
        radius: 2.5,
        backgroundColor: ColorsManger.gray,
      ),
      horizentalspace(8),
      Text(
        text,
        style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? ColorsManger.gray : ColorsManger.darkBlue,
        ),
      )
    ],
  );
}
