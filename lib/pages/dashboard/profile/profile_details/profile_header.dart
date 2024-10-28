import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/home_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../chat/widgets/last_online.dart';

// start profile Header page =================================================================================================================

class ProfileHeader extends StatefulWidget {
  final String value;
  final List<dynamic> search;
  ProfileHeader({Key? key, required this.value, required this.search})
      : super(key: key);

  @override
  ProfileHeaderState createState() => ProfileHeaderState();
}

class ProfileHeaderState extends State<ProfileHeader> {
  bool isFavorite = false;
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final HomeController homeController = Get.put(HomeController());
  final MatchesController matchesController = Get.put(MatchesController());
  final SearchsController searchController = Get.put(SearchsController());
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  final EditProfileController user = Get.put(EditProfileController());
  List<String> getImageList() {
    List<String> imgList = [];

    if (profileDetailsController.member?.data?.photo1 != null) {
      imgList.add(profileDetailsController.member?.data?.photo1!);
    }
    if (profileDetailsController.member?.data?.photo2 != null) {
      imgList.add(profileDetailsController.member?.data?.photo2!);
    }
    if (profileDetailsController.member?.data?.photo3 != null) {
      imgList.add(profileDetailsController.member?.data?.photo3!);
    }
    if (profileDetailsController.member?.data?.photo4 != null) {
      imgList.add(profileDetailsController.member?.data?.photo4!);
    }
    if (profileDetailsController.member?.data?.photo5 != null) {
      imgList.add(profileDetailsController.member?.data?.photo5!);
    }
    return imgList;
  }

