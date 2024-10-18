import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.45),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/rectangle2.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                bottom: screenHeight * 0.6, left: screenWidth * 0.1),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg1.png'),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenHeight * 0.51),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg2.png'),
                  fit: BoxFit.contain),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.05),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/purple.png'), scale: 1.25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.05),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/white.png'), scale: 1.25),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.05),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/wedding.png'), scale: 1.2),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.62),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'), scale: 1.2),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'Hare Krishna !',
                  style: FontConstant.styleBold(
                      fontSize: 25, color: AppColors.constColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Find your Devotional Match Today',
                style: FontConstant.styleRegular(
                    fontSize: 18, color: AppColors.constColor),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 26.0,
                  right: 26,
                ),
                child: CustomButton(
                  text: 'Login with Mobile',
                  onPressed: () {
                    Get.offAndToNamed('/mobile');
                  },
                  color: AppColors.constColor,
                  textStyle: FontConstant.styleRegular(
                      fontSize: 18, color: AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26.0, right: 26),
                child: CustomButton(
                  text: 'Login with Email',
                  onPressed: () {
                    Get.offAndToNamed('/email');
                  },
                  color: AppColors.constColor,
                  textStyle: FontConstant.styleRegular(
                      fontSize: 18, color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
