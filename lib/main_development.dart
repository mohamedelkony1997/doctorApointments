import 'package:doc/core/Routing/app_router.dart';
import 'package:doc/core/di/dependency_injection.dart';
import 'package:doc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.amber, statusBarColor: Colors.green));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DocApp(
    approuter: AppRouter(),
  ));
}
