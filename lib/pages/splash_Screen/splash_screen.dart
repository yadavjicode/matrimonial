import 'dart:async';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   final SplashController splashController=Get.put(SplashController());
  Future<void> _loadTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // Add any logic you need to handle the token here

    Timer(
      const Duration(seconds: 2),
      () {
        if (token != null && token.isNotEmpty) {
          // Get.offAndToNamed(
          //     '/profile1'); // or whatever route you want to navigate to
          splashController.userDetails(context);
        } else {
          Get.offAndToNamed('/login');
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
       // editProfileController.userDetails(context);
        // Get.offAndToNamed('/login');
       // print("step1=========================${editProfileController.member!.member!.step1}");
        _loadTokenAndNavigate();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 250,
          height: 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
