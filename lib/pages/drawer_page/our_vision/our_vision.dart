import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class OurVision extends StatefulWidget {
  const OurVision({super.key});

  @override
  State<OurVision> createState() => _OurVisionState();
}

class _OurVisionState extends State<OurVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Our Vision",
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
                    Image.asset("assets/images/vission.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildText(
                        "At Devotee Matrimony, our vision is to be the premier global platform empowering devotees to find such a devotional match who share their spiritual values and life goals. Through innovative technology and a deep understanding of cultural nuances, we envision Devotee Matrimony as the catalyst for enduring relationships built on Guru, Sadhu, Sastra, Trust, Harmony, and Mutual respect.\n"),
                    DrawerCommanCode().buildText(
                        "Our vision is to foster a community where every member finds spiritual happiness and fulfillment in a lifelong partnership rooted in spiritual affinity and shared devotion.")
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
