import 'package:devotee/constants/widget/dialog.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/logout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class CustomDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  CustomDrawer({super.key, required this.scaffoldKey});
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerbackground,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              //   height: 170,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(
                top: 16,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              child: Obx(() {
                return Stack(
                  children: [
                    if (editProfileController.isLoading.value == false)
                      Column(
                        children: [
                          // Spacer(),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(children: [
                                editProfileController.member == null
                                    ? SizedBox()
                                    : ProfileImage(
                                        size: 71,
                                        url: editProfileController
                                                    .member!.member!.photo1 !=
                                                null
                                            ? "http://devoteematrimony.aks.5g.in/${editProfileController.member!.member!.photo1}"
                                            : editProfileController.member!
                                                        .member!.gender ==
                                                    "Male"
                                                ? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png"
                                                : "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg",
                                      ),
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onTap: () => {Get.toNamed("/profileEdit")},
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryColor),
                                        child: SvgPicture.asset(
                                            "assets/images/edit_icon.svg")),
                                  ),
                                )
                              ]),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    editProfileController.member == null
                                        ? SizedBox()
                                        : Text(
                                            " ${editProfileController.member!.member!.name} ${editProfileController.member!.member!.surename} ",
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleMedium(
                                                fontSize: 15,
                                                color: AppColors.constColor),
                                          ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/Protect.png"),
                                            Text(
                                              "Verified",
                                              overflow: TextOverflow.ellipsis,
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.constColor),
                                            ),
                                          ],
                                        ),
                                        if (editProfileController
                                                .member?.member?.accountType ==
                                            1)
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4, right: 4),
                                            height: 15,
                                            width: 1,
                                            color: AppColors.grey,
                                          ),
                                        if (editProfileController
                                                .member?.member?.accountType ==
                                            1)
                                          Row(
                                            children: [
                                              Image.asset(
                                                  "assets/images/Crown.png"),
                                              Text(
                                                "Premium",
                                                overflow: TextOverflow.ellipsis,
                                                style: FontConstant.styleMedium(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.constColor),
                                              ),
                                            ],
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //  Spacer(),
                              GestureDetector(
                                  onTap: () =>
                                      {scaffoldKey.currentState?.closeDrawer()},
                                  child: Container(
                                      padding: EdgeInsets.all(3),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.constColor),
                                          shape: BoxShape.circle),
                                      child: SvgPicture.asset(
                                          "assets/images/cross.svg"))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      height: 15,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            4.0), // Adjust the radius as needed
                                        child: LinearProgressIndicator(
                                          value: (editProfileController.member
                                                      ?.profilePercentage ??
                                                  0) /
                                              100,
                                          backgroundColor: Colors.grey.shade100,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 15,
                                        padding:
                                            EdgeInsets.only(left: 15, right: 5),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Profile Status - ${editProfileController.member?.profilePercentage ?? ""}%",
                                          style: FontConstant.styleRegular(
                                              fontSize: 10,
                                              color:
                                                  AppColors.drawerbackground),
                                        ))
                                  ]),
                                ),
                                GestureDetector(
                                    onTap: () => {Get.toNamed("/myProfile")},
                                    child: SvgPicture.asset(
                                        "assets/images/edit_icon.svg"))
                              ],
                            ),
                          ),
                        ],
                      ),
                    if (editProfileController.isLoading.value)
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                  ],
                );
              }),
              decoration: BoxDecoration(color: AppColors.drawerbackground),
            ),
            Expanded(
              child: ListView(
                // physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => {scaffoldKey.currentState?.closeDrawer()},
                    child: buildoption("assets/images/icons/dashboard.svg",
                        "Dashboard", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/myProfile")},
                    child: buildoption(
                        "assets/images/profile_icon.svg", "My Profile", 22, 22),
                  ),
                  buildoption("assets/images/icons/mypackage.svg",
                      "My Packages", 22, 22),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/myWallet")},
                    child: buildoption(
                        "assets/images/icons/wallet.svg", "My Wallet", 18, 16),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Discover Your Matches",
                      style: FontConstant.styleRegular(
                          fontSize: 18, color: AppColors.constColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/matches")},
                    child: buildoption(
                        "assets/images/icons/matches.svg", "Matches", 22, 22),
                  ),
                  GestureDetector(
                      onTap: () => {Get.toNamed("/inboxDrawer")},
                      child: buildoption(
                          "assets/images/icons/inbox.svg", "Inbox", 18, 18)),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/chatDrawer")},
                    child: buildoption(
                        "assets/images/icons/chats.svg", "Chat", 18, 18),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/shortlistProfileDrawer")},
                    child: buildoption("assets/images/icons/shortlist.svg",
                        "My Shortlist Profiles", 22, 22),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Options & Settings",
                      style: FontConstant.styleRegular(
                          fontSize: 18, color: AppColors.constColor),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {
                      if (editProfileController.member?.member?.accountType ==
                          1)
                        {Get.toNamed("/editPartnerPreference")}
                      else
                        {
                          DialogConstant.packageDialog(
                              context, 'Partner Preferences feature')
                        }
                    },
                    child: buildoption("assets/images/icons/partner.svg",
                        "Partner Preferences", 22, 22),
                  ),
                  ExpansionTile(
                      tilePadding: EdgeInsets.only(
                        right: 18,
                      ),
                      children: [
                        GestureDetector(
                            onTap: () => {Get.toNamed("/whoAreYou")},
                            child: expansionOption("Who We Are")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/ourMission")},
                            child: expansionOption("Our Mission")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/ourVision")},
                            child: expansionOption("Our Vision")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/requestSide")},
                            child: expansionOption("Request from Our Side")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/suggestionSide")},
                            child: expansionOption("Suggestion from Our Side")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/socialMedia")},
                            child: expansionOption("Our Social Media Handles")),
                      ],
                      title: Container(
                        padding: EdgeInsets.only(left: 18),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/images/icons/about.svg",
                                width: 22, // Set the desired width
                                height: 22, // Set the desired height
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "About Us",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: AppColors.constColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      iconColor: AppColors.constColor,
                      collapsedIconColor: AppColors.constColor),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/spiritualWisdom")},
                    child: buildoption("assets/images/icons/spiritual.svg",
                        "Happy Married Life-Wisdom", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/recommended")},
                    child: buildoption("assets/images/icons/recomm.svg",
                        "Recommendation by Senior Devotees", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/membership")},
                    child: buildoption("assets/images/icons/package.svg",
                        "Package and Coupons", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/offering")},
                    child: buildoption("assets/images/icons/offer.svg",
                        "Offering Your Gratitude", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/referralReward")},
                    child: buildoption("assets/images/icons/refferal.svg",
                        "Referral and Reward Scheme", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/warning")},
                    child: buildoption(
                        "assets/images/icons/warning.svg", "Warning", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/disclaimer")},
                    child: buildoption("assets/images/icons/disclaimer.svg",
                        "Disclaimer", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/website")},
                    child: buildoption(
                        "assets/images/icons/web.svg", "Our Website", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/collaborate")},
                    child: buildoption("assets/images/icons/collaborate.svg",
                        "Collaborate With Us", 22, 22),
                  ),
                  ExpansionTile(
                      tilePadding: EdgeInsets.only(
                        right: 18,
                      ),
                      children: [
                        GestureDetector(
                            onTap: () => {Get.toNamed("/feedback")},
                            child: expansionOption("Feedback")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/suggestion")},
                            child: expansionOption("Suggestion")),
                        GestureDetector(
                            onTap: () => {Get.toNamed("/complaint")},
                            child: expansionOption("Complaint")),
                      ],
                      title: Container(
                        padding: EdgeInsets.only(
                          left: 18,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/images/icons/fsc.svg",
                                width: 22, // Set the desired width
                                height: 22, // Set the desired height
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                "Feedback/Suggestion/Complaint",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: AppColors.constColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      iconColor: AppColors.constColor,
                      collapsedIconColor: AppColors.constColor),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/privacy")},
                    child: buildoption("assets/images/privacy_icon.svg",
                        "Privacy Policy", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/testimonials")},
                    child: buildoption("assets/images/icons/testimonial.svg",
                        "Testimonial", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () {
                      String url = 'https://www.figma.com';
                      Share.share(url, subject: 'Check out this link');
                    },
                    child: buildoption("assets/images/icons/share.svg",
                        "Share Application to others", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {Get.toNamed("/accountSetting")},
                    child: buildoption("assets/images/icons/setting.svg",
                        "Account Setting", 22, 22),
                  ),
                  GestureDetector(
                    onTap: () => {showLogoutConfirmationDialog(context)},
                    child: buildoption(
                        "assets/images/icons/logout.svg", "Logout", 22, 22),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildoption(
    String imagepath, String tittle, double height, double width) {
  return Container(
    color: AppColors.drawerbackground,
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
    child: Row(
      children: [
        Container(
          child: SvgPicture.asset(
            imagepath,
            width: width, // Set the desired width
            height: height, // Set the desired height
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            tittle,
            style: FontConstant.styleRegular(
                fontSize: 15, color: AppColors.constColor),
          ),
        )
      ],
    ),
  );
}

Widget expansionOption(String tittle) {
  return Container(
    color: AppColors.drawerbackground,
    width: double.infinity,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 60, top: 6, bottom: 6, right: 18),
    child: Text(
      tittle,
      style:
          FontConstant.styleRegular(fontSize: 15, color: AppColors.constColor),
    ),
  );
}
