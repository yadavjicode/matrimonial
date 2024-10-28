import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Contact Us",
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
              SizedBox(
                width: double.infinity,
                child:
                    Image.asset("assets/images/social.png", fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    DrawerCommanCode().buildText(
                        "Following is the list of Our Offical Social Media Handles:\n"),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              DrawerCommanCode().buildText("Instagram"),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () => {
                                  CommanClass.launchURL(
                                      "https://www.instagram.com/devotee_matrimony")
                                  // _launchURL('https://www.instagram.com/your_username')
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/icons/instagram.svg",
                                        height: 60,
                                        width: 60,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Devotee Matrimony",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              DrawerCommanCode().buildText("Facebook"),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () => {
                                  CommanClass.launchURL(
                                      "https://www.facebook.com/people/Devotee-Matrimony/61561864452226/?mibextid=rS40aB7S9Ucbxw6v")
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 15),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                            "assets/images/icons/facebook.svg",
                                            height: 52,
                                            width: 52),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Devotee Matrimony",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.black),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
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
