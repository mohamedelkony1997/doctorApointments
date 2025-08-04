import 'package:doc/Features/signUp/data/models/sign_up_request_body.dart';
import 'package:doc/Features/signUp/data/models/sign_up_response.dart';
import 'package:doc/core/networking/api_error_handler.dart';
import 'package:doc/core/networking/api_result.dart';
import 'package:doc/core/networking/api_services.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
     SignupRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}