import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_app/screens/onboarding_screen.dart';
import 'package:user_app/screens/otp_screen.dart';

import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';
import '../widgets/toast.dart';

class AuthController extends GetxController {

  var phoneFormKey = GlobalKey<FormState>();
  var signupFormKey = GlobalKey<FormState>();

  RxBool isverifing = false.obs;
  TextEditingController phoneTextController = TextEditingController();

  TextEditingController fullnameTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();

  TextEditingController cityTextController = TextEditingController();
  TextEditingController otpTextController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verId;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // this function is called when the user clicks on the submit phone number button
  sendOtp() async {
    try {
      await _auth
          .verifyPhoneNumber(
          phoneNumber: '+91${phoneTextController.text}',
          timeout: const Duration(seconds: 60),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout)
          .then((value) => Get.to(const OtpScreen()));
    } on FirebaseAuthException catch (e) {
      toast(e.message, Colors.red);
    } catch (e) {
      toast(e, Colors.red);
    }
  }

  resendOtp() {
    try {} catch (e) {
      toast(e, Colors.red);
    }
  }

// auto verify phone number function for firebase auth and firestore database
  verificationCompleted(AuthCredential credential) {
    _auth
        .signInWithCredential(credential)
        .then((value) => {
      storage.write(
          key: 'key',
          value: FirebaseAuth.instance.currentUser?.phoneNumber
              .toString()),
    })
        .then((value) => getUserDetail());
  }

// onVerificationFailed function is called when the verification process failed
  verificationFailed(FirebaseAuthException exception) {
    toast(exception.message, Colors.red);
  }

// autoretrieval timeout for the verification code
  codeAutoRetrievalTimeout(String verificationId) {
    null;
  }

// codesent is called when the code is sent to the user
  codeSent(String verificationId, int? forceResendingToken) {
    verId = verificationId;
  }

  // verifyOtp is called when the user not automatically verified
  verifyOtp(otp) async {
    isverifing = true.obs;

    try {
      await _auth
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verId.toString(), smsCode: otp))
          .then((value) => isverifing = false.obs);
    } on FirebaseAuthException catch (e) {
      toast(e.message, Colors.red);

      isverifing = false.obs;
      update();
    } catch (e) {
      isverifing = false.obs;
      update();
      toast(e, Colors.red);
    }

    if (_auth.currentUser != null) {
      storage
          .write(
          key: 'key',
          value: FirebaseAuth.instance.currentUser?.phoneNumber.toString())
          .then((value) => getUserDetail());
    }
  }

// create user Profile
  createProfile() {
    try {
      _firestore
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.phoneNumber.toString())
          .set({
        'name': fullnameTextController.text.toString(),
        'address': addressTextController.text.toString(),
        'city': cityTextController.text.toString(),
      })
          .then((value) =>
          _auth.currentUser!.updateDisplayName(fullnameTextController.text))
          .then((value) => getUserDetail());
    } catch (e) {
      toast(e, Colors.red);
    }
  }

// logout function
  logout() {
    _auth.signOut();
    storage.deleteAll();
    Get.offAll(const OnboardingScreen());
    toast('logout sucessfully', Colors.green);
  }

//  get user detail to check if user is First Time User
  getUserDetail() async {
    try {
      await _firestore
          .collection('user')
          .doc('${FirebaseAuth.instance.currentUser?.phoneNumber}')
          .get()
          .then((value) => {
        if (value.exists)
          {
            Get.offAll(const HomeScreen()),
          }
        else
          {
            Get.offAll(const SignupScreen()),
          }
      });
    } catch (e) {
      toast(e, Colors.red);
    }
  }

  isAlreadyLoggedIn() async {
    var phoneNumber = await storage.read(key: 'key');
    try {
      if (phoneNumber != null) {
        getUserDetail();
      } else {
        Get.offAll(const OnboardingScreen());
      }
    } catch (e) {
      toast(e, Colors.red);
    }
  }
}
