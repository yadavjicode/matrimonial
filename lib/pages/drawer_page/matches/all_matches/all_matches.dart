import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllMatches extends StatefulWidget {
  const AllMatches({super.key});

  @override
  State<AllMatches> createState() => _AllMatchesState();
}

class _AllMatchesState extends State<AllMatches> {
  String selectedText = "";
  int selectedIndex = -1;
  final List<List> matches = [
    [
      "Surbi Tiwari",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girla.png"
    ],
    [
      "janvi Sharma",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girlb.png"
    ],
    [
      "Surbi Tiwari",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girlc.png"
    ],
    [
      "Pooja Gupta",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girla.png"
    ],
    [
      "Kavita Singh",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girlb.png"
    ],
    [
      "Pooja Gupta",
      "Software Professinal-Graduate",
      "26",
      "5ft 5 inch",
      "Knatri Hindu - Bangalore, India",
      "assets/images/girlc.png"
    ]
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: matches.asMap().entries.map((entry) {
          int index = entry.key;
          String name = entry.value[0];
          String qualification = entry.value[1];
          String age = entry.value[2];
          String height = entry.value[3];
          String aadress = entry.value[4];
          String image = entry.value[5];
          //  String head = entry.value[1];

          return GestureDetector(
            onTap: () {
              Get.toNamed('/profiledtls');
            },
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              //  width: 320,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.grey.shade300
                    : Colors.white,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                        child: Stack(children: [
                          Container(
                            height: 196,
                            width: 137,
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                              child: Image.asset(
                                "$image",
                                // width: 210,
                                // height: 210,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 137,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 170),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                  child: SvgPicture.asset(
                                      "assets/images/icons/correct.svg"),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Send Interest",
                                  style: FontConstant.styleMedium(
                                      fontSize: 12,
                                      color: AppColors.constColor),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: FontConstant.styleSemiBold(
                                    fontSize: 15,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                "ID: M1311901",
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.black),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 5, bottom: 5, top: 5),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Last Online: 6 Jul 2024, 11:13 am",
                                      style: FontConstant.styleMedium(
                                          fontSize: 13, color: AppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              Text(
                                qualification,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Text(
                                "$age Yrs, $height",
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text("Created By: Myself",
                                    style: FontConstant.styleMedium(
                                        fontSize: 13,
                                        color: AppColors.darkgrey)),
                              ),
                              Text(
                                aadress,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/like.svg",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Shortlist",
                              style: FontConstant.styleMedium(
                                  fontSize: 11, color: AppColors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/chat_d.svg",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Chat Now",
                              style: FontConstant.styleMedium(
                                  fontSize: 11, color: AppColors.black),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/pink_search.svg",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "View Profile",
                              style: FontConstant.styleMedium(
                                  fontSize: 11, color: AppColors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
