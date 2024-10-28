import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/chat/widgets/last_online.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/home_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants/widget/dialog.dart';
import '../../../../constants/widget/profile_image.dart';
import '../../../../utils/comman_class_method.dart';

class DesiredPartner extends StatefulWidget {
  const DesiredPartner({super.key});

  @override
  State<DesiredPartner> createState() => _DesiredPartnerState();
}

class _DesiredPartnerState extends State<DesiredPartner> {
  String selectedText = "";
  int selectedIndex = -1;
  final MatchesController matchesController = Get.put(MatchesController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final HomeController homeController = Get.put(HomeController());
  final ScrollController _scrollController = ScrollController();
  final DirectChatController directChatController =
      Get.put(DirectChatController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchesController.reset(context, "matches");
      matchesController.fetchMatches(context, "matches");
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !matchesController.isLoading.value &&
          matchesController.hasMore.value) {
        matchesController.loadNextPage(context, "matches");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      onRefresh: () async {
        matchesController.reset(context, "matches");
        matchesController.fetchMatches(context, "matches");
      },
      child: Obx(() {
        return Stack(
          children: [
            allMatchesContent(),
            if (shortlistController.isLoading.value ||
                sentInvitationController.isLoading.value ||
                profileDetailsController.isLoading.value ||
                directChatController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget allMatchesContent() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    if (matchesController.isLoading.value == false &&
        matchesController.matches.isEmpty) {
      return Center(
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(children: [
          ...matchesController.matches.map((data) {
            String name = "${data.name ?? ""} ${data.surename ?? ""}";
            List<String?> haList = [
              data.age != null ? "${data.age} Yrs" : null,
              data.height,
            ];
            String id = data.matriID ?? "";
            String haString = CommanClass.commaString(haList);
            List<String?> eoList = [data.occupation, data.education];
            String eoString = CommanClass.hyphenString(eoList);
            List<String?> rcList = [data.caste, data.religion];
            String rcString = CommanClass.commaString(rcList);
            List<String?> scList = [data.state, data.country];
            String scString = CommanClass.commaString(scList);
            List<String?> infoList = [rcString, scString];
            String infos = CommanClass.hyphenString(infoList);
            String image = CommanClass.photo(data.photo1, data.gender);

            return Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              decoration: BoxDecoration(
                color: AppColors.constColor,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                        child: Stack(children: [
                          GestureDetector(
                            onTap: () {
                              if (userProfileController
                                      .member?.member?.accountType ==
                                  1) {
                                profileDetailsController.profileDetails(
                                    context, id, "Matches", "matches", [
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
                            child: ProfileImageSquare(
                              size: screenWidth * 0.4,
                              url: image,
                            ),
                          ),
                          Positioned(
                              top: ((screenWidth * 0.4) * (5 / 4) -
                                  screenWidth * 0.075),
                              left: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  setState(() {
                                    data.interestStatus =
                                        data.interestStatus == 0 ? 1 : 1;
                                  });

                                  sentInvitationController.sentInvitation(
                                    context,
                                    data.matriID!,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    data.interestStatus == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            height: screenWidth * 0.06,
                                            width: screenWidth * 0.06,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green),
                                            child: SvgPicture.asset(
                                              "assets/images/icons/correct.svg",
                                              height: screenWidth * 0.028,
                                              width: screenWidth * 0.028,
                                            ),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            height: screenWidth * 0.06,
                                            width: screenWidth * 0.06,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: SvgPicture.asset(
                                              "assets/images/icons/pinkcorrect.svg",
                                              height: screenWidth * 0.028,
                                              width: screenWidth * 0.028,
                                            ),
                                          ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      data.interestStatus == 1
                                          ? "Sent Interest"
                                          : "Send Interest",
                                      style: FontConstant.styleMedium(
                                          fontSize: screenWidth * 0.03,
                                          color: AppColors.constColor),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: FontConstant.styleSemiBold(
                                    fontSize: 15,
                                    color: AppColors.primaryColor),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "ID: $id",
                                      style: FontConstant.styleMedium(
                                          fontSize: 13, color: AppColors.black),
                                    ),
                                  ),
                                  if (data.accountType == 1)
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 1,
                                      height: 12,
                                      color: AppColors.grey,
                                    ),
                                  if (data.accountType == 1)
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
                                                style: FontConstant.styleMedium(
                                                    fontSize: 12,
                                                    color: Color(0xFFF69506)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ],
                              ),
                              if (userProfileController
                                      .member?.member?.accountType ==
                                  1)
                                UserStatusWidget(
                                    userId: id,
                                    onlineStatus: data.hideOnlineStatus ?? 0,
                                    lastSeenStatus:
                                        data.hideLastActiveStatus ?? 0),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 3, bottom: 3),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              Text(
                                eoString,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Text(
                                haString,
                                overflow: TextOverflow.ellipsis,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text("Created By: Myself",
                                    style: FontConstant.styleMedium(
                                        fontSize: 13,
                                        color: AppColors.darkgrey)),
                              ),
                              Text(
                                infos,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                data.shortlistStatus =
                                    data.shortlistStatus == 1 ? 0 : 1;
                              });
                              shortlistController.shortlist(
                                context,
                                id,
                                btnOkOnPress: () =>
                                    {homeController.dashboard(context)},
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  data.shortlistStatus == 1
                                      ? (Icons.favorite)
                                      : Icons.favorite_border_rounded,
                                  color: data.shortlistStatus == 1
                                      ? Colors.red
                                      : AppColors.primaryColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "Shortlist",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              if (userProfileController
                                      .member?.member?.accountType ==
                                  1) {
                                if (data.chatStatus == 1) {
                                  if (data.matriID!.trim().isNotEmpty &&
                                      data.matriID != null) {
                                    await APIs.addChatUser(data.matriID!)
                                        .then((value) {
                                      if (!value) {
                                        Dialogs.showSnackbar(
                                            context, 'User does not Exists!');
                                      } else {
                                        APIs.fetchUser(
                                          context,
                                          data.matriID.toString().trim(),
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
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "Chat Now",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (userProfileController
                                      .member?.member?.accountType ==
                                  1) {
                                profileDetailsController.profileDetails(
                                    context, id, "Matches", "matches", [
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
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/pink_search.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "View Profile",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
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
            );
          }).toList(),
          if (matchesController
              .isLoading.value) // Progress indicator at the bottom
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
        ]),
      );
    }
  }
}
