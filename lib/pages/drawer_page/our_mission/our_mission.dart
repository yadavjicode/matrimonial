import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class OurMission extends StatefulWidget {
  const OurMission({super.key});

  @override
  State<OurMission> createState() => _OurMissionState();
}

class _OurMissionState extends State<OurMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Our Mission",
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
                    Image.asset("assets/images/mission.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildText(
                        "At Devotee Matrimony, our mission is to facilitate meaningful connections and lifelong relationships within the global devotee community. We strive to provide a trusted platform where individuals can discover, communicate, and build relationships based on shared values, beliefs, and cultural backgrounds. Our commitment is to uphold integrity, incivility, and confidentiality, ensuring every member's journey towards finding a life partner is guided with devotion, respect, sensitivity, and authenticity.")
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
