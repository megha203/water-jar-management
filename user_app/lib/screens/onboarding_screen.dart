import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/const/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/screens/login_screen.dart';
import 'package:user_app/screens/signup_screen.dart';
import 'package:user_app/widgets/buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: bgColor),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              child: Image.asset('assets/img/img1.png'),
            ),
            SizedBox(height: Get.height * 0.05),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Water Jar Management App',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: Get.width * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'This application is used in the management of the water jug, the channel for the distribution of the water jug.',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                  fontSize: Get.width * 0.05,
                ),
              ),
            ),
            const Spacer(),
            btn1(() => Get.to(const LoginScreen()), 'Get Started'),
            SizedBox(height: Get.height * 0.05),
            btn1(() => Get.to(const SignupScreen()), 'New User'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
