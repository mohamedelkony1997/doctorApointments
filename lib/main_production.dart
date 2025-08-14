import 'package:doc/core/Routing/app_router.dart';
import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    approuter: AppRouter(),
  ));
}
