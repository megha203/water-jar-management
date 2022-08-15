import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:user_app/const/colors.dart';
import 'package:user_app/getx/auth_controller.dart';

final _controller = Get.put(AuthController());
Widget phonefield() => SizedBox(
  height: Get.height * 0.08,
  width: Get.width * 0.8,
  child: TextFormField(
    controller: _controller.phoneTextController,
    validator: (value) => value!.isEmpty
        ? 'Enter your phone number'
        : value.length != 10
        ? 'Enter correct phone number'
        : null,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        textStyle: const TextStyle(letterSpacing: 1.5)),
    decoration: InputDecoration(
      prefixIconConstraints:
      const BoxConstraints(minWidth: 90, maxWidth: 100),
      focusColor: btnColor,
      hoverColor: btnColor,
      prefixIcon: const Icon(Icons.phone_android_sharp),
      filled: true,
      fillColor: Colors.white,
      hintText: 'Phone Number',
      hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(letterSpacing: 1.5)),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

Widget otpfield(context) => SizedBox(
  height: Get.height * 0.08,
  width: Get.width * 0.8,
  child: PinCodeTextField(
    controller: _controller.otpTextController,
    enablePinAutofill: true,
    appContext: context,
    length: 6,
    onChanged: (value) =>
    {value.length == 6 ? _controller.verifyOtp(value) : null},
    cursorColor: Colors.black,
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(10),
      fieldHeight: Get.height * 0.06,
      fieldWidth: Get.width * 0.1,
      activeFillColor: Colors.black,
      inactiveFillColor: Colors.black,
      activeColor: Colors.green,
      inactiveColor: Colors.white,
      selectedColor: Colors.white,
      selectedFillColor: Colors.black,
    ),
  ),
);
Widget textfield(icon, hint, txtcontroller, validator) => SizedBox(
  height: Get.height * 0.08,
  width: Get.width * 0.8,
  child: TextFormField(
    controller: txtcontroller,
    validator: validator,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        textStyle: const TextStyle(letterSpacing: 1.5)),
    decoration: InputDecoration(
      prefixIconConstraints:
      const BoxConstraints(minWidth: 90, maxWidth: 100),
      focusColor: btnColor,
      hoverColor: btnColor,
      prefixIcon: icon,
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(letterSpacing: 1.5)),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

Widget normalfield(hint, txtcontroller, validator) => SizedBox(
  height: Get.height * 0.08,
  width: Get.width * 0.8,
  child: TextFormField(
    controller: txtcontroller,
    validator: validator,
    style: GoogleFonts.poppins(
        fontWeight: FontWeight.bold,
        textStyle: const TextStyle(letterSpacing: 1.5)),
    decoration: InputDecoration(
      prefixIconConstraints:
      const BoxConstraints(minWidth: 90, maxWidth: 100),
      focusColor: btnColor,
      hoverColor: btnColor,
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          textStyle: const TextStyle(letterSpacing: 1.5)),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
);

