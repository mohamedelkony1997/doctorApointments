import 'package:dio/dio.dart';
import 'package:doc/Features/login/data/models/login_request_body.dart';
import 'package:doc/Features/login/data/models/login_response.dart';
import 'package:doc/core/networking/api_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
