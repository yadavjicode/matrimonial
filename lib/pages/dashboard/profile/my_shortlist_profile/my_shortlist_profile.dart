import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/constants/widget/custom_drawer.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/controller/shortlisted_list_controller.dart';
import 'package:devotee/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants/widget/dialog.dart';
import '../../../../utils/comman_class_method.dart';

class MyShorlistProfile extends StatefulWidget {
  const MyShorlistProfile({super.key});

  @override
  State<MyShorlistProfile> createState() => _MyShorlistProfileState();
}

class _MyShorlistProfileState extends State<MyShorlistProfile> {
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      shortlistedListController.shortlisted(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/menu.svg"),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
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
              shortlistedContent(),
              if (shortlistedListController.isLoading.value ||
                  shortlistController.isLoading.value ||
                  profileDetailsController.isLoading.value ||
                  directChatController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        })
      ]),
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
    );
  }

  Widget shortlistedContent() {
    final member = shortlistedListController.member;

    if (member == null ||
        member.responseData == null ||
        member.responseData!.data == null) {
      return Center(
          child: Text("No data available",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    }

    if (shortlistedListController.member!.responseData!.data!.isEmpty) {
      return Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 2,
              left: SizeConfig.blockSizeHorizontal * 4,
              right: SizeConfig.blockSizeHorizontal * 4),
          color: AppColors.constColor,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return Padding(
        padding: EdgeInsets.only(
            // top: SizeConfig.blockSizeVertical * 2,
            left: SizeConfig.blockSizeHorizontal * 4,
            right: SizeConfig.blockSizeHorizontal * 4),
        child: Container(
          height: double.infinity,
          color: AppColors.constColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: shortlistedListController
                      .member!.responseData!.data!
                      .map((data) {
                    String name = "${data.name ?? ""} ${data.surename ?? ""}";
                    String date = CommanClass.dateFormat(data.createdAt);
                    String Id = data.matId ?? "";
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
                    List<String?> info = [
                      haString,
                      eoString,
                      crString,
                      scString
                    ];
                    String infos = CommanClass.hyphenString(info);

                    String gender = CommanClass.hisHer(data.gender);

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
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2,
                                    vertical: SizeConfig.blockSizeVertical * 1),
                                child: GestureDetector(
                                  onTap: () {
                                    if (userProfileController
                                            .member?.member?.accountType ==
                                        1) {
                                      profileDetailsController.profileDetails(
                                          context,
                                          data.matId!,
                                          "short_list_profile",
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
                                    } else {
                                      DialogConstant.packageDialog(
                                          context, 'view profile feature');
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            SizeConfig.blockSizeVertical * 0.2),
                                    child: ProfileImage(
                                      size: SizeConfig.screenWidth * 0.2,
                                      url: image,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      top: SizeConfig.blockSizeVertical * 1,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("ID: $Id",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey)),
                                          SizedBox(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              "Shortlist On: $date",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        name,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontConstant.styleSemiBold(
                                            fontSize: 13,
                                            color: AppColors.primaryColor),
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (userProfileController
                                  .member!.member!.accountType !=
                              1)
                            GestureDetector(
                              onTap: () => {Get.toNamed("/membership")},
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 1,
                                    vertical:
                                        SizeConfig.blockSizeVertical * 0.3),
                                margin: EdgeInsets.only(
                                    left: SizeConfig.blockSizeHorizontal * 2,
                                    right: SizeConfig.blockSizeHorizontal * 2,
                                    bottom: SizeConfig.blockSizeVertical * 1),
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Text(
                                  "Upgrade now to connect with the user",
                                  textAlign: TextAlign.right,
                                  style: FontConstant.styleMedium(
                                      fontSize: SizeConfig.textSize * 0.033,
                                      color: AppColors.black),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockSizeHorizontal * 2.5,
                                right: SizeConfig.blockSizeHorizontal * 2.5,
                                bottom: SizeConfig.blockSizeVertical * 1),
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
                                          width:
                                              SizeConfig.blockSizeHorizontal *
                                                  1.5,
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
                                        width: SizeConfig.blockSizeHorizontal *
                                            1.5,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (userProfileController.member
                                                    ?.member?.accountType ==
                                                1) {
                                              if (data.chat_status == 1) {
                                                if (data.matId!
                                                        .trim()
                                                        .isNotEmpty &&
                                                    data.matId != null) {
                                                  await APIs.addChatUser(
                                                          data.matId!)
                                                      .then((value) {
                                                    if (!value) {
                                                      Dialogs.showSnackbar(
                                                          context,
                                                          'User does not Exists!');
                                                    } else {
                                                      APIs.fetchUser(
                                                        context,
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
                                        width: SizeConfig.blockSizeHorizontal *
                                            1.5,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (userProfileController.member
                                                    ?.member?.accountType ==
                                                1) {
                                              profileDetailsController
                                                  .profileDetails(
                                                      context,
                                                      data.matId!,
                                                      "short_list_profile",
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
                                            } else {
                                              DialogConstant.packageDialog(
                                                  context,
                                                  'view profile feature');
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
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
