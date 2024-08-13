import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';

class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Profile",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Colors.white,
              child: Image.asset(
                "assets/images/hero.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 220, left: 15, right: 15),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.constColor,
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: Image.asset(
                        "assets/images/hero.jpg",
                        fit: BoxFit.cover,
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ram Potheneni",
                        style: FontConstant.styleRegular(
                            fontSize: 13, color: Colors.grey),
                      ),
                      Text(
                        "ID-090382",
                        style: FontConstant.styleRegular(
                            fontSize: 13, color: Colors.grey),
                      ),
                      Text(
                        "You are a subscribed user",
                        style: FontConstant.styleRegular(
                            fontSize: 13, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, bottom: 3),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            //   borderRadius:
                            //     BorderRadius.all(Radius.circular(10))
                          ),
                          child: Text(
                            "Upgrade Plan",
                            style: FontConstant.styleSemiBold(
                                fontSize: 13, color: AppColors.constColor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.constColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Icon(
                        Icons.people,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Matches",
                      style: FontConstant.styleSemiBold(
                          fontSize: 12, color: AppColors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.constColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Icon(
                        Icons.thumb_up,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Shortlisted",
                      style: FontConstant.styleSemiBold(
                          fontSize: 12, color: AppColors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.constColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Profile View",
                      style: FontConstant.styleSemiBold(
                          fontSize: 12, color: AppColors.black),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.constColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade200)),
                      child: Icon(
                        Icons.message,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      "Chat",
                      style: FontConstant.styleSemiBold(
                          fontSize: 12, color: AppColors.black),
                    )
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Notification",
                        style: FontConstant.styleSemiBold(
                            fontSize: 13, color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.subtitles,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Subscription Plans",
                        style: FontConstant.styleSemiBold(
                            fontSize: 13, color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Settings",
                        style: FontConstant.styleSemiBold(
                            fontSize: 13, color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.terminal,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Term & Condition",
                        style: FontConstant.styleSemiBold(
                            fontSize: 13, color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: AppColors.primaryColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Logout",
                        style: FontConstant.styleSemiBold(
                            fontSize: 13, color: AppColors.black),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
