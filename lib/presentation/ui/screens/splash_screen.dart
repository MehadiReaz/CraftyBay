import 'package:e_commerce_app/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:e_commerce_app/presentation/ui/screens/bottom_nav_bar.dart';
import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    goToNextScreen();
  }

  void goToNextScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(EmailVerificationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Center(
          child: SvgPicture.asset(
            ImageAssets.craftyBayLogoSVG,
            width: 120,
          ),
        ),
        const Spacer(),
        const Center(
          child: CircularProgressIndicator(
            // color: Color.fromRGBO(7, 174, 175, 1),
            strokeWidth: 5,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text('Version 1.0',
              style: TextStyle(color: Color.fromRGBO(166, 166, 166, 1))),
        ),
        const SizedBox(
          height: 30,
        )
        //const Spacer()
        // Center(
        //   child: Image(
        //     image: AssetImage('assets/images/logo.png'),
        //   ),
        // )
      ],
    ));
  }
}
