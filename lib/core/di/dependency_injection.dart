import 'package:dio/dio.dart';
import 'package:doc/Features/login/data/repos/login_repo.dart';
import 'package:doc/Features/login/logic/cubit/login_cubit.dart';
import 'package:doc/Features/signUp/data/repo/sign_up_repo.dart';
import 'package:doc/Features/signUp/logic/cubit/sign_up_cubit.dart';
import 'package:doc/core/networking/api_services.dart';
import 'package:doc/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
}
