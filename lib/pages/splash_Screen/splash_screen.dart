import 'dart:async';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/flow_controller.dart';
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
  final SplashController splashController = Get.put(SplashController());
  final FlowController flowController = Get.put(FlowController());
  final StateController stateController = Get.put(StateController());


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
  stateController.fetchStateList();
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
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
