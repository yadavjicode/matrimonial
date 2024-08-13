import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MembershipPackages extends StatefulWidget {
  const MembershipPackages({super.key});

  @override
  State<MembershipPackages> createState() => _MembershipPackagesState();
}

class _MembershipPackagesState extends State<MembershipPackages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Membership Packages",
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Hare Krishna!",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleSemiBold(
                          fontSize: 14, color: AppColors.primaryColor),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "With the blessings of Senior Vaisnavas, we are maintaining this application to serve the devotee community, to generate super profits is not the purpose behind this application. But still to maintain this application and to promote it within the devotee community, we also need some funds. So, for that purpose we are keeping a very nominal charge to get register on this application and from time to time we also come up with some offers so that devotee community can take advantage of such offers, you can check that offers in the Coupons/ Offers Section.\n",
                      textAlign: TextAlign.center,
                      style: FontConstant.styleRegular(
                          fontSize: 14, color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.center,
                            "Package List",
                            style: FontConstant.styleSemiBold(
                                fontSize: 16, color: AppColors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildPack(),
                  Text(
                    "\nIf we compare this application with other commercial matrimonial application, then it is more than 85% cheaper than such commercial applications. We are not having multiple kind of packages to confuse the public, we have only 2 versions. One is Free Version and Other one is Premium Version.\n",
                    textAlign: TextAlign.center,
                    style: FontConstant.styleRegular(
                        fontSize: 14, color: AppColors.black),
                  ),
                  CustomButton(
                      text: "View Details & Compare Pack",
                      onPressed: () => {Get.toNamed("/package")},
                      color: AppColors.primaryColor,
                      textStyle: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.constColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Discount Coupons",
                              style: FontConstant.styleMedium(
                                  fontSize: 17, color: AppColors.black),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _buildDiscount(
                              context,
                              "New Users Boys",
                              "BPROF250",
                              "Get 15% Discount upto ₹20 for the first 250 boys"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: _buildDiscount(
                              context,
                              "New Users Girls",
                              "GPROF250",
                              "Get 15% Discount upto ₹20 on primum pack"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildPack() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: AppColors.constColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "Free Pack",
                      textAlign: TextAlign.start,
                      style: FontConstant.styleSemiBold(
                          fontSize: 16, color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                              ),
                              child: SvgPicture.asset(
                                  "assets/images/icons/correct.svg"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Current Pack",
                                style: FontConstant.styleRegular(
                                    fontSize: 12, color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: AppColors.primaryColor)),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Crown.png",
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "Premium Pack",
                            textAlign: TextAlign.start,
                            style: FontConstant.styleSemiBold(
                                fontSize: 16, color: AppColors.constColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.constColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.grey,
                              ),
                              // child: SvgPicture.asset(
                              //     "assets/images/icons/correct.svg"),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Select Pack",
                                style: FontConstant.styleRegular(
                                    fontSize: 12, color: AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDiscount(
    BuildContext context, String tittle, String code, String subtittle) {
  return Container(
    height: 80,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: AppColors.constColor,
      border: Border.all(color: Colors.grey.shade300),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            radius: 35.0, // Adjust the radius as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "15%",
                  style: FontConstant.styleMedium(
                    fontSize: 18,
                    color: AppColors.constColor,
                  ),
                  maxLines: 1, // Limits to one line
                  overflow: TextOverflow.ellipsis, // Adds ellipsis for overflow
                  textAlign: TextAlign.center,
                ),
                // Adds space between the two texts
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Discount",
                    style: FontConstant.styleMedium(
                      fontSize: 10,
                      color: AppColors.constColor,
                    ),
                    maxLines: 1, // Limits to one line
                    overflow:
                        TextOverflow.ellipsis, // Adds ellipsis for overflow
                    textAlign:
                        TextAlign.center, // Center the text inside the circle
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tittle,
                  style: FontConstant.styleSemiBold(
                      fontSize: 15, color: AppColors.black),
                  maxLines: 1, // Limits to one line
                  overflow: TextOverflow.ellipsis, // Adds ellipsis for overflow
                ),
                Text(
                  subtittle,
                  style: FontConstant.styleRegular(
                      fontSize: 10, color: AppColors.black),
                  maxLines: 2, // Limits to one line
                  overflow: TextOverflow.ellipsis, // Adds ellipsis for overflow
                )
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: AppColors.darkblue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  code,
                  style: FontConstant.styleBold(
                      fontSize: 13, color: AppColors.constColor),
                ),
                SvgPicture.asset("assets/images/icons/copy.svg"),
                Text(
                  "COPY",
                  style: FontConstant.styleMedium(
                      fontSize: 12, color: AppColors.constColor),
                )
              ]),
        )
      ],
    ),
  );
}
