import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';

class OfferingGratitude extends StatefulWidget {
  const OfferingGratitude({super.key});

  @override
  State<OfferingGratitude> createState() => _OfferingGratitudeState();
}

class _OfferingGratitudeState extends State<OfferingGratitude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Offering Your Gratitude",
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
                child: Image.asset("assets/images/offering.png",
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
                        .buildTextSemiBold("Offering Your Gratitude\n"),
                    DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                    DrawerCommanCode().buildText(
                        "As you know that we are taking only nominal charges as a subscription amount to keep continue this application, to maintain this application and to promote this application in public domain, we needs some financial support, if you like our work and if you want to offer your Gratitude in terms of financial support, then you can provide us financial support via the Bank Account Details given below.")
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
