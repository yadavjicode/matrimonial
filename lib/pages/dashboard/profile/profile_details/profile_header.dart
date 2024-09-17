import 'package:carousel_slider/carousel_slider.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/dashboard_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
  final DashboardController dashboardController =
      Get.put(DashboardController());
  final MatchesController matchesController = Get.put(MatchesController());
  final SearchsController searchController = Get.put(SearchsController());
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  int _currentIndex = 0;

  List<String> getImageList() {   
    List<String> imgList = [];  

    // Check each photo field and add to the list if it's not null
    if (profileDetailsController.member?.data?.photo1 != null) {
      imgList.add(profileDetailsController.member!.data!.photo1!);
    }
    if (profileDetailsController.member?.data?.photo2 != null) {
      imgList.add(profileDetailsController.member!.data!.photo2!);
    }
    if (profileDetailsController.member?.data?.photo3 != null) {
      imgList.add(profileDetailsController.member!.data!.photo3!);
    }
    if (profileDetailsController.member?.data?.photo4 != null) {
      imgList.add(profileDetailsController.member!.data!.photo4!);
    }
    if (profileDetailsController.member?.data?.photo5 != null) {
      imgList.add(profileDetailsController.member!.data!.photo5!);
    }
    return imgList;
  }

  final EditProfileController user = Get.put(EditProfileController());
  bool compare(dynamic a, dynamic b) {
    if (a == null || b == null) {
      return false;
    }
    if (a == b) {
      return true;
    } else {
      return false;
    }
  }

  int compareInt(dynamic a, dynamic b) {
    if (a == null || b == null) {
      return 0;
    }
    if (a == b) {
      return 1;
    } else {
      return 0;
    }
  }

  int count() {
    int age = profileDetailsController.member!.data!.pEFromAge != null &&
            profileDetailsController.member!.data!.pEToAge != null &&
            user.member!.member!.pEFromAge != null &&
            user.member!.member!.pEToAge != null
        ? compareInt(
            compare(profileDetailsController.member!.data!.pEFromAge,
                user.member!.member!.pEFromAge),
            compare(profileDetailsController.member!.data!.pEToAge,
                user.member!.member!.pEToAge))
        : 0;
    int height = profileDetailsController.member!.data!.pEHeight != null &&
            profileDetailsController.member!.data!.pEHeight2 != null &&
            user.member!.member!.pEHeight != null &&
            user.member!.member!.pEHeight2 != null
        ? compareInt(
            compare(profileDetailsController.member!.data!.pEHeight,
                user.member!.member!.pEHeight),
            compare(profileDetailsController.member!.data!.pEHeight2,
                user.member!.member!.pEHeight2))
        : 0;
    int marital =
        profileDetailsController.member!.data!.pEMaritalStatus != null &&
                user.member!.member!.pEMaritalStatus != null
            ? compareInt(profileDetailsController.member!.data!.pEMaritalStatus,
                user.member!.member!.pEMaritalStatus)
            : 0;
    int religion = profileDetailsController.member!.data!.pEReligion != null &&
            user.member!.member!.pEReligion != null
        ? compareInt(profileDetailsController.member!.data!.pEReligion,
            user.member!.member!.pEReligion)
        : 0;
    int country =
        profileDetailsController.member!.data!.pECountrylivingin != null &&
                user.member!.member!.pECountrylivingin != null
            ? compareInt(
                profileDetailsController.member!.data!.pECountrylivingin,
                user.member!.member!.pECountrylivingin)
            : 0;
    int state = profileDetailsController.member!.data!.pEState != null &&
            user.member!.member!.pEState != null
        ? compareInt(profileDetailsController.member!.data!.pEState,
            user.member!.member!.pEState)
        : 0;
    int income =
        profileDetailsController.member!.data!.pEAnnualincome != null &&
                user.member!.member!.pEAnnualincome != null
            ? compareInt(profileDetailsController.member!.data!.pEAnnualincome,
                user.member!.member!.pEAnnualincome)
            : 0;
    return (age + height + marital + religion + country + state + income);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = getImageList();
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    padEnds: false,
                    aspectRatio: 4 / 5,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: imgList
                      .map((item) => Container(
                            width: double.infinity,
                            child: ClipRRect(
                              child: Image.network(
                                "http://devoteematrimony.aks.5g.in/${item}",
                                width: double.infinity,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
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
                  bottom: 5,
                  left: 18,
                  right: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (profileDetailsController.member!.data!.accountType ==
                          1)
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                          alignment: Alignment.center,
                          width: 100,
                          decoration: BoxDecoration(
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
                              SizedBox(
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
                      if (profileDetailsController.member!.data!.accountType ==
                          1)
                        SizedBox(
                          height: 5,
                        ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profileDetailsController
                                      .member!.data!.interestStatus ==
                                  1
                              ? Container(
                                  // margin: EdgeInsets.only(top: 5),
                                  alignment: Alignment.center,
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
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
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: SvgPicture.asset(
                                      "assets/images/icons/pinkcorrect.svg"),
                                ),
                          SizedBox(
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
                      SizedBox(
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
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Positioned(
                  bottom:
                      5.0, // Position the indicator 10 pixels from the bottom
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.primaryColor
                              : AppColors.constColor,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                    right: 5,
                    bottom: 18,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.constColor),
                              color: AppColors.purple),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${((count() * 100) / 7).toInt()} %",
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
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              profileDetailsController.member!.data!
                                  .shortlistStatus = profileDetailsController
                                          .member!.data!.shortlistStatus ==
                                      1
                                  ? 0
                                  : 1;
                            });
                            shortlistController.shortlist(
                              context,
                              profileDetailsController.member!.data!.matriID,
                              btnOkOnPress: () => {
                                dashboardController.dashboard(context),
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
                                        widget.search[10] ?? "")
                                  }
                              },
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: AppColors.constColor)),
                            child: Center(
                              child: Icon(
                                profileDetailsController
                                            .member!.data!.shortlistStatus ==
                                        1
                                    ? (Icons.favorite)
                                    : Icons.favorite_border_rounded,
                                color: profileDetailsController
                                            .member!.data!.shortlistStatus ==
                                        1
                                    ? Colors.red
                                    : AppColors.constColor,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
// End Profile header page =================================================================================================================

