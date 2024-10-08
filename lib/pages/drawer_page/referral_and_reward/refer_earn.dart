import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class ReferEarn extends StatefulWidget {
  const ReferEarn({super.key});

  @override
  State<ReferEarn> createState() => _ReferEarnState();
}

class _ReferEarnState extends State<ReferEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Refer & Earn",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * 0.3,
            color: AppColors.primaryColor,
          ),
          Container(
            margin: EdgeInsets.only(left: 18, right: 18),
            decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              children: [
                Container(
                  height: SizeConfig.screenHeight * 0.6,
                  decoration: const BoxDecoration(
                      color: AppColors.constColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Image.asset("assets/images/referBanner.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    'Refer to a friend and get ', // The first part of the text
                                style: FontConstant.styleMedium(
                                    fontSize: 20, color: AppColors.black),
                                children: [
                                  TextSpan(
                                    text: '₹100', // The part that should be red
                                    style: FontConstant.styleMedium(
                                        fontSize: 20,
                                        color: AppColors.primaryColor),
                                  ),
                                  TextSpan(
                                    text:
                                        ' in both the wallets.', // The remaining part of the text
                                    style: FontConstant.styleMedium(
                                        fontSize: 20, color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                            
                            CustomTextField(
                              labelText: "Enter E-Mail ID or Mobile No.",
                              labelTextColor: AppColors.darkgrey,
                              borderRadius: 5,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
