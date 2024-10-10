import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/account_setting_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/widget/dialog.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final AccountSettingController accountSettingController =
      Get.put(AccountSettingController());

  int them = 0;
  bool? onlineStatus;
  bool? lastActiveStatus;
  bool? phoneStatus;
  bool? emailStatus;
  bool? profileStatus;
  bool? astroStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onlineStatus =
          userProfileController.member?.member?.hideOnlineStatus == 1;
      lastActiveStatus =
          userProfileController.member?.member?.hideLastActiveStatus == 1;
      phoneStatus = userProfileController.member?.member?.hidePhoneStatus == 1;
      emailStatus = userProfileController.member?.member?.hideEmailStatus == 1;
      profileStatus =
          userProfileController.member?.member?.hideProfileStatus == 1;
      astroStatus = userProfileController.member?.member?.hideAstroStatus == 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Account Setting",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
        ),
        body: Obx(() {
          return Stack(
            children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/bg3.png")),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.035,
                    vertical: screenHeight * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header("Contact Privacy"),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      if (userProfileController.member?.member?.mobile != null)
                        GestureDetector(
                            onTap: () => {
                                  if (userProfileController
                                          .member?.member?.accountType ==
                                      1)
                                    {
                                      _phoneBottomSheet(context),
                                    }
                                  else
                                    {
                                      DialogConstant.packageDialog(
                                          context, 'account setting feature')
                                    }
                                },
                            child: settingTab(
                                userProfileController.member?.member?.mobile ??
                                    "",
                                userProfileController
                                            .member?.member?.hidePhoneStatus ==
                                        1
                                    ? "Hide Phone No."
                                    : "Show Phone No.",
                                "")),
                      if (userProfileController.member?.member?.confirmEmail !=
                          null)
                        GestureDetector(
                          onTap: () => {
                            if (userProfileController
                                    .member?.member?.accountType ==
                                1)
                              {
                                _emailBottomSheet(context),
                              }
                            else
                              {
                                DialogConstant.packageDialog(
                                    context, 'account setting feature')
                              }
                          },
                          child: settingTab(
                              userProfileController
                                      .member?.member?.confirmEmail ??
                                  "",
                              userProfileController
                                          .member?.member?.hideEmailStatus ==
                                      1
                                  ? "Hide Email ID"
                                  : "Show Email ID",
                              ""),
                        ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      header("Account Privacy"),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      GestureDetector(
                          onTap: () => {
                                if (userProfileController
                                        .member?.member?.accountType ==
                                    1)
                                  {
                                    _lastLoginBottomSheet(context),
                                  }
                                else
                                  {
                                    DialogConstant.packageDialog(
                                        context, 'account setting feature')
                                  }
                              },
                          child: settingTab(
                              "Manage Last Active",
                              userProfileController.member?.member
                                          ?.hideLastActiveStatus ==
                                      1
                                  ? "Hide last active"
                                  : "Show last active",
                              "")),
                      GestureDetector(
                        onTap: () => {
                          if (userProfileController
                                  .member?.member?.accountType ==
                              1)
                            {
                              _onlineStatusBottomSheet(context),
                            }
                          else
                            {
                              DialogConstant.packageDialog(
                                  context, 'account setting feature')
                            }
                        },
                        child: settingTab(
                            "Manage Online Status",
                            userProfileController
                                        .member?.member?.hideOnlineStatus ==
                                    1
                                ? "Hide Online"
                                : "Show Online",
                            ""),
                      ),
                      GestureDetector(
                        onTap: () => {
                          if (userProfileController
                                  .member?.member?.accountType ==
                              1)
                            {
                              _profileBottomSheet(context),
                            }
                          else
                            {
                              DialogConstant.packageDialog(
                                  context, 'account setting feature')
                            }
                        },
                        child: settingTab(
                            "Manage Profile Visibility",
                            userProfileController
                                        .member?.member?.hideProfileStatus ==
                                    1
                                ? "Hide Profile"
                                : "Show Profile",
                            ""),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      header("More Info Privacy"),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      GestureDetector(
                        onTap: () => {
                          if (userProfileController
                                  .member?.member?.accountType ==
                              1)
                            {
                              _astroBottomSheet(context),
                            }
                          else
                            {
                              DialogConstant.packageDialog(
                                  context, 'account setting feature')
                            }
                        },
                        child: settingTab(
                            "Manage Astro Details",
                            userProfileController
                                        .member?.member?.hideAstroStatus ==
                                    1
                                ? "Hide Astro details"
                                : "Show Astro details",
                            ""),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      // header("App setting"),
                      // SizedBox(
                      //   height: screenHeight * 0.005,
                      // ),
                      // GestureDetector(
                      //   onTap: () =>{
                      //     if (userProfileController
                      //               .member?.member?.accountType ==
                      //           1)
                      //         {
                      //          _appThemeBottomSheet(context),
                      //         }
                      //       else
                      //         {
                      //           Dialogs.showSnackbarPack(
                      //               context, 'account setting feature')
                      //         }
                      //   } ,
                      //   child: settingTab(
                      //       "Theme",
                      //       "Choose how your Devotee Matrimony experience looks for this device.",
                      //       ""),
                      // ),
                    ],
                  ),
                ),
              ),
              if (userProfileController.isLoading.value ||
                  accountSettingController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }

  Widget header(String tittle) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return Text(
      tittle,
      style: FontConstant.styleSemiBold(
          fontSize: screenWidth * 0.045 * fontsize,
          color: AppColors.primaryColor),
    );
  }

  Widget settingTab(String tittle, String value, String move) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  // color: AppColors.constColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tittle,
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.038 * fontsize,
                            color: AppColors.black),
                      ),
                      Text(
                        value,
                        style: FontConstant.styleMedium(
                            fontSize: screenWidth * 0.03 * fontsize,
                            color: AppColors.darkgrey),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenHeight * 0.005,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkgrey,
                size: screenWidth * 0.05,
              )
            ],
          ),
          SizedBox(
            height: screenHeight * 0.005,
          ),
          Container(
            height: 1,
            color: Colors.grey.shade300,
          )
        ],
      ),
    );
  }

