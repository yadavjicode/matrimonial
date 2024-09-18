import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactPrivacyEmail extends StatefulWidget {
  const ContactPrivacyEmail({super.key});

  @override
  State<ContactPrivacyEmail> createState() => _ContactPrivacyEmailState();
}

class _ContactPrivacyEmailState extends State<ContactPrivacyEmail> {
  int email = 0;
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
          "Contact Privacy",
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
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/vEmail.png",
                    height: 40,
                    width: 60,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    "Email Id. is Verified",
                    style: FontConstant.styleMedium(
                        fontSize: screenWidth * 0.03 * fontsize,
                        color: AppColors.darkgrey),
                  ),
                  Text(
                    "prashantyadav3602@gmail.com",
                    style: FontConstant.styleMedium(
                        fontSize: screenWidth * 0.038 * fontsize,
                        color: AppColors.black),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email Privacy Setting",
                          style: FontConstant.styleSemiBold(
                              fontSize: screenWidth * 0.045 * fontsize,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        GestureDetector(
                          onTap: () => _emailBottomSheet(context),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Only Premium Members",
                                  style: FontConstant.styleMedium(
                                      fontSize: screenWidth * 0.038 * fontsize,
                                      color: AppColors.black),
                                ),
                              ),
                              SvgPicture.asset(
                                  "assets/images/icons/editSetting.svg",
                                  width: screenWidth * 0.05)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _emailBottomSheet(BuildContext context) async {
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
                  header("Email Setting"),
                  Column(
                    children: [
                      buildEamilRadio(1, "Only Premium Members", setState),
                      buildEamilRadio(2, "Only Premium Members you like", setState),
                      buildEamilRadio(3, "No one (Matches won’t be able to call you)", setState),
                      
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
                                  email); // Pass the selected value back
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
        email = selectedValue;
      });
    }
  }

  Widget buildEamilRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return 
    GestureDetector(
       onDoubleTap: () {
        setState(() {
          if (email == value) {
            email = 0;  // Unselect if already selected
          } else {
            email = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: email,
            onChanged: (int? newValue) {
              setState(() {
                email = newValue!;
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
}
