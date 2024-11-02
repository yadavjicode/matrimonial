import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class WhoAreYou extends StatefulWidget {
  const WhoAreYou({super.key});

  @override
  State<WhoAreYou> createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Who We Are",
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
                child: Image.asset("assets/images/who.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildTextBold("Hare Krishna!\n"),
                    DrawerCommanCode()
                        .buildText("Please accept our Humble Obeisances.\n\n"),
                    DrawerCommanCode().buildText(
                        "We are a Group of ISKCON Devotees who is trying to please the Supreme Lord and our ISKCON Founder Acharya His Divine Grace A. C. Bhaktivedanta Swami Prabhupada by having an official Platform which can help devotional mood People to enter into Grihastha Ashram with a devotional mood life partner and in such a way pratice Krishna Consciousness together with his/ her life partner.\n"),
                    DrawerCommanCode().buildText(
                        "This Application is running under blessings and supervision of senior devotees in ISKCON. May Krishna bestows his mercy upon you and by the mercy of Krishna you will find your devotional match at its right time. All the very Best.\n"),
               
                    DrawerCommanCode()
                        .buildText("All Glories to Srila Prabhupada!"),
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
