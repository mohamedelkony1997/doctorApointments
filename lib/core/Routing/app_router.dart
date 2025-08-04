import 'package:doc/Features/Home/Ui/home_screen.dart';
import 'package:doc/Features/login/Ui/login_screen.dart';
import 'package:doc/Features/login/logic/cubit/login_cubit.dart';
import 'package:doc/Features/onBoarding/onboarding_screen.dart';
import 'package:doc/Features/signUp/UI/sign_up.dart';
import 'package:doc/core/Routing/routes.dart';
import 'package:doc/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}