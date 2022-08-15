import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/getx/auth_controller.dart';
import 'package:user_app/screens/otp_screen.dart';
import 'package:user_app/widgets/textfields.dart';

import '../widgets/buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: bgColor),
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Text('Signup to your account',
              style: GoogleFonts.poppins(
                fontSize: Get.width * 0.055,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: Get.height * 0.1),
          textfield(
            const Icon(Icons.person),
            'Full Name',
            _controller.fullnameTextController,
                (v) {},
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          textfield(
            const Icon(Icons.contact_phone),
            'Mobile Number',
            _controller.addressTextController,
                (v) {},
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          textfield(
            const Icon(Icons.mail),
            'Email',
            _controller.cityTextController,
                (v) {},
          ),
          SizedBox(
            height: Get.height * 0.06,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Checkbox(value: true, onChanged: (bool? v) {}),
              Text('Remember me', style: GoogleFonts.poppins()),
            ],
          ),
          const SizedBox(height: 5),
          btn1(() => Get.to(const OtpScreen()), 'Signup'),
          const SizedBox(height: 5),
          TextButton(
              onPressed: () {
                _controller.logout();
              },
              child: Text('logout and login with another account')),
          SizedBox(height: Get.height * 0.05),
        ]),
      ),
    );
  }
}
