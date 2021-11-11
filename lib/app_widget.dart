import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';

import 'shared/themes/app_colors.dart';

import 'modules/home/home_page.dart';
import 'modules/splash/splash_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // AppWidget() {
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ]);
  // } Por Algum motivo esse código não funciona
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PayFlow',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: AppColors.primary,
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => const SplashPage(),
          "/login": (context) => const LoginPage(),
          "/home": (context) => const HomePage(),
          "/barcode_scanner": (context) => const BarcodeScanerPage(),
        });
  }
}
