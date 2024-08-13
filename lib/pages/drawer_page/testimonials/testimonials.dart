import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Testimonial extends StatefulWidget {
  const Testimonial({super.key});

  @override
  State<Testimonial> createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
  String selectedText = "";
  int selectedIndex = -1;
  final List<List> matches = [
    [
      "Sumitra Mahajan",
      "Manager",
      3,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
      "assets/images/girla.png"
    ],
    [
      "Manshi Bishnoi",
      "Sales Executive",
      4,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
      "assets/images/girlb.png"
    ],
    [
      "Kulsharan Sharma",
      "Manager",
      5,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
      "assets/images/girlc.png"
    ],
    [
      "Pooja Gupta",
      "Android Developer",
      2,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
      "assets/images/girla.png"
    ],
    [
      "Kavita Singh",
      "Flutter Developer",
      1,
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
      "assets/images/girlb.png"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Testimonials",
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
                child: Image.asset("assets/images/testimonial.png",
                    fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    //   color: AppColors.constColor,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: matches.asMap().entries.map((entry) {
                            int index = entry.key;
                            String name = entry.value[0];
                            String profile = entry.value[1];
                            int rating = entry.value[2];
                            String feedback = entry.value[3];
                            String image = entry.value[4];

                            return GestureDetector(
                              onTap: () {
                                // Get.toNamed('/profiledtls');
                              },
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  name,
                                                  style: FontConstant
                                                      .styleSemiBold(
                                                          fontSize: 14,
                                                          color: AppColors
                                                              .primaryColor),
                                                ),
                                                SizedBox(width: 20),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 2),
                                                  child: Text(
                                                    profile,
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .black),
                                                  ),
                                                ),
                                                RatingBar.builder(
                                                  itemSize: 20,
                                                  initialRating: rating
                                                      .toDouble(), // Initial rating
                                                  minRating:
                                                      1, // Minimum rating
                                                  direction: Axis
                                                      .horizontal, // Direction of the rating bar
                                                  allowHalfRating:
                                                      true, // Allow half rating
                                                  itemCount:
                                                      rating, // Number of stars
                                                  // itemPadding: EdgeInsets.symmetric(
                                                  //     horizontal:
                                                  //         4.0), // Padding between stars
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Color(
                                                        0xffEDB118), // Color of the stars
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(
                                                        rating); // Callback to handle rating change
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 2,
                                          bottom: 10),
                                      child: DrawerCommanCode()
                                          .buildText(feedback),
                                    ),
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
