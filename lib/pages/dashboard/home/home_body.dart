import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/home_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/model/dashboard_model.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../constants/widget/dialog.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final HomeController homeController = Get.put(HomeController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final DirectChatController directChatController =
      Get.put(DirectChatController());

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   HomeController.dashboard(context);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<List> discover = [
      [
        "assets/images/map_mark.png",
        "Near By",
        "${homeController.member?.responseData?.matchesNearByCount ?? ""}",
        "near_by_list",
        "near_by"
      ],
      [
        "assets/images/education_b.png",
        "Education",
        "${homeController.member?.responseData?.matchesEducationCount ?? ""}",
        "education_list",
        "education"
      ],
      [
        "assets/images/profession.png",
        "Profession",
        "${homeController.member?.responseData?.matchesProfessionalCount ?? ""}",
        "profession_list",
        "profession"
      ]
    ];
    return Column(
      children: [
        newMathches(homeController.member?.responseData?.matches ?? []),
        discoverContent(discover),
        ridConatent(
            "Recently Joined",
            "See All",
            "recently_joined",
            "recently_joined",
            "Recently Joined",
            homeController.member?.responseData?.recentlyJoined ?? []),
        ridConatent(
            "Interested In You",
            "See All",
            "intrested_in_you",
            "intrested_in_you",
            "Interested In You",
            homeController.member?.responseData?.intrestedInYou ?? []),
        profileStatus(),
        ridConatent(
            "Daily Recommendation",
            "See All",
            "daily_recommendation",
            "daily_recommendation",
            "Daily Recommendation",
            homeController.member?.responseData?.dailyRecommendation ??
                []),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }

  Widget newMathches(List<DailyRecommendation> list) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Text(
                "New Matches",
                style: FontConstant.styleSemiBold(
                    fontSize: 17, color: AppColors.black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => {
                  Get.toNamed("/seeAll", arguments: {
                    "type": "Matches",
                    "keys": "matches",
                    "appbar": "New Matches"
                  })
                },
                child: Text(
                  "See All",
                  style: FontConstant.styleSemiBold(
                      fontSize: 14, color: AppColors.primaryColor),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Row(
                children: list.map((data) {
                  String name = "${data.name ?? ""} ${data.surename ?? ""}";
                  List<String?> haList = [
                    data.Age != null ? "${data.Age} Yrs" : null,
                    data.height,
                  ];
                  String haString = CommanClass.commaString(haList);
                  List<String?> eoList = [data.occupation, data.education];
                  String eoString = CommanClass.hyphenString(eoList);
                  List<String?> rcList = [data.caste, data.religion];
                  String rcString = CommanClass.commaString(rcList);
                  List<String?> scList = [data.state, data.country];
                  String scString = CommanClass.commaString(scList);
                  List<String?> infoList = [rcString, scString];
                  String infos = CommanClass.hyphenString(infoList);
                  String image = CommanClass.photo(data.Photo1, data.gender);

                  return Container(
                    width: screenWidth * 0.65,
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 10, left: 7, right: 7),
                    decoration: BoxDecoration(
                      color: AppColors.constColor,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (editProfileController
                                      .member?.member?.accountType ==
                                  1) {
                                profileDetailsController.profileDetails(
                                    context, data.matriID!, "Matches", "", [
                                  "1",
                                  "2",
                                  "3",
                                  "4",
                                  "5",
                                  "6",
                                  "7",
                                  "8",
                                  "9",
                                  "10",
                                  "11",
                                  "12",
                                  "13",
                                  "14",
                                  "15"
                                ]);
                              } else {
                                DialogConstant.packageDialog(
                                    context, 'view profile feature');
                              }
                            },
                            child: Container(
                              width: screenWidth * 0.65,
                              height: screenWidth * 0.65 * (5 / 4),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  image,
                                  width: screenWidth * 0.65,
                                  height: screenWidth * 0.65 * (5 / 4),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 17,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  eoString,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontConstant.styleMedium(
                                      fontSize: 14, color: AppColors.darkgrey),
                                ),
                                Text(
                                  haString,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontConstant.styleMedium(
                                      fontSize: 14, color: AppColors.darkgrey),
                                ),
                                Text(
                                  infos,
                                  overflow: TextOverflow.ellipsis,
                                  style: FontConstant.styleMedium(
                                      fontSize: 14, color: AppColors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (data.accountType == 1)
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Crown.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Premium",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12,
                                        color: const Color(0xFFF69506)),
                                  )
                                ],
                              ),
                            )),
                      Positioned(
                        top: (screenWidth * 0.65 * (5 / 4) - 20),
                        right: screenWidth * 0.015,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: GestureDetector(
                            onTap: () => {
                              setState(() {
                                shortlistController.shortlist(
                                  context,
                                  data.matriID!,
                                  btnOkOnPress: () => {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      homeController.dashboard(context);
                                    })
                                  },
                                );
                              }),
                            },
                            child: Icon(
                              data.shortlistStatus == 1
                                  ? (Icons.favorite)
                                  : Icons.favorite_border_rounded,
                              color: data.shortlistStatus == 1
                                  ? Colors.red
                                  : AppColors.primaryColor,
                              size: 30,
                            ),
                          ),
                        ),
                      )
                    ]),
                  );
                }).toList(),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ridConatent(String leftTittle, String rightTitle, String type,
      String key, String appBarTittle, List<DailyRecommendation> list) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Text(
                leftTittle,
                style: FontConstant.styleSemiBold(
                    fontSize: 17, color: AppColors.black),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => {
                  Get.toNamed("/seeAll", arguments: {
                    "type": type,
                    "keys": key,
                    "appbar": appBarTittle
                  })
                },
                child: Text(
                  rightTitle,
                  style: FontConstant.styleSemiBold(
                      fontSize: 14, color: AppColors.primaryColor),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Row(
                children: list.map((data) {
                  String name = "${data.name ?? ""} ${data.surename ?? ""}";
                  List<String?> haList = [
                    data.Age != null ? "${data.Age} Yrs" : null,
                    data.height,
                  ];
                  String haString = CommanClass.commaString(haList);
                  List<String?> eoList = [data.occupation, data.education];
                  String eoString = CommanClass.hyphenString(eoList);
                  List<String?> rcList = [data.caste, data.religion];
                  String rcString = CommanClass.commaString(rcList);
                  List<String?> scList = [data.state, data.country];
                  String scString = CommanClass.commaString(scList);
                  List<String?> infoList = [rcString, scString];
                  String infos = CommanClass.hyphenString(infoList);
                  String image = CommanClass.photo(data.Photo1, data.gender);

                  return Container(
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 10, left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: AppColors.constColor,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (editProfileController
                                            .member?.member?.accountType ==
                                        1) {
                                      profileDetailsController.profileDetails(
                                          context, data.matriID!, type, "", [
                                        "1",
                                        "2",
                                        "3",
                                        "4",
                                        "5",
                                        "6",
                                        "7",
                                        "8",
                                        "9",
                                        "10",
                                        "11",
                                        "12",
                                        "13",
                                        "14",
                                        "15"
                                      ]);
                                    } else {
                                      DialogConstant.packageDialog(
                                          context, 'view profile feature');
                                    }
                                  },
                                  child: ProfileImage(
                                    size: screenWidth * 0.2,
                                    url: image,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.6,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleSemiBold(
                                                fontSize: 15,
                                                color: AppColors.primaryColor),
                                          ),
                                          Text(
                                            eoString,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.darkgrey),
                                          ),
                                          Text(
                                            haString,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.darkgrey),
                                          ),
                                          Text(
                                            infos,
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            height: 1,
                            width: screenWidth * 0.8,
                            color: Colors.grey.shade200,
                          ),
                          Container(
                            width: screenWidth * 0.8,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      shortlistController.shortlist(
                                        context,
                                        data.matriID!,
                                        btnOkOnPress: () => {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            homeController
                                                .dashboard(context);
                                          })
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        // SvgPicture.asset(
                                        //   "assets/images/like.svg",

                                        //   height: 20,
                                        //   width: 20,
                                        // ),
                                        Icon(
                                          data.shortlistStatus == 1
                                              ? (Icons.favorite)
                                              : Icons.favorite_border_rounded,
                                          color: data.shortlistStatus == 1
                                              ? Colors.red
                                              : AppColors.primaryColor,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Shortlist",
                                            style: FontConstant.styleMedium(
                                                fontSize: 11,
                                                color: AppColors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      if (editProfileController
                                              .member?.member?.accountType ==
                                          1) {
                                        if (data.chatStatus == 1) {
                                          if (data.matriID!.trim().isNotEmpty &&
                                              data.matriID != null) {
                                            await APIs.addChatUser(
                                                    data.matriID!)
                                                .then((value) {
                                              if (!value) {
                                                Dialogs.showSnackbar(context,
                                                    'User does not Exists!');
                                              } else {
                                                APIs.fetchUser(
                                                  context,
                                                  data.matriID
                                                      .toString()
                                                      .trim(),
                                                );
                                              }
                                            });
                                          }
                                        } else {
                                          Dialogs.showSnackbar(context,
                                              'The user is not added in your list!');
                                        }
                                      } else {
                                        DialogConstant.packageDialog(
                                            context, 'chat feature');
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/chat_d.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Chat Now",
                                            style: FontConstant.styleMedium(
                                                fontSize: 11,
                                                color: AppColors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print("${data.matriID}");
                                      sentInvitationController.sentInvitation(
                                        context,
                                        data.matriID!,
                                        btnOkOnPress: () => {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            homeController
                                                .dashboard(context);
                                          })
                                        },
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/send_icon.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Expanded(
                                          child: Text(
                                            data.interestStatus == 1
                                                ? "Sent Interest"
                                                : "Send Interest",
                                            style: FontConstant.styleMedium(
                                                fontSize: 11,
                                                color: AppColors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      if (data.accountType == 1)
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: AppColors.black.withOpacity(0.05),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10))),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/images/Crown.png",
                                    height: 15,
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Premium",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12,
                                        color: const Color(0xFFF69506)),
                                  )
                                ],
                              ),
                            ))
                    ]),
                  );
                }).toList(),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget discoverContent(List<List> discover) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.centerLeft,
          child: Text(
            "Discover matches based on",
            style: FontConstant.styleSemiBold(
                fontSize: 17, color: AppColors.black),
          ),
        ),
        Container(
          // height: 291,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: discover.asMap().entries.map((entry) {
                    String image = entry.value[0];
                    String name = entry.value[1];
                    String num = entry.value[2];
                    String keys = entry.value[3];
                    String type = entry.value[4];

                    return GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () => {
                          Get.toNamed("/basedMatches",
                              arguments: {"keys": keys, "type": type})
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          margin: const EdgeInsets.only(
                              top: 5, bottom: 10, left: 5, right: 5),
                          width: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            color: AppColors.constColor,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 5),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.asset(
                                  "$image",
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      overflow: TextOverflow.ellipsis,
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 15, color: AppColors.black),
                                    ),
                                    Text(
                                      "$num Matches",
                                      overflow: TextOverflow.ellipsis,
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 12,
                                          color: AppColors.darkgrey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget profileStatus() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
      padding: const EdgeInsets.all(5),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xffE7DDF6),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Status: ${editProfileController.member?.profilePercentage ?? ""}%",
                style: FontConstant.styleMedium(
                    fontSize: 11, color: AppColors.black),
              ),
              Text(
                "Complete your profile for more response",
                style: FontConstant.styleMedium(
                    fontSize: 11, color: AppColors.black),
              )
            ],
          ),
          GestureDetector(
            onTap: () => {Get.toNamed("/myProfile")},
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Add Details",
                style: FontConstant.styleMedium(
                    fontSize: 11, color: AppColors.constColor),
              ),
              decoration: const BoxDecoration(
                  color: Color(0xff583689),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )
        ],
      ),
    );
  }
}
