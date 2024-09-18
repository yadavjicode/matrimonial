import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePrivacy extends StatefulWidget {
  const ProfilePrivacy({super.key});

  @override
  State<ProfilePrivacy> createState() => _ProfilePrivacyState();
}

class _ProfilePrivacyState extends State<ProfilePrivacy> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Profile Privacy",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/bg3.png")),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.035, vertical: screenHeight * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hide Profile",
                    style: FontConstant.styleSemiBold(
                        fontSize: screenWidth * 0.045 * fontsize,
                        color: AppColors.primaryColor)),
                SizedBox(
                  height: screenHeight * 0.013,
                ),
                GestureDetector(
                  onTap: () => {Get.toNamed("/profileSetting")},
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Your Profile is currently visible",
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black),
                        ),
                      ),
                      SvgPicture.asset("assets/images/icons/editSetting.svg",
                          width: screenWidth * 0.05)
                    ],
                  ),
                ),
                 SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  "When you hide your profile, you will not be visible on Devotee Matrimony You will neither be able to send invitations or messages.",
                  style: FontConstant.styleMedium(
                      fontSize: screenWidth * 0.03 * fontsize,
                      color: AppColors.darkgrey),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
