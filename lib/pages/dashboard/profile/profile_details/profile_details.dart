// ignore_for_file: avoid_unnecessary_containers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/dashboard_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/about.dart';
import 'package:devotee/pages/search/search_result/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());

  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  final ShortlistController shortlistController =
      Get.put(ShortlistController());

  final Map<String, dynamic> arguments = Get.arguments;

  final SearchResult searchResult = Get.put(SearchResult());

  final SearchsController searchController = Get.put(SearchsController());

  final MatchesController matchesController = Get.put(MatchesController());

  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    String keys = arguments['keys'];
    String ageFrom = arguments['ageFrom'];
    String ageTo = arguments['ageTo'];
    String heightFrom = arguments['heightFrom'];
    String heightTo = arguments['heightTo'];
    String maritalStatus = arguments['maritalStatus'];
    String religion = arguments['religion'];
    String caste = arguments['caste'];
    String country = arguments['country'];
    String state = arguments['state'];
    String city = arguments['city'];
    String education = arguments['education'];

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            'Profile Details',
            style: FontConstant.styleMedium(fontSize: 18, color: Colors.white),
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileHeader(
                          value: keys,
                          search: [
                            ageFrom ?? "",
                            ageTo ?? "",
                            heightFrom ?? "",
                            heightTo ?? "",
                            maritalStatus ?? "",
                            religion ?? "",
                            caste ?? "",
                            country ?? "",
                            state ?? "",
                            city ?? "",
                            education ?? ""
                          ],
                        ),
                        BasicDetails(),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 18.0, left: 18),
                          child: About(),
                        ),
                        Compatiblity(),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // setState(() {
                          //   profileDetailsController.member!.data!
                          //       .interestStatus = profileDetailsController
                          //               .member!.data!.interestStatus ==
                          //           0
                          //       ? 1
                          //       : 1;
                          // });
                          dashboardController.dashboard(context);
                          print("value=====${keys}");
                          if (keys == "near_by_list" ||
                              keys == "education_list" ||
                              keys == "profession_list" ||
                              keys == "recently_joined" ||
                              keys == "intrested_in_you" ||
                              keys == "daily_recommendation" ||
                              keys == "matches") {
                            matchesController.reset(context, keys);
                          }

                          if (keys == "search") {
                            searchController.reset(
                                context,
                                ageFrom,
                                ageTo,
                                heightFrom,
                                heightTo,
                                maritalStatus,
                                religion,
                                caste,
                                country,
                                state,
                                city,
                                education);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/icons/callnow.svg"),
                            SizedBox(
                              width: 10,
                            ),
                            const Text('CALL NOW'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print(
                              "${profileDetailsController.member?.data?.matriID}");
                          sentInvitationController.sentInvitation(context,
                              profileDetailsController.member?.data?.matriID);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xff583789),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "assets/images/icons/interest.svg"),
                            SizedBox(
                              width: 10,
                            ),
                            const Text('Send Interest'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (sentInvitationController.isLoading.value ||
                shortlistController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}

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
                    aspectRatio: 20 / 22,
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
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.constColor)),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/images/icons/whatsaap.svg",
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
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

class BasicDetails extends StatelessWidget {
  BasicDetails({super.key});
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          color: AppColors.constColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Profile created by myself',
                    style: FontConstant.styleSemiBold(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Text(
                '|',
                style: FontConstant.styleSemiBold(
                    fontSize: 12, color: Colors.black),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  'Last Login: ${profileDetailsController.member!.data!.lastlogin ?? ""}',
                  style: FontConstant.styleSemiBold(
                      fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Details:',
                style: FontConstant.styleSemiBold(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BasicDetailsGrid(),
            ],
          ),
        )
      ],
    );
  }
}

//start Basic deatils ==================================================================================================================

class BasicDetailsGrid extends StatelessWidget {
  BasicDetailsGrid({super.key});
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        DetailRow(
          path: "assets/images/icons/region.svg",
          title: 'Gender',
          value: profileDetailsController.member?.data?.gender ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/dob.svg",
          title: 'Birth Date',
          value: profileDetailsController.member?.data?.dOB ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/region.svg",
          title: 'Religion',
          value: profileDetailsController.member?.data?.religion ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/marital.svg",
          title: 'Marital Status',
          value: profileDetailsController.member?.data?.maritalstatus ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/study.svg",
          title: 'Study',
          value: profileDetailsController.member?.data?.education ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/langu.svg",
          title: 'Language',
          value: profileDetailsController.member?.data?.language ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/location.svg",
          title: 'Lived In',
          value:
              "${profileDetailsController.member?.data?.city ?? ""}${profileDetailsController.member?.data?.city == null || profileDetailsController.member?.data?.state == null ? "" : ", "}${profileDetailsController.member?.data?.state ?? ""} " ??
                  "",
        ),
        DetailRow(
          path: "assets/images/icons/occupation.svg",
          title: 'Occupation',
          value: profileDetailsController.member?.data?.occupation ?? "",
        ),
      ],
    );
  }
}

//End Basic deatils ==================================================================================================================

class DetailRow extends StatelessWidget {
  final String path;
  final String title;
  final String value;

