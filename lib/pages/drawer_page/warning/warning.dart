import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class Warning extends StatefulWidget {
  const Warning({super.key});

  @override
  State<Warning> createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Warning",
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                    DrawerCommanCode().buildText(
                        "There may be some people (fraudsters) who will call you and pretend that they are part of team of "
                        "\"Devotee Matrimony\" team and may ask some amount from you on their personal UPI Number or Bank Account Number,  so please don't pay any singe rupee on Personal UPI/ Bank account number.\n"),
                    DrawerCommanCode().buildText(
                        "Our genuine team members will never encourage you to pay on any personal bank account details, if in case, our team member will call you then they will always suggest you to pay via the link provided in this application/ website.\n"),
                    DrawerCommanCode().buildText(
                        "So, please save your money from such fraudsters.")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
