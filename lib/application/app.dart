import 'package:e_commerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF07AEAF, AppColor().color),
        // primaryColor: const Color.fromRGBO(7, 174, 175, 1),
        // progressIndicatorTheme: const ProgressIndicatorThemeData(
        //   color: Color.fromRGBO(7, 174, 175, 1),
        // ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
