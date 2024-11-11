import 'package:doc/Features/login/Ui/login_screen.dart';
import 'package:doc/Features/onBoarding/onboarding_screen.dart';
import 'package:doc/Features/signUp/UI/sign_up.dart';
import 'package:doc/core/Routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignUp());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for${routeSettings.name}"),
                  ),
                ));
    }
  }
}
