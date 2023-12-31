import 'package:e_commerce_app/application/state_holder_binder.dart';
import 'package:e_commerce_app/presentation/ui/screens/splash_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});
  static GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: CraftyBay.globalKey,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF07AEAF, AppColor().color),
        // primaryColor: const Color.fromRGBO(7, 174, 175, 1),
        // progressIndicatorTheme: const ProgressIndicatorThemeData(
        //   color: Color.fromRGBO(7, 174, 175, 1),
        // ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          disabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      initialBinding: StateHolderBinder(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
