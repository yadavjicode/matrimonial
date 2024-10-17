import 'dart:async';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Center(
          child: SizedBox(
            width: SizeConfig.screenWidth * 1,
            child: Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ]),
    );
  }
}