  DetailRow({
    required this.path,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 24,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SvgPicture.asset(path, color: Colors.pink),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontConstant.styleRegular(
                    fontSize: 15,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  value,
                  style: FontConstant.styleRegular(
                    fontSize: 12,
                    color: AppColors.darkgrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          // tabAlignment: TabAlignment.start,
          controller: tabController,
          isScrollable: true,
          indicatorColor: AppColors.primaryColor,
          labelColor: AppColors.primaryColor,
          tabs: const [
            Tab(text: 'About'),
            Tab(text: 'Lifestyle & Appearances'),
            Tab(text: 'Background'),
            Tab(text: 'Contact Details'),
            Tab(text: 'Professional Details'),
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: tabController,
            children: [
              AboutDetails(),
              LifeStyle(),
              BackgroundDetails(),
              Contact(),
              Professional()
            ],
          ),
        ),
      ],
    );
  }
}

class Compatiblity extends StatefulWidget {
  const Compatiblity({super.key});

  @override
  State<Compatiblity> createState() => _CompatiblityState();
}

class _CompatiblityState extends State<Compatiblity> {
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final EditProfileController user = Get.put(EditProfileController());

  Widget buildAvatarColumn(String imagePath, String label) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            imagePath,
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: FontConstant.styleMedium(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

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
    String otherImage = profileDetailsController.member?.data?.photo1 != null
        ? "http://devoteematrimony.aks.5g.in/${profileDetailsController.member?.data?.photo1}"
        : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    String myImage = user.member!.member!.Photo1 != null
        ? "http://devoteematrimony.aks.5g.in/${user.member!.member!.Photo1}"
        : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What ${profileDetailsController.member!.data!.gender == "Male" ? "He" : "She"} is Looking For :',
            style: FontConstant.styleMedium(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              buildAvatarColumn(otherImage,
                  '${profileDetailsController.member!.data!.gender == "Male" ? "His" : "Her"} \nPreferences'),
              const Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff583789),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Text(
                  'You match ${count()}/7 of \nher preferences',
                  textAlign: TextAlign.center,
                  style: FontConstant.styleMedium(
                      fontSize: 14, color: const Color(0xff583789)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xff583789),
                ),
              ),
              const Spacer(),
              buildAvatarColumn(myImage, 'Your \nMatch'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoRow(
                    'Age',
                    '${profileDetailsController.member!.data!.pEFromAge ?? "_ _"} to ${profileDetailsController.member!.data!.pEToAge ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEFromAge != null &&
                            profileDetailsController.member!.data!.pEToAge !=
                                null &&
                            user.member!.member!.pEFromAge != null &&
                            user.member!.member!.pEToAge != null
                        ? compare(
                            compare(
                                profileDetailsController
                                    .member!.data!.pEFromAge,
                                user.member!.member!.pEFromAge),
                            compare(
                                profileDetailsController.member!.data!.pEToAge,
                                user.member!.member!.pEToAge))
                        : false),
                InfoRow(
                    'Height',
                    '${profileDetailsController.member!.data!.pEHeight ?? "_ _"} to ${profileDetailsController.member!.data!.pEHeight2 ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEHeight != null &&
                            profileDetailsController.member!.data!.pEHeight2 !=
                                null &&
                            user.member!.member!.pEHeight != null &&
                            user.member!.member!.pEHeight2 != null
                        ? compare(
                            compare(
                                profileDetailsController.member!.data!.pEHeight,
                                user.member!.member!.pEHeight),
                            compare(
                                profileDetailsController
                                    .member!.data!.pEHeight2,
                                user.member!.member!.pEHeight2))
                        : false),
                InfoRow(
                    'Marital Status',
                    '${profileDetailsController.member!.data!.pEMaritalStatus ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEMaritalStatus !=
                                null &&
                            user.member!.member!.pEMaritalStatus != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pEMaritalStatus,
                            user.member!.member!.pEMaritalStatus)
                        : false),
                InfoRow(
                    'Religion / Community',
                    '${profileDetailsController.member!.data!.pEReligion ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEReligion != null &&
                            user.member!.member!.pEReligion != null
                        ? compare(
                            profileDetailsController.member!.data!.pEReligion,
                            user.member!.member!.pEReligion)
                        : false),
                InfoRow(
                    'Country Living in',
                    '${profileDetailsController.member!.data!.pECountrylivingin ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pECountrylivingin !=
                                null &&
                            user.member!.member!.pECountrylivingin != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pECountrylivingin,
                            user.member!.member!.pECountrylivingin)
                        : false),
                InfoRow(
                    'State Living in',
                    '${profileDetailsController.member!.data!.pEState ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEState != null &&
                            user.member!.member!.pEState != null
                        ? compare(
                            profileDetailsController.member!.data!.pEState,
                            user.member!.member!.pEState)
                        : false),
                InfoRow(
                    'Annual Income',
                    '${profileDetailsController.member!.data!.pEAnnualincome ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEAnnualincome !=
                                null &&
                            user.member!.member!.pEAnnualincome != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pEAnnualincome,
                            user.member!.member!.pEAnnualincome)
                        : false),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool backColor;
  final bool isValid;

  const InfoRow(this.title, this.value, this.backColor, this.isValid,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: backColor == true ? AppColors.constColor : Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontConstant.styleMedium(
                        fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    value,
                    style: FontConstant.styleMedium(
                        fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(
              isValid ? Icons.check_circle : Icons.cancel,
              color: isValid ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
