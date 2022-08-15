import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_app/const/colors.dart';

Widget btn1(
    onpress,
    text,
    ) =>
    SizedBox(
      height: Get.height * 0.06,
      width: Get.width * 0.8,
      child: ElevatedButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: btnColor,
          textStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: Get.width * 0.055,
              fontWeight: FontWeight.bold),
        ),
        child: Text(text),
      ),
    );
