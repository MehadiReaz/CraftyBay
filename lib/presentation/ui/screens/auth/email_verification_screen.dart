import 'package:e_commerce_app/presentation/state_holder/email_verification_controller.dart';
import 'package:e_commerce_app/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:e_commerce_app/presentation/ui/utility/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

  final TextEditingController _emailTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            //physics: NeverScrollableScrollPhysics(),
            child: Form(
              key: _formKey,
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
                  Text('Welcome Back',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 24)),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Please Enter Your Email Address',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                        hintText: 'Email', labelText: 'Email'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your email address';
                      } else if (text!.isEmail == false) {
                        /// REGEX (Email validator)
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: GetBuilder<EmailVerificationController>(
                        builder: (controller) {
                      if (controller.emailVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verifyEmail(controller);
                          }
                        },
                        child: Text('Next'),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
        await controller.verifyEmail(_emailTEController.text.trim());
    if (response) {
      Get.to(OTPVerificationScreen(
        email: _emailTEController.text.trim(),
      ));
    } else {
      Get.snackbar(
        'Failed',
        'Email verification failed! Try again',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
      );
    }
  }
}