// Start LastLogin bottomSheet=======================================================================================================================

  void _lastLoginBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool lastActiveValue = lastActiveStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Manage Last Active"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide last active',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: lastActiveValue,
                      onChanged: (value) {
                        setState(() {
                          lastActiveValue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your last active status.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Closes the bottom sheet
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(context, "hide_last_active",
                                    lastActiveValue == true ? 1 : 0)
                                .then((value) => {
                                      APIs.updateLastActiveStatus(
                                          lastActiveValue == true ? 1 : 0),
                                      lastActiveStatus = lastActiveValue
                                    });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End LastLogin bottomSheet=======================================================================================================================

// Start PhoneNo bottomSheet=======================================================================================================================

  void _phoneBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool phoneValue = phoneStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Phone No. Setting"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide Phone No.',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: phoneValue,
                      onChanged: (value) {
                        setState(() {
                          phoneValue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your phone no.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(context, "hide_phone_status",
                                    phoneValue == true ? 1 : 0)
                                .then((value) => {phoneStatus = phoneValue});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End PhoneNo bottomSheet=======================================================================================================================

// Start Email bottomSheet=======================================================================================================================

  void _emailBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool emailValue = emailStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Email ID Setting"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide Email ID',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: emailValue,
                      onChanged: (value) {
                        setState(() {
                          emailValue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your email id.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(context, "hide_email_status",
                                    emailValue == true ? 1 : 0)
                                .then((value) => {emailStatus = emailValue});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End Email bottomSheet=======================================================================================================================

// Start Astro bottomSheet=======================================================================================================================

  void _astroBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool astroValue = astroStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Manage Astro Details"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide Astro Details',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: astroValue,
                      onChanged: (value) {
                        setState(() {
                          astroValue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your astro details.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Closes the bottom sheet
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(
                                    context,
                                    "hide_astrological_info",
                                    astroValue == true ? 1 : 0)
                                .then((value) => {astroStatus = astroValue});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End Astro bottomSheet=======================================================================================================================

// Start Profile bottomSheet=======================================================================================================================

  void _profileBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool profileValue = profileStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Manage Profile Visibility"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide Profile',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: profileValue,
                      onChanged: (value) {
                        setState(() {
                          profileValue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your profile.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Closes the bottom sheet
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(context, "hide_profile_temp",
                                    profileValue == true ? 1 : 0)
                                .then(
                                    (value) => {profileStatus = profileValue});
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End Profile bottomSheet=======================================================================================================================

// Start Online bottomSheet=======================================================================================================================
  void _onlineStatusBottomSheet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        bool onlinevalue = onlineStatus!;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("Manage Online Status"),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text('Hide Status',
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.04 * fontsize,
                              color: AppColors.black)),
                      value: onlinevalue!,
                      onChanged: (value) {
                        setState(() {
                          onlinevalue = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      inactiveThumbColor: AppColors.primaryColor,
                      inactiveTrackColor: Colors.grey.shade300,
                    ),
                    Text(
                      "When this is turned on, others won't be able to see your online status.",
                      style: FontConstant.styleMedium(
                          fontSize: screenWidth * 0.03 * fontsize,
                          color: AppColors.darkgrey),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Closes the bottom sheet
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Cancel",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            accountSettingController
                                .accountSetting(context, "hide_online_status",
                                    onlinevalue == true ? 1 : 0)
                                .then((value) => {
                                      APIs.updateOnlineStatus(
                                          onlinevalue == true ? 1 : 0),
                                      onlineStatus = onlinevalue
                                    });
                            // Navigator.pop(
                            //     context); // Pass the selected value back
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02,
                                vertical: screenHeight * 0.01),
                            child: Text(
                              "Ok",
                              style: FontConstant.styleMedium(
                                  fontSize: screenWidth * 0.04 * fontsize,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End Online bottomSheet=======================================================================================================================

// Start Theme bottomSheet=======================================================================================================================

  void _appThemeBottomSheet(BuildContext context) async {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double fontsize = MediaQuery.textScaleFactorOf(context);

    // Show modal bottom sheet and wait for the result
    final int? selectedValue = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.03,
                  horizontal: screenWidth * 0.04),
              child: Wrap(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header("App Theme"),
                    Column(
                      children: [
                        buildThemeRadio(1, "Device setting", setState),
                        buildThemeRadio(2, "Dark Mode", setState),
                        buildThemeRadio(3, "Light Mode", setState),
                        Text(
                          "If you choose device setting, this app will use the mode that’s already selected in this device’s setting.",
                          style: FontConstant.styleMedium(
                              fontSize: screenWidth * 0.03 * fontsize,
                              color: AppColors.darkgrey),
                        ),
                        SizedBox(
                          height: screenHeight * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context); // Closes the bottom sheet
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                    vertical: screenHeight * 0.01),
                                child: Text(
                                  "Cancel",
                                  style: FontConstant.styleMedium(
                                      fontSize: screenWidth * 0.04 * fontsize,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(
                                    context); // Pass the selected value back
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.02,
                                    vertical: screenHeight * 0.01),
                                child: Text(
                                  "Ok",
                                  style: FontConstant.styleMedium(
                                      fontSize: screenWidth * 0.04 * fontsize,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
            );
          },
        );
      },
    );
  }
// End Theme bottomSheet=======================================================================================================================

  Widget buildThemeRadio(int value, String title, StateSetter setState) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontsize = MediaQuery.textScaleFactorOf(context);
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          if (them == value) {
            them = 0; // Unselect if already selected
          } else {
            them = value; // Select the value on double-tap
          }
        });
      },
      child: Row(
        children: [
          Radio(
            activeColor: AppColors.primaryColor,
            value: value,
            groupValue: them,
            onChanged: (int? newValue) {
              setState(() {
                them = newValue!;
              });
            },
          ),
          Expanded(
            child: Text(
              title,
              style: FontConstant.styleMedium(
                  fontSize: screenWidth * 0.035 * fontsize,
                  color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
