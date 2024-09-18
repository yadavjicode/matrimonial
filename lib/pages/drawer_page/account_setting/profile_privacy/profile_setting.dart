import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  int profile = 0;
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
            "Profile Setting",
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
                  horizontal: screenWidth * 0.035,
                  vertical: screenHeight * 0.03),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SvgPicture.asset("assets/images/icons/eye.svg"),
                    SizedBox(
                      height: screenHeight * 0.04,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hide Profile",
                              style: FontConstant.styleSemiBold(
                                  fontSize: screenWidth * 0.045 * fontsize,
                                  color: AppColors.primaryColor)),
                          Text(
                            "Hiding your Profile will make it invisible",
                            style: FontConstant.styleMedium(
                                fontSize: screenWidth * 0.03 * fontsize,
                                color: AppColors.darkgrey),
                          ),
                          SizedBox(
                            height: screenHeight * 0.025,
                          ),
                          Text(
                            "How long would like to hide your Profile for?",
                            style: FontConstant.styleMedium(
                                fontSize: screenWidth * 0.04 * fontsize,
                                color: AppColors.black),
                          ),
                          buildProfileRadio(1, "1 Week", setState),
                          buildProfileRadio(2, "2 Weeks", setState),
                          buildProfileRadio(3, "1 Month", setState),
                          SizedBox( height: screenHeight * 0.025,),
                          CustomButton(
                            text: "HIDE MY PROFILE",
                            onPressed: () => {},
                            color: AppColors.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: screenWidth * 0.05 * fontsize,
                                color: AppColors.constColor),
                            padding: 5,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget buildProfileRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
       onDoubleTap: () {
        setState(() {
          if (profile == value) {
            profile = 0;  // Unselect if already selected
          } else {
            profile = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: profile,
            onChanged: (int? newValue) {
              setState(() {
                profile = newValue!;
              });
            },
          ),
          Expanded(
            child: Text(
              title,
              style: FontConstant.styleMedium(
                  fontSize: screenWidth * 0.035 * fontsize,
                  color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
