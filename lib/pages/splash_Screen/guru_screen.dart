import 'dart:async';

import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/flow_controller.dart';
import '../../controller/splash_controller.dart';

class GuruScreen extends StatefulWidget {
  const GuruScreen({super.key});

  @override
  State<GuruScreen> createState() => _GuruScreenState();
}

class _GuruScreenState extends State<GuruScreen> {
   final SplashController splashController = Get.put(SplashController());
   final FlowController flowController = Get.put(FlowController());

  Future<void> _loadTokenAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Timer(
      const Duration(seconds: 2),
      () {
        if (token != null && token.isNotEmpty) {
          flowController.Flow(context, 0);
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
      const Duration(seconds: 1),
      () {
        _loadTokenAndNavigate();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/guru.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(   
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  child: Text(
                    "This Application is Dedicated to His Divine Grace",
                    textAlign: TextAlign.center,
                    style: FontConstant.styleRegular(
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6E2D8A), // Hex color #6E2D8A
                        Color(0xFFDA1E75), // Hex color #DA1E75
                      ],
                      begin:
                          Alignment.topLeft, // Starting point of the gradient
                      end: Alignment
                          .bottomRight, // Ending point of the gradient
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'A. C. Bhaktivedanta\nSwami Prabhupada',
                      textAlign: TextAlign.center,
                      style: FontConstant.styleBold(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "The Founder-Acharya of the  International Society for Krishna Consciousness (ISKCON)",
                    textAlign: TextAlign.center,
                    style: FontConstant.styleRegular(
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                ),
               const SizedBox(
                height: 10,
               )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
