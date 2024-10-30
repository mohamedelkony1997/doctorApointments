import 'package:doc/core/Routing/app_router.dart';
import 'package:doc/core/Routing/routes.dart';
import 'package:doc/core/Theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  AppRouter approuter;
  DocApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      child: MaterialApp(
        title: "Doc APP",
        theme: ThemeData(
          primaryColor: ColorsManger.mainBlue,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: approuter.generateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
