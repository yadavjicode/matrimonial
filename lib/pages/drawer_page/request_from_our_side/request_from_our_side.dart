import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class RequestFromOurSide extends StatefulWidget {
  const RequestFromOurSide({super.key});

  @override
  State<RequestFromOurSide> createState() => _RequestFromOurSideState();
}

class _RequestFromOurSideState extends State<RequestFromOurSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Request from Our Side",
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
              Container(
                width: double.infinity,
                child:
                    Image.asset("assets/images/request.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildText(
                        "It is humble request from our side that:\n"),
                    DrawerCommanCode().question("a",
                        "Please don't create profile on this application for any Boy/ Girl if he /she consumes Non-Veg and Alcohol because we want only pious natured and devotional natured people on this platform.\n"),
                    DrawerCommanCode().question("b",
                        "Please help us in maintaining the decorum of this application, this application is not for Dating Purposes, so please don't try to use our Honest efforts for such Non-sense activities like Dating etc. Be honest for your soul and look for a devotional mood partner to enter into Vedic Grihastha Ashram with the blessings of Vaishnavas and your Parents.")
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
