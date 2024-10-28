// ignore_for_file: avoid_unnecessary_containers
import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/block_controller.dart';
import 'package:devotee/controller/home_controller.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/basic_details.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/compatiblity.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/pages_details/pages_deatils.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/profile_header.dart';
import 'package:devotee/pages/search/search_result/search_result.dart';
import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// start main page =================================================================================================================
class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

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
  final BlockController blockController = Get.put(BlockController());

  final Map<String, dynamic> arguments = Get.arguments;

  final SearchResult searchResult = Get.put(SearchResult());

  final SearchsController searchController = Get.put(SearchsController());

  final MatchesController matchesController = Get.put(MatchesController());
  final DirectChatController directChatController =
      Get.put(DirectChatController());

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    String type = arguments['type'];
    String keys = arguments['keys'];
    String name = arguments['name'];
    String profession = arguments['profession'];
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
    String profilePer = arguments['profilePer'];
    String sort = arguments['sort'];

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
            GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < 0) {
                  if (profileDetailsController.member != null &&
                      profileDetailsController.member?.previous != null) {
                    profileDetailsController.profileDetails(
                        context,
                        profileDetailsController.member?.previous ?? "",
                        type,
                        "", [
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
                  }
                } else if (details.primaryVelocity! > 0) {
                  if (profileDetailsController.member != null &&
                      profileDetailsController.member?.next != null) {
                    profileDetailsController.profileDetails(context,
                        profileDetailsController.member?.next ?? "", type, "", [
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
                  }
                }
              },
              child: Column(
                children: [
                  if (profileDetailsController.isLoading.value == false)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProfileHeader(
                              value: keys,
                              search: [
                                name,
                                profession,
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
                                education,
                                profilePer,
                                sort
                              ],
                            ),
                            BasicDetails(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 18.0, left: 18),
                              child: About(),
                            ),
                            const Compatiblity(),
                          ],
                        ),
                      ),
                    ),
                  if (profileDetailsController.isLoading.value == false)
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ElevatedButton(
                              onPressed: directChatController.isLoading.value
                                  ? null
                                  : () async {
                                      if (profileDetailsController
                                              .member?.data?.chatStatus ==
                                          1) {
                                        directChatController.isLoading.value =
                                            true;
                                        if (profileDetailsController
                                                .member?.data?.matriID!
                                                .trim()
                                                .isNotEmpty &&
                                            profileDetailsController
                                                    .member?.data?.matriID !=
                                                null) {
                                          await APIs.addChatUser(
                                                  profileDetailsController
                                                      .member?.data?.matriID!)
                                              .then((value) {
                                            if (!value) {
                                              Dialogs.showSnackbar(context,
                                                  'User does not Exists!');
                                            } else {
                                              APIs.fetchUser(
                                                context,
                                                profileDetailsController
                                                    .member!.data!.matriID
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
                                      //   directChatController.isLoading.value = false;
                                    },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.primaryColor,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.message_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('CHAT NOW'),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: profileDetailsController
                                          .member?.data?.chatStatus ==
                                      1
                                  ? ElevatedButton(
                                      onPressed: blockController.isLoading.value
                                          ? null
                                          : () async {
                                              blockController.isLoading.value =
                                                  true;

                                              blockController.block(
                                                context,
                                                profileDetailsController
                                                    .member?.data?.matriID,
                                                btnOkOnPress: () => {
                                                  APIs.blockUser(
                                                      profileDetailsController
                                                          .member
                                                          ?.data
                                                          ?.matriID),
                                                  homeController
                                                      .dashboard(context),
                                                  if (keys == "near_by_list" ||
                                                      keys ==
                                                          "education_list" ||
                                                      keys ==
                                                          "profession_list" ||
                                                      keys ==
                                                          "recently_joined" ||
                                                      keys ==
                                                          "intrested_in_you" ||
                                                      keys ==
                                                          "daily_recommendation" ||
                                                      keys == "matches")
                                                    {
                                                      matchesController.reset(
                                                          context, keys)
                                                    },
                                                  if (keys == "search")
                                                    {
                                                      searchController.reset(
                                                          context,
                                                          name,
                                                          profession,
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
                                                          education,
                                                          profilePer,
                                                          sort)
                                                    },
                                                  Navigator.of(context).pop()
                                                },
                                              );
                                            },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xff583789),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.block_outlined),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("BLOCK"),
                                        ],
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: sentInvitationController
                                              .isLoading.value
                                          ? null
                                          : () async {
                                              sentInvitationController
                                                  .isLoading.value = true;

                                              sentInvitationController
                                                  .sentInvitation(
                                                context,
                                                profileDetailsController
                                                    .member?.data?.matriID,
                                                btnOkOnPress: () => {
                                                  homeController
                                                      .dashboard(context),
                                                  if (keys == "near_by_list" ||
                                                      keys ==
                                                          "education_list" ||
                                                      keys ==
                                                          "profession_list" ||
                                                      keys ==
                                                          "recently_joined" ||
                                                      keys ==
                                                          "intrested_in_you" ||
                                                      keys ==
                                                          "daily_recommendation" ||
                                                      keys == "matches")
                                                    {
                                                      matchesController.reset(
                                                          context, keys)
                                                    },
                                                  if (keys == "search")
                                                    {
                                                      searchController.reset(
                                                          context,
                                                          name,
                                                          profession,
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
                                                          education,
                                                          profilePer,
                                                          sort)
                                                    }
                                                },
                                              );

                                              // sentInvitationController.isLoading.value=false;
                                            },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            const Color(0xff583789),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/images/icons/interest.svg"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text('SEND INTEREST'),
                                        ],
                                      ),
                                    )),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            if (profileDetailsController.member?.previous != null)
              Positioned(
                top: 0,
                bottom: SizeConfig.screenHeight * 0.25,
                left: 0,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => {
                        profileDetailsController.profileDetails(
                            context,
                            profileDetailsController.member?.previous ?? "",
                            type,
                            "", [
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
                        ])
                      },
                      child: Container(
                        width: 30,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(2, 2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Icon(Icons.arrow_back_ios),
                      ),
                    )),
              ),
            if (profileDetailsController.member?.next != null)
              Positioned(
                top: 0,
                bottom: SizeConfig.screenHeight *
                    0.25, // Adjust this value as needed
                right: 0,
                child: Align(
                  alignment: Alignment
                      .centerRight, // Ensure the container is aligned properly
                  child: GestureDetector(
                    onTap: () => {
                      profileDetailsController.profileDetails(
                          context,
                          profileDetailsController.member?.next ?? "",
                          type,
                          "", [
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
                      ])
                    },
                    child: Container(
                      width: 30,
                      height: 60,
                      padding: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(2, 2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      alignment: Alignment
                          .centerRight, // Center the arrow inside the container
                      child: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                ),
              ),
            if (sentInvitationController.isLoading.value ||
                profileDetailsController.isLoading.value ||
                shortlistController.isLoading.value ||
                directChatController.isLoading.value ||
                blockController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
// end main page =================================================================================================================