  @override
  Widget build(BuildContext context) {
    String profileImage = CommanClass.photo(
        profileDetailsController.member?.data?.photo1,
        profileDetailsController.member?.data?.gender);
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Image.network(
                  profileImage,
                  width: SizeConfig.screenWidth,
                  height: (SizeConfig.screenWidth * 1) * 5 / 4,
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 18,
                  right: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (profileDetailsController.member?.data?.accountType ==
                          1)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 2),
                          alignment: Alignment.center,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: AppColors.constColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Crown.png",
                                height: 15,
                                width: 15,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Expanded(
                                child: Text(
                                  "Premium",
                                  style: FontConstant.styleMedium(
                                      fontSize: 12, color: Color(0xFFF69506)),
                                ),
                              )
                            ],
                          ),
                        ),
                      if (profileDetailsController
                                  .member?.data?.hideOnlineStatus ==
                              0 ||
                          profileDetailsController
                                  .member?.data?.hideLastActiveStatus ==
                              0)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: UserStatusWidget(
                              color: AppColors.constColor,
                              userId: profileDetailsController
                                  .member?.data?.matriID,
                              onlineStatus: profileDetailsController
                                      .member?.data?.hideOnlineStatus ??
                                  0,
                              lastSeenStatus: profileDetailsController
                                      .member?.data?.hideLastActiveStatus ??
                                  0),
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profileDetailsController
                                      .member?.data?.interestStatus ==
                                  1
                              ? Container(
                                  // margin: EdgeInsets.only(top: 5),
                                  alignment: Alignment.center,
                                  height: 22,
                                  width: 22,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green),
                                  child: SvgPicture.asset(
                                      "assets/images/icons/correct.svg"),
                                )
                              : Container(
                                  //  margin: EdgeInsets.only(top: 5),
                                  alignment: Alignment.center,
                                  height: 22,
                                  width: 22,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: SvgPicture.asset(
                                      "assets/images/icons/pinkcorrect.svg"),
                                ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              '${profileDetailsController.member?.data?.name ?? ""} ${profileDetailsController.member?.data?.surename ?? ""}  (ID:${profileDetailsController.member?.data?.matriID ?? ""})',
                              // overflow: TextOverflow.ellipsis,
                              style: FontConstant.styleSemiBold(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${profileDetailsController.member?.data?.occupation == null ? "" : "${profileDetailsController.member?.data?.occupation}"}${profileDetailsController.member?.data?.education == null || profileDetailsController.member?.data?.occupation == null ? "" : " - "}${profileDetailsController.member?.data?.education == null ? "" : "${profileDetailsController.member?.data?.education}"}',
                        style: FontConstant.styleSemiBold(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${profileDetailsController.member?.data?.age == null ? "" : "${profileDetailsController.member?.data?.age} Years"}${profileDetailsController.member?.data?.age == null || profileDetailsController.member?.data?.height == null ? "" : " | "}${profileDetailsController.member?.data?.height == null ? "" : "${profileDetailsController.member?.data?.height}"}',
                        style: FontConstant.styleSemiBold(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                if (profileDetailsController.member?.data?.photo1 != null)
                  Positioned(
                    top: 10,
                    right: 5,
                    child: GestureDetector(
                      onTap: () => {Get.toNamed("/viewAllphotos")},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: Colors.white.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: AppColors.constColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "${getImageList().length}",
                                style: FontConstant.styleRegular(
                                    fontSize: 12, color: AppColors.constColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                Positioned(
                    right: 5,
                    bottom: 8,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.constColor.withOpacity(0.3)),
                              color: AppColors.black.withOpacity(0.3)),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${profileDetailsController.member?.matchData?.percentage}%",
                                style: FontConstant.styleRegular(
                                    fontSize: 10, color: AppColors.constColor),
                              ),
                              Text(
                                "Matches",
                                style: FontConstant.styleRegular(
                                    fontSize: 8, color: AppColors.constColor),
                              ),
                              Text("Score",
                                  style: FontConstant.styleRegular(
                                      fontSize: 8,
                                      color: AppColors.constColor)),
                            ],
                          )),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //   height: 50,
                        //   width: 50,
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       border: Border.all(color: AppColors.constColor)),
                        //   child: Center(
                        //     child: SvgPicture.asset(
                        //       "assets/images/icons/whatsaap.svg",
                        //       width: 25,
                        //       height: 25,
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              profileDetailsController.member!.data!
                                  .shortlistStatus = profileDetailsController
                                          .member?.data?.shortlistStatus ==
                                      1
                                  ? 0
                                  : 1;
                            });
                            shortlistController.shortlist(
                              context,
                              profileDetailsController.member?.data?.matriID,
                              btnOkOnPress: () => {
                                homeController.dashboard(context),
                                print("value=====${widget.value}"),
                                if (widget.value == "near_by_list" ||
                                    widget.value == "education_list" ||
                                    widget.value == "profession_list" ||
                                    widget.value == "recently_joined" ||
                                    widget.value == "intrested_in_you" ||
                                    widget.value == "daily_recommendation" ||
                                    widget.value == "matches")
                                  {
                                    matchesController.reset(
                                        context, widget.value),
                                  },
                                if (widget.value == "search")
                                  {
                                    searchController.reset(
                                      context,
                                      widget.search[0] ?? "",
                                      widget.search[1] ?? "",
                                      widget.search[2] ?? "",
                                      widget.search[3] ?? "",
                                      widget.search[4] ?? "",
                                      widget.search[5] ?? "",
                                      widget.search[6] ?? "",
                                      widget.search[7] ?? "",
                                      widget.search[8] ?? "",
                                      widget.search[9] ?? "",
                                      widget.search[10] ?? "",
                                      widget.search[11] ?? "",
                                      widget.search[12] ?? "",
                                      widget.search[13] ?? "",
                                      widget.search[14] ?? "",
                                    )
                                  }
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3))),
                            child: Center(
                              child: Icon(
                                profileDetailsController
                                            .member?.data?.shortlistStatus ==
                                        1
                                    ? (Icons.favorite)
                                    : Icons.favorite_border_rounded,
                                color: profileDetailsController
                                            .member?.data?.shortlistStatus ==
                                        1
                                    ? Colors.red
                                    : AppColors.constColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
// End Profile header page =================================================================================================================
