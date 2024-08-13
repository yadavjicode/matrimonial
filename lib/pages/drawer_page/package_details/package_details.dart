import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({super.key});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Package Details",
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 81,
                        // color: AppColors.darkblue,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.constColor),
                              child: Image.asset(
                                "assets/images/usergrey.png",
                              ),
                            ),
                            Text(
                              "Free",
                              style: FontConstant.styleBold(
                                  fontSize: 14, color: AppColors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        // color: AppColors.darkblue,
                        width: 81,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.constColor),
                              child: Image.asset(
                                "assets/images/Crown.png",
                              ),
                            ),
                            Text(
                              "Premium",
                              style: FontConstant.styleBold(
                                  fontSize: 14, color: AppColors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _packageSelect(
                      "Able to see photos uploaded on others Profile"),
                  _packageSelect("Use Filter/ Sorting Feature"),
                  _packageSelect("View Full Profile of Others"),
                  _packageSelect("Using Search Feature"),
                  _packageSelect("Chat"),
                  _packageSelect("See Contact No.s"),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Send Interest to users",
                        style: FontConstant.styleRegular(
                            fontSize: 12, color: AppColors.black),
                      )),
                      Container(
                          width: 81,
                          // height: 81,
                          alignment: Alignment.center,
                          child: Text(
                            "5 Per Day",
                            style: FontConstant.styleBold(
                                fontSize: 12, color: AppColors.green),
                          )),
                      Container(
                          width: 81,
                          height: 81,
                          color: AppColors.constColor,
                          alignment: Alignment.center,
                          child: Text(
                            "200",
                            style: FontConstant.styleBold(
                                fontSize: 12, color: AppColors.green),
                          ))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 100),
                    child: CustomButton(
                        text: "Buy Premium Pack Now",
                        onPressed: () => {
                              //  Get.toNamed("/package")
                            },
                        color: AppColors.primaryColor,
                        textStyle: FontConstant.styleRegular(
                            fontSize: 16, color: AppColors.constColor)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _packageSelect(String tittle) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: Text(
            tittle,
            style:
                FontConstant.styleRegular(fontSize: 12, color: AppColors.black),
          )),
          Container(
            width: 81,
            height: 81,
            alignment: Alignment.center,
            child: Container(
              height: 19,
              width: 19,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.red),
              child: Icon(
                Icons.close,
                size: 17,
                color: AppColors.constColor,
              ),
            ),
          ),
          Container(
            width: 81,
            height: 81,
            color: AppColors.constColor,
            alignment: Alignment.center,
            child: Container(
                height: 19,
                width: 19,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.green,
                ),
                child: SvgPicture.asset("assets/images/icons/correct.svg")),
          )
        ],
      ),
      Container(
        height: 1,
        color: AppColors.grey,
      )
    ],
  );
}
