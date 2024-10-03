import 'dart:async';
import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/flow_controller.dart';
import '../../controller/splash_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
          Get.offAndToNamed('/guruscreen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
