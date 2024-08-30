import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devotee/chat/widgets/last_online.dart';
import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/chat/helper/my_date_util.dart';
import 'package:devotee/chat/screens/home_screen.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/dashboard_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
 final SearchsController searchController = Get.put(SearchsController());
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());
  bool age = true;
  bool height = true;
  final Map<String, dynamic> arguments = Get.arguments;
  final ScrollController _scrollController = ScrollController();
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  void initState() {
    final String ageFrom = arguments['ageFrom'];
    final String ageTo = arguments['ageTo'];
    final String heightFrom = arguments['heightFrom'];
    final String heightTo = arguments['heightTo'];
    final String maritalStatus = arguments['maritalStatus'];
    final String religion = arguments['religion'];
    final String caste = arguments['caste'];
    final String country = arguments['country'];
    final String state = arguments['state'];
    final String city = arguments['city'];
    final String education = arguments['education'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchController.reset(context, ageFrom, ageTo, heightFrom, heightTo,
          maritalStatus, religion, caste, country, state, city, education);
      searchController.Search(context, ageFrom, ageTo, heightFrom, heightTo,
          maritalStatus, religion, caste, country, state, city, education);
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !searchController.isLoading.value &&
          searchController.hasMore.value) {
        searchController.loadNextPage(
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
            education); // Load next page
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String ageFrom = arguments['ageFrom'];
    final String ageTo = arguments['ageTo'];
    final String heightFrom = arguments['heightFrom'];
    final String heightTo = arguments['heightTo'];
    final String maritalStatus = arguments['maritalStatus'];
    final String religion = arguments['religion'];
    final String caste = arguments['caste'];
    final String country = arguments['country'];
    final String state = arguments['state'];
    final String city = arguments['city'];
    final String education = arguments['education'];

    int selectedIndex = -1;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Your Search Result",
          style: FontConstant.styleMedium(
              fontSize: 18, color: AppColors.constColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // Add filter functionality
            },
          ),
        ],
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Obx(() {
          return Stack(children: [
            Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 5),
                  child: Row(
                    children: [
                      if (age && ageFrom != "" || age && ageTo != "")
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.grey.shade200),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Age ${ageFrom} Yrs - ${ageTo} Yrs",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12,
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      age =
                                          false; // Update state to hide container
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 245, 134, 186)),
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.primaryColor,
                                      size: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      SizedBox(width: 10),
                      if (height)
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(color: Colors.grey.shade200),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Height: ${heightFrom} - ${heightTo}",
                                      style: FontConstant.styleMedium(
                                          fontSize: 12,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        height = false;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 245, 134, 186)),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.primaryColor,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        ...searchController.searchs.map((data) {
                          String name =
                              "${data.name ?? ""} ${data.surename ?? ""}";
                          String occupation = data.occupation ?? "";
                          String age = data.age == null
                              ? ""
                              : "${data.age.toString()} Years, ";
                          String height = data.height ?? "";
                          String aadress =
                              " ${data.caste == null ? "" : "${data.caste}, "}${data.religion == null ? "" : "${data.religion}"}${data.caste == null && data.religion == null || data.state == null && data.country == null ? "" : " - "}${data.state == null ? "" : "${data.state}, "}${data.country ?? ""}";
                          String id = data.matriID ?? "";
                          String image = data.photo1 != null
                              ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
                              : "https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg";

                          return Container(
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 10, left: 16, right: 16),
                              //  width: 320,
                              decoration: BoxDecoration(
                                color: selectedIndex == data.name
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, bottom: 8, top: 8),
                                        child: Stack(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.network(
                                              "$image",
                                              height: 196,
                                              width: 137,
                                              filterQuality: FilterQuality.high,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            width: 137,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(top: 170),
                                            child: GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  data.interestStatus =
                                                      data.interestStatus == 0
                                                          ? 1
                                                          : 1;
                                                });
                                                sentInvitationController
                                                    .sentInvitation(
                                                  context,
                                                  id,
                                                  // btnOkOnPress: () => {

                                                  // },
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  data.interestStatus == 1
                                                      ? Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 22,
                                                          width: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .green),
                                                          child: SvgPicture.asset(
                                                              "assets/images/icons/correct.svg"),
                                                        )
                                                      : Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: 22,
                                                          width: 22,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white),
                                                          child: SvgPicture.asset(
                                                              "assets/images/icons/pinkcorrect.svg"),
                                                        ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Send Interest",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .constColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                name,
                                                style:
                                                    FontConstant.styleSemiBold(
                                                        fontSize: 15,
                                                        color: AppColors
                                                            .primaryColor),
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "ID: ${id}",
                                                      style: FontConstant
                                                          .styleMedium(
                                                              fontSize: 13,
                                                              color: AppColors
                                                                  .black),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5),
                                                    width: 1,
                                                    height: 12,
                                                    color: AppColors.grey,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      child: Row(
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
                                                              style: FontConstant
                                                                  .styleMedium(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0xFFF69506)),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              UserStatusWidget(userId: id),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8, bottom: 8),
                                                child: Container(
                                                  height: 1,
                                                  color: Colors.grey.shade200,
                                                ),
                                              ),
                                              Text(
                                                occupation,
                                                style: FontConstant.styleMedium(
                                                    fontSize: 13,
                                                    color: AppColors.darkgrey),
                                              ),
                                              Text(
                                                "${age}${height}",
                                                style: FontConstant.styleMedium(
                                                    fontSize: 13,
                                                    color: AppColors.darkgrey),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text(
                                                    "Created By: Myself",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 13,
                                                            color: AppColors
                                                                .darkgrey)),
                                              ),
                                              Text(
                                                aadress,
                                                style: FontConstant.styleMedium(
                                                    fontSize: 13,
                                                    color: AppColors.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey.shade200,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                data.shortlistStatus =
                                                    data.shortlistStatus == 1
                                                        ? 0
                                                        : 1;
                                              });
                                              shortlistController.shortlist(
                                                context,
                                                id,
                                                btnOkOnPress: () => {
                                                  dashboardController
                                                      .dashboard(context)
                                                },
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  data.shortlistStatus == 1
                                                      ? (Icons.favorite)
                                                      : Icons
                                                          .favorite_border_rounded,
                                                  color: data.shortlistStatus ==
                                                          1
                                                      ? Colors.red
                                                      : AppColors.primaryColor,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Shortlist",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 11,
                                                            color: AppColors
                                                                .black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              if (id.trim().isNotEmpty &&
                                                  id.trim() != null) {
                                                await APIs.addChatUser(id)
                                                    .then((value) {
                                                  if (!value) {
                                                    Dialogs.showSnackbar(
                                                        context,
                                                        'User does not Exists!');
                                                  } else {
                                                    Get.to(HomeScreen());
                                                  }
                                                });
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/chat_d.svg",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Chat Now",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 11,
                                                            color: AppColors
                                                                .black),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () => {
                                              profileDetailsController
                                                  .profileDetails(
                                                      context, id, "search", [
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
                                                education
                                              ])
                                            },
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/pink_search.svg",
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "View Profile",
                                                    style: FontConstant
                                                        .styleMedium(
                                                            fontSize: 11,
                                                            color: AppColors
                                                                .black),
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
                              ));
                        }).toList(),
                        if (searchController.isLoading
                            .value) // Progress indicator at the bottom
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          )
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            if (shortlistController.isLoading.value ||
                profileDetailsController.isLoading.value ||
                sentInvitationController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        })
      ]),
    );
  }
}

// Replace with the correct import path


