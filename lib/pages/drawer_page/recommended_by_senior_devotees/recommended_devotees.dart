import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class RecommendedDevotees extends StatefulWidget {
  const RecommendedDevotees({super.key});

  @override
  State<RecommendedDevotees> createState() => _RecommendedDevoteesState();
}

class _RecommendedDevoteesState extends State<RecommendedDevotees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Recommendation by Senior Devotees",
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
                child: Image.asset("assets/images/recommended.png",
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode()
                        .buildTextSemiBold("Recommended by Senior Devotees\n"),
                    DrawerCommanCode().buildText("Coming Soon")
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
