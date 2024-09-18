import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactPrivacyPhone extends StatefulWidget {
  const ContactPrivacyPhone({super.key});

  @override
  State<ContactPrivacyPhone> createState() => _ContactPrivacyPhoneState();
}

class _ContactPrivacyPhoneState extends State<ContactPrivacyPhone> {
  int phone=0;
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
                    "assets/images/vPhone.png",
                    height: 60,
                    width: 35,
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    "Phone No. is Verified",
                    style: FontConstant.styleMedium(
                        fontSize: screenWidth * 0.03 * fontsize,
                        color: AppColors.darkgrey),
                  ),
                  Text(
                    "9971253602",
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
                          "Phone Privacy Setting",
                          style: FontConstant.styleSemiBold(
                              fontSize: screenWidth * 0.045 * fontsize,
                              color: AppColors.primaryColor),
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        GestureDetector(
                          onTap: () => _phoneBottomSheet(context),
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

   void _phoneBottomSheet(BuildContext context) async {
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
                      buildPhoneRadio(1, "Only Premium Members", setState),
                      buildPhoneRadio(2, "Only Premium Members you like", setState),
                      buildPhoneRadio(3, "No one (Matches won’t be able to call you)", setState),
                      
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
                                  phone); // Pass the selected value back
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
        phone = selectedValue;
      });
    }
  }

  Widget buildPhoneRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
       onDoubleTap: () {
        setState(() {
          if (phone == value) {
            phone = 0;  // Unselect if already selected
          } else {
            phone = value;  // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: phone,
            onChanged: (int? newValue) {
              setState(() {
                phone = newValue!;
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