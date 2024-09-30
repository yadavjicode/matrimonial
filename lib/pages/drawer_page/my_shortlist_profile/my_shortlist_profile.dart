import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/chat/models/chat_user.dart';
import 'package:devotee/chat/screens/chat_screen.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/controller/shortlisted_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/widget/dialog.dart';

class MyShorlistProfileD extends StatefulWidget {
  const MyShorlistProfileD({super.key});

  @override
  State<MyShorlistProfileD> createState() => _MyShorlistProfileDState();
}

class _MyShorlistProfileDState extends State<MyShorlistProfileD> {
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final ShortlistedListController shortlistedListController =
      Get.put(ShortlistedListController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final DirectChatController directChatController =
      Get.put(DirectChatController());

  Future<void> _fetchUser(String userId) async {
    ChatUser? _chatUser;
    ChatUser? user = await directChatController.getUserById(userId);

    setState(() {
      _chatUser = user;
    });
    if (_chatUser != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(user: _chatUser!),
        ),
      );
    } else {
      Dialogs.showSnackbar(context, 'unable to fetch data');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      shortlistedListController.shortlisted(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "My Shortlisted Profiles",
          style: FontConstant.styleMedium(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Obx(() {
          return Stack(
            children: [
              // if (!shortlistedListController.isLoading.value
              //     // &&
              //     // !shortlistController.isLoading.value
              //     )
              shortlistedContent(),
              if (shortlistedListController.isLoading.value ||
                  shortlistController.isLoading.value ||
                  profileDetailsController.isLoading.value ||
                  directChatController.isLoading.value)
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        })
      ]),
    );
  }

  Widget shortlistedContent() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final member = shortlistedListController.member;
    if (member == null ||
        member.responseData == null ||
        member.responseData!.data == null) {
      return Center(child: Text("No data available"));
    }
    if (shortlistedListController.member!.responseData!.data!.isEmpty) {
      return Container(
          margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
          color: AppColors.constColor,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          height: double.infinity,
          color: AppColors.constColor,
          child: SingleChildScrollView(
            child: Column(
              children: shortlistedListController.member!.responseData!.data!
                  .map((data) {
                String name = "${data.name ?? ""} ${data.surename ?? ""}";
                String id = data.matId;
                String date = DateFormat('dd-MM-yyyy')
                    .format(DateTime.parse(data.createdAt));
                String information =
                    "${data.age == null ? "" : "${data.age} Yrs, "}${data.height == null ? "" : "${data.height}, "}${data.caste == null ? "" : "${data.caste}, "}${data.religion == null ? "" : "${data.religion}, "}${data.maritalstatus == null ? "" : "${data.maritalstatus}, "}${data.occupation == null ? "" : "${data.occupation}, "}${data.state == null ? "" : "${data.state}, "}${data.country == null ? "" : "${data.country}"}";
                String image = data.photo1 != null
                    ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
                    : data.gender == "Male"
                        ? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png"
                        : "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";

                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.constColor,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                if (userProfileController
                                        .member?.member?.accountType ==
                                    1) {
                                  profileDetailsController.profileDetails(
                                      context, data.matId!, "", [
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
                                    "11"
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ID: ${id}",
                                          style: FontConstant.styleMedium(
                                              fontSize: 12,
                                              color: AppColors.darkgrey)),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            "Shortlist On: ${date}",
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
                                      information,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: FontConstant.styleMedium(
                                          fontSize: 12,
                                          color: AppColors.darkgrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (userProfileController.member!.member!.accountType !=
                          1)
                        GestureDetector(
                          onTap: () => {Get.toNamed("/membership")},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(3),
                            margin:
                                EdgeInsets.only(left: 8, right: 8, bottom: 8),
                            decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "To contact her directly,",
                                  style: FontConstant.styleMedium(
                                      fontSize: 12, color: AppColors.black),
                                ),
                                Text(
                                  " Upgrade Now",
                                  style: FontConstant.styleSemiBold(
                                      fontSize: 12,
                                      color: AppColors.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  shortlistController.shortlist(
                                    context,
                                    data.matId!,
                                    btnOkOnPress: () => {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        shortlistedListController
                                            .shortlisted(context);
                                      })
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/icons/remove.svg"),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Remove",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
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
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (userProfileController
                                                .member?.member?.accountType ==
                                            1) {
                                          if (data.chat_status == 1) {
                                            if (data.matId!.trim().isNotEmpty &&
                                                data.matId != null) {
                                              await APIs.addChatUser(
                                                      data.matId!)
                                                  .then((value) {
                                                if (!value) {
                                                  Dialogs.showSnackbar(context,
                                                      'User does not Exists!');
                                                } else {
                                                  _fetchUser(
                                                    data.matId
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
                                      //hide alert dialog

                                      child: Text(
                                        "Chat Now",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
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
                                    child: GestureDetector(
                                      onTap: () {
                                        if (userProfileController
                                                .member?.member?.accountType ==
                                            1) {
                                          profileDetailsController
                                              .profileDetails(
                                                  context, data.matId!, "", [
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
                                            "11"
                                          ]);
                                        } else {
                                          DialogConstant.packageDialog(
                                              context, 'view profile feature');
                                        }
                                      },
                                      child: Text(
                                        "View Profile",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12,
                                            color: AppColors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  }
}
