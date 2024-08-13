import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyShorlistProfile extends StatefulWidget {
  const MyShorlistProfile({super.key});

  @override
  State<MyShorlistProfile> createState() => _MyShorlistProfileState();
}

class _MyShorlistProfileState extends State<MyShorlistProfile> {
  @override
  Widget build(BuildContext context) {
    String selectedText = "";
    int selectedIndex = -1;
    final List<List> matches = [
      [
        "Surbi Tiwari",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girla.png"
      ],
      [
        "Janvi Sharma",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girlb.png"
      ],
      [
        "Surbi Tiwari",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girlc.png"
      ],
      [
        "Pooja Gupta",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girla.png"
      ],
      [
        "Kavita Singh",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girlb.png"
      ],
      [
        "Pooja Gupta",
        "Software Professional-Graduate",
        "26",
        "5ft 5 inch",
        "Knatri Hindu - Bangalore, India",
        "assets/images/girlc.png"
      ]
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "My Shortlisted Profiles",
          style: FontConstant.styleMedium(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Container(
            color: AppColors.constColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: matches.asMap().entries.map((entry) {
                    int index = entry.key;
                    String name = entry.value[0];
                    String qualification = entry.value[1];
                    String age = entry.value[2];
                    String height = entry.value[3];
                    String address = entry.value[4];
                    String image = entry.value[5];

                    return GestureDetector(
                      onTap: () {
                        // Get.toNamed('/profiledtls');
                      },
                      child: Container(
                        //  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.grey.shade300
                              : Colors.white,
                          border: Border.all(color: Colors.grey.shade200),
                          //  borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                          image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("ID: M13111901",
                                                style: FontConstant.styleMedium(
                                                    fontSize: 12,
                                                    color: AppColors.darkgrey)),
                                            Spacer(),
                                            Text(
                                              "Received On: 10-07-2024",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                name,
                                                style:
                                                    FontConstant.styleSemiBold(
                                                        fontSize: 13,
                                                        color: AppColors
                                                            .primaryColor),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                          child: Text(
                                            "26 Yrs, 5ft 5 In, Bramin, Unmarried, Software Professional - Graduate, Hindu - Bangalore, India.",
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.darkgrey),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(3),
                              margin:
                                  EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "To contact her directly,",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: AppColors.black),
                                  ),
                                  Text(
                                    " Upgrade Now",
                                    style: FontConstant.styleSemiBold(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12, right: 12, bottom: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/icons/remove.svg"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Remove",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: AppColors.black),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/chat_d.svg",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Chat Now",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: AppColors.black),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/pink_search.svg",
                                    height: 20,
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "View Profile",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: AppColors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
