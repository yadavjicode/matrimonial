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
            child: SafeArea(
              child: Image.asset(
                "assets/images/guruBackground.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 35),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "Our Honest Efforts are Dedicated to",
                            textAlign: TextAlign.center,
                            style: FontConstant.styleRegularGabriela(
                              fontSize: 20,
                              color: AppColors.constColor,
                            ),
                          ),
                        ),
                        Text(
                          '"His Divine Grace A. C. Bhaktivedanta Swami Prabhupada"',
                          textAlign: TextAlign.center,
                          style: FontConstant.styleRegularGabriela(
                            fontSize: 25,
                            color: AppColors.constColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/guru.png",
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35, left: 15, right: 15),
                    child: Text(
                      "The Founder-Acharya of the  International Society for Krishna Consciousness (ISKCON)",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleRegularGabriela(
                        fontSize: 22,
                        color: AppColors.constColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
