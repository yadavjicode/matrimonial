import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../chat/api/apis.dart';
import '../../../../chat/api/direct_chat_controller.dart';
import '../../../../constants/widget/Snackbar.dart';
import '../../../../constants/widget/dialog.dart';

class SentAccepted extends StatefulWidget {
  const SentAccepted({super.key});

  @override
  State<SentAccepted> createState() => _SentAcceptedState();
}

class _SentAcceptedState extends State<SentAccepted> {
  InboxSentController inboxSentController = Get.put(InboxSentController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final DirectChatController directChatController =
      Get.put(DirectChatController());
//
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxSentController.inboxSent(context, "Accepted");
    });
    super.initState();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.constColor,
        body: Obx(() {
          return Stack(
            children: [
              if (inboxSentController.isLoading.value == false)
                acceptedContent(),
              if (inboxSentController.isLoading.value ||
                  profileDetailsController.isLoading.value ||
                  directChatController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }

  Widget acceptedContent() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final member = inboxSentController.member;
    if (member == null ||
        member.responseData == null ||
        member.responseData!.data == null) {
      return Center(
          child: Text("No data available",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    }
    if (member.responseData!.data!.isEmpty) {
      return Center(
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children:
                inboxSentController.member!.responseData!.data!.map((data) {
              String name = "${data.name ?? ""} ${data.surename ?? ""}";
              String date = CommanClass.dateFormat(data.updatedAt);
              String mId = data.receicedMatriID ?? "";
              String image = CommanClass.photo(data.photo1, data.gender);
              List<String?> haList = [
                data.age != null ? "${data.age} Yrs" : null,
                data.height,
                data.maritalstatus
              ];
              String haString = CommanClass.commaString(haList);
              List<String?> eoList = [data.occupation];
              String eoString = CommanClass.commaString(eoList);
              List<String?> crList = [data.caste, data.religion];
              String crString = CommanClass.commaString(crList);
              List<String?> scList = [data.state, data.country];
              String scString = CommanClass.commaString(scList);
              List<String?> info = [haString, eoString, crString, scString];
              String infos = CommanClass.hyphenString(info);

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 8, bottom: 10, right: 2),
                          child: GestureDetector(
                            onTap: () {
                              if (userProfileController
                                      .member?.member?.accountType ==
                                  1) {
                                profileDetailsController.profileDetails(
                                    context, mId, "Matches", "", [
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ID: $mId",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.darkgrey)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          "Accepted On: $date",
                                          style: FontConstant.styleMedium(
                                              fontSize: 12,
                                              color: AppColors.darkgrey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        name,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontConstant.styleSemiBold(
                                            fontSize: 13,
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: Text(
                                    infos,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: FontConstant.styleMedium(
                                        fontSize: 12,
                                        color: AppColors.darkgrey),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (userProfileController.member
                                                    ?.member?.accountType ==
                                                1) {
                                              if (data.chatStatus == 1) {
                                                if (data.receicedMatriID!
                                                        .trim()
                                                        .isNotEmpty &&
                                                    data.receicedMatriID !=
                                                        null) {
                                                  await APIs.addChatUser(
                                                          data.receicedMatriID!)
                                                      .then((value) {
                                                    if (!value) {
                                                      Dialogs.showSnackbar(
                                                          context,
                                                          'User does not Exists!');
                                                    } else {
                                                      APIs.fetchUser(
                                                        context,
                                                        data.receicedMatriID
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
                                                  style:
                                                      FontConstant.styleMedium(
                                                          fontSize: 11,
                                                          color:
                                                              AppColors.black),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (userProfileController.member
                                                    ?.member?.accountType ==
                                                1) {
                                              profileDetailsController
                                                  .profileDetails(context, mId,
                                                      "Matches", "", [
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
                                                  context,
                                                  'view profile feature');
                                            }
                                          },
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/images/pink_search.svg",
                                                height: 20,
                                                width: 20,
                                              ),
                                              const SizedBox(width: 3),
                                              Text(
                                                "View Profile",
                                                style: FontConstant.styleMedium(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        255, 20, 14, 14)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}
