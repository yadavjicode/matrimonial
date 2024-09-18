import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';

class SuggestionFromOurSide extends StatefulWidget {
  const SuggestionFromOurSide({super.key});

  @override
  State<SuggestionFromOurSide> createState() => _SuggestionFromOurSideState();
}

class _SuggestionFromOurSideState extends State<SuggestionFromOurSide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Suggestion from Our Side",
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
                child: Image.asset("assets/images/suggestion.png",
                    fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildText(
                        "We are very delighted to know that you are a devotional mood person and also looking for the same natured person to enter into Grihastha Ashram.\n"),
                    DrawerCommanCode().buildText(
                        "Also we are very thankful to you that you have choosen our application to find your devotional Match.\n"),
                    DrawerCommanCode().buildText(
                        "To find a perfect match, we have some basic suggestions for you:\n"),
                    DrawerCommanCode().question("a",
                        "Before finalising your match, please try to have a good discussion from your Diksha Guru/ Shiksha Guru/ Mentor/ Parents, and also try to have a meeting with the mentor of your Match.\n"),
                    DrawerCommanCode().question("b",
                        "It is not practically possible for us to verify each and every information of each and every created profile, so before finalizing the things you please try to verify the information of your match at your end.\n"),
                    DrawerCommanCode().question("c",
                        "For Profile of Girls, we are suggesting that if possible don't provide your Phone Number, it is suggested that you can provide contact number of your Parents/ Brother.")
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
