// ignore_for_file: avoid_unnecessary_containers

import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  int lastLogin = 0;
  int them = 0;
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Account Setting",
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("Contact Privacy"),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/contactPrivacyPhone")},
                    child: settingTab("9971253602", "Only Premium Members", "")),

                  GestureDetector(
                      onTap: () => {Get.toNamed("/contactPrivacyEmail")},
                    child: settingTab("prashnatyadav3602@gmail.com",
                        "Only Premium Members", ""),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  header("Account Privacy"),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  GestureDetector(
                      onTap: () => _lastActiveBottomSheet(context),
                      child: settingTab(
                          "Manage Last Active", "Only Premium Members", "")),
                  GestureDetector(
                    onTap: () => _onlineStatusBottomSheet(context),
                    child: settingTab(
                        "Manage Online Status", "Only Premium Members", ""),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/profilePrivacy")},
                    child: settingTab(
                        "Manage Profile Visibility", "Only Premium Members", ""),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  header("More Info Privacy"),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/moreInfoPrivacy")},
                    child: settingTab(
                        "Manage Astro Details", "Only Premium Members", ""),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  header("App setting"),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  GestureDetector(
                    onTap: () => _appThemeBottomSheet(context),
                    child: settingTab(
                        "Theme",
                        "Choose how your Devotee Matrimony experience looks for this device.",
                        ""),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget header(String tittle) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return Text(
      tittle,
      style: FontConstant.styleSemiBold(
          fontSize: screenWidth * 0.045 * fontsize,
          color: AppColors.primaryColor),
    );
  }

  Widget settingTab(String tittle, String value, String move) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  // color: AppColors.constColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.038 * fontsize,
                            color: AppColors.black),
                      ),
                      Text(
                        value,
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.03 * fontsize,
                            color: AppColors.darkgrey),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenHeight * 0.005,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkgrey,
                size: screenWidth * 0.05,
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          Container(
            height: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }

  void _lastActiveBottomSheet(BuildContext context) async {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    final int? selectedValue = await showModalBottomSheet<int>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("Manage Last Active"),
                  Column(
                    children: [
                      buildLastLoginRadio(1, "Hide date and time", setState),
                      buildLastLoginRadio(2, "Hide date", setState),
                      buildLastLoginRadio(3, "Hide time", setState),
                      buildLastLoginRadio(4, "Show date and time", setState),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Closes the bottom sheet
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Cancel",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context,
                                  lastLogin); // Pass the selected value back
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Ok",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    // Update the parent widget's state based on the result from the bottom sheet
    if (selectedValue != null) {
      setState(() {
        lastLogin = selectedValue;
      });
    }
  }

  // ignore: unused_element
  void _appThemeBottomSheet(BuildContext context) async {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    final int? selectedValue = await showModalBottomSheet<int>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("App Theme"),
                  Column(
                    children: [
                      buildThemeRadio(1, "Device setting", setState),
                      buildThemeRadio(2, "Dark Mode", setState),
                      buildThemeRadio(3, "Light Mode", setState),
                      Text(
                        "If you choose device setting, this app will use the mode that’s already selected in this device’s setting.",
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.03 * fontsize,
                            color: AppColors.darkgrey),
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Closes the bottom sheet
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Cancel",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context,
                                  lastLogin); // Pass the selected value back
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Ok",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    // Update the parent widget's state based on the result from the bottom sheet
    if (selectedValue != null) {
      setState(() {
        lastLogin = selectedValue;
      });
    }
  }

  void _onlineStatusBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header("Manage Online Status"),
                  Column(
                    children: [
                      SwitchListTile(
                        contentPadding: const EdgeInsets.all(0),
                        title: Text('Hide Status',
                            style: FontConstant.styleMedium(
                                fontSize: screenWidth * 0.04 * fontsize,
                                color: AppColors.black)),
                        value: _isSwitched,
                        onChanged: (value) {
                          setState(() {
                            _isSwitched = value;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                        inactiveThumbColor: AppColors.primaryColor,
                        inactiveTrackColor: Colors.grey.shade300,
                      ),
                      Text(
                        "When this is turned off, you won’t be able to see the activity status of other accounts.",
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.03 * fontsize,
                            color: AppColors.darkgrey),
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Closes the bottom sheet
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Cancel",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context,
                                  lastLogin); // Pass the selected value back
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02,
                                  vertical: screenHeight * 0.01),
                              child: Text(
                                "Ok",
                                style: FontConstant.styleMedium(
                                    fontSize: screenWidth * 0.04 * fontsize,
                                    color: AppColors.primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildLastLoginRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          if (lastLogin == value) {
            lastLogin = 0;  // Unselect if already selected
          } else {
            lastLogin = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: lastLogin,
            onChanged: (int? newValue) {
              setState(() {
                lastLogin = newValue!;
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

  Widget buildThemeRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          if (them == value) {
            them = 0;  // Unselect if already selected
          } else {
            them = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: them,
            onChanged: (int? newValue) {
              setState(() {
                them = newValue!;
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
