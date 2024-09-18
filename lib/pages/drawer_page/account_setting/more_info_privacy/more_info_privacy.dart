import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MoreInfoPrivacy extends StatefulWidget {
  const MoreInfoPrivacy({super.key});

  @override
  State<MoreInfoPrivacy> createState() => _MoreInfoPrivacyState();
}

class _MoreInfoPrivacyState extends State<MoreInfoPrivacy> {
  int more=0;
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
          "More Info Privacy",
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
                Text("Astro Privacy Setting",
                    style: FontConstant.styleSemiBold(
                        fontSize: screenWidth * 0.045 * fontsize,
                        color: AppColors.primaryColor)),
                SizedBox(
                  height: screenHeight * 0.013,
                ),
                GestureDetector(
                  onTap: () => _moreInfoBottomSheet(context),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Visible to all members",
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
               
              ],
            ),
          )
        ],
      ),
    );
  }

   void _moreInfoBottomSheet(BuildContext context) async {
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
                  header("Phone Setting"),
                  Column(
                    children: [
                      buildMoreInfoRadio(1, "Visible to all members", setState),
                      buildMoreInfoRadio(2, "Visible to contacted and Accepted Members", setState),
                      buildMoreInfoRadio(3, "Hide from all", setState),
                      
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
                                  more); // Pass the selected value back
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
        more = selectedValue;
      });
    }
  }

  Widget buildMoreInfoRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
       onDoubleTap: () {
        setState(() {
          if (more == value) {
            more = 0;  // Unselect if already selected
          } else {
            more = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: more,
            onChanged: (int? newValue) {
              setState(() {
                more = newValue!;
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