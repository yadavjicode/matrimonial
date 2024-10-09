import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class Disclaimer extends StatefulWidget {
  const Disclaimer({super.key});

  @override
  State<Disclaimer> createState() => _DisclaimerState();
}

class _DisclaimerState extends State<Disclaimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Disclaimer",
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
                    const SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                    DrawerCommanCode().buildText(
                        "With the blessing of Senior Vaishnavas, we are trying to do our best so that you can meet with your devotional match and take your journey to a Higher level with your Life Partner, but still on a safer side, we are suggesting you to before finalising any person as your life time partner, please verify the details at your end, discuss the matter with your seniors and then proceed ahead.\n"),
                    DrawerCommanCode().buildText(
                        "Disclaimer: As we are living in the age of kaliyug and it is an age of disagreement, so we are not responsible for any mishappening (if any) before or after the marriage.\n"),
                    DrawerCommanCode().buildText(
                        "And yes needless to say, we always pray to krishna for a Happy and Devotional Married Life for each and every couple.\n"),
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
