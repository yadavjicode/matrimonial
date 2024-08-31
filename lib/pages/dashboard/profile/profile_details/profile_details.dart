// ignore_for_file: avoid_unnecessary_containers
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/dashboard_controller.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// start main page =================================================================================================================
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
// end main page =================================================================================================================




