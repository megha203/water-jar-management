import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/getx/auth_controller.dart';
import 'package:user_app/screens/login_screen.dart';
import 'package:user_app/widgets/buttons.dart';
import 'package:user_app/widgets/textfields.dart';

class InternalJarFill extends StatelessWidget {
  const InternalJarFill({Key? key}) : super(key: key);

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
          Text('Internal Jar Filling',
              style: GoogleFonts.poppins(
                fontSize: Get.width * 0.055,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: Get.height * 0.040),
          normalfield(
            'Date',
            _controller.cityTextController,
                (v) {},
          ),
          SizedBox(height: Get.height * 0.040),
          normalfield(
            'Total Stock',
            _controller.cityTextController,
                (v) {},
          ),
          SizedBox(height: Get.height * 0.040),
          normalfield(
            'Total Empty Jar',
            _controller.cityTextController,
                (v) {},
          ),
          SizedBox(height: Get.height * 0.020),
          Text('available'),
          SizedBox(height: Get.height * 0.020),
          normalfield(
            'Jar received after',
            _controller.cityTextController,
                (v) {},
          ),
          SizedBox(height: Get.height * 0.020),
          Text('Filling'),
          SizedBox(height: Get.height * 0.020),
          normalfield(
            'Damaged/Rejected Jars',
            _controller.cityTextController,
                (v) {},
          ),

          const SizedBox(height: 5),
          btn1(() => Get.to(const LoginScreen()), 'Back'),

          const Spacer(),
          SizedBox(height: Get.height * 0.05),
        ]),
      ),
    );
  }
}
