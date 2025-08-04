// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:doc/Features/login/data/models/login_request_body.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:doc/Features/login/data/repos/login_repo.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

void emitLoginStates() async {
  emit(const LoginState.loading());
  final response = await _loginRepo.login(
    LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ),
  );

  response.when(success: (loginResponse) async {
    debugPrint("Login Successful: ${loginResponse.userData?.token}");
    emit(LoginState.success(loginResponse));
  }, failure: (error) {
    debugPrint("Login Error: ${error.apiErrorModel.message}");
    emit(LoginState.error(error: error.apiErrorModel.message ?? 'An error occurred'));
  });
}


}