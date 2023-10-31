import 'package:e_commerce_app/presentation/state_holder/otp_verification_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/app_colors.dart';
import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpVerficationController =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 120,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Enter OTP Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 24)),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'A 4 Digit OTP Code has been Sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 24,
                ),
                // TextFormField(),
                PinCodeTextField(
                  controller: _otpVerficationController,
                  keyboardType: TextInputType.number,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.isNumericOnly) {
                      return 'Please Input valid pin';
                    }
                    return null;
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveColor: AppColor.primaryColor,
                    activeColor: AppColor.primaryColor,
                    selectedColor: AppColor.primaryColor,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  autoUnfocus: true,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  animationDuration: Duration(milliseconds: 300),
                  //backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,

                  beforeTextPaste: (text) {
                    return true;
                  },
                  appContext: context,
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OTPVerificationController>(
                    builder: (controller) {
                      if (controller.otpVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            verifyOtp(controller);
                          }
                        },
                        child: Text('Next'),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This code will expire in ',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.grey),
                    ),
                    TweenAnimationBuilder<Duration>(
                        duration: Duration(seconds: 120),
                        tween: Tween(
                            begin: Duration(seconds: 120), end: Duration.zero),
                        onEnd: () {
                          // print('Timer ended');
                        },
                        builder: (BuildContext context, Duration value,
                            Widget? child) {
                          final seconds = value.inSeconds % 120;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              '$seconds\s',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColor.primaryColor),
                            ),
                          );
                        }),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Future<void> verifyOtp(OTPVerificationController controller) async {
    final response = await controller.verifyOtp(
      widget.email,
      _otpVerficationController.text.trim(),
    );
    if (response) {
      Get.to(CompleteProfileScreen());
    } else {
      Get.snackbar(
        'Failed',
        'OTP verification failed! Try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
    }
  }
}
