import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/logout.dart';
import 'package:devotee/controller/dashboard_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/pages/dashboard/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedText = "";
  int selectedIndex = -1;

  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final DashboardController dashboardController =
      Get.put(DashboardController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      editProfileController.userDetails(context);
      dashboardController.dashboard(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.primaryLight,
      body: Obx(() {
        return Stack(
          children: [
            Stack(children: [
              Container(
                  margin: EdgeInsets.only(top: 130),
                  width: double.infinity,
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/images/background.png")),
              SafeArea(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        height: 130,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18),
                                bottomRight: Radius.circular(18))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: GestureDetector(
                                  onTap: () =>
                                      {_scaffoldKey.currentState?.openDrawer()},
                                  child: SvgPicture.asset(
                                      "assets/images/menu.svg")),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: SvgPicture.asset(
                                "assets/images/icons/music.svg",
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Dashboard",
                              style: FontConstant.styleSemiBold(
                                  fontSize: 18, color: AppColors.constColor),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {Get.toNamed('/search')},
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 5, top: 5, left: 10),
                                child: SvgPicture.asset(
                                    "assets/images/searchd.svg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 5, right: 15),
                              child: SvgPicture.asset(
                                  "assets/images/notification.svg"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 95, left: 15, right: 15),
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.constColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (dashboardController.isLoading.value ==
                                    false)
                                  Text(
                                    "${dashboardController.member!.responseData!.receivedInvitation}",
                                    style: FontConstant.styleRegular(
                                        fontSize: 22,
                                        color: AppColors.primaryColor),
                                  ),
                                if (dashboardController.isLoading.value)
                                  Text(
                                    "",
                                    style: FontConstant.styleRegular(
                                        fontSize: 22,
                                        color: AppColors.primaryColor),
                                  ),
                                Text(
                                  "   Requests  ",
                                  style: FontConstant.styleRegular(
                                      fontSize: 14, color: AppColors.black),
                                )
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "10",
                                  style: FontConstant.styleRegular(
                                      fontSize: 22,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "   Messages   ",
                                  style: FontConstant.styleRegular(
                                      fontSize: 14, color: AppColors.black),
                                )
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "50",
                                  style: FontConstant.styleRegular(
                                      fontSize: 22,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "Notifications",
                                  style: FontConstant.styleRegular(
                                      fontSize: 14, color: AppColors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                    if (dashboardController.isLoading.value == false &&
                        editProfileController.isLoading.value == false)
                      Expanded(
                        child: RefreshIndicator(
                          color: AppColors.primaryColor,
                          onRefresh: () async {},
                          child: Container(child: Obx(() {
                            return Stack(children: [
                              SingleChildScrollView(
                                child: Stack(children: [HomeBody()]),
                              ),
                              if (shortlistController.isLoading.value ||
                                  sentInvitationController.isLoading.value)
                                Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                )
                            ]);
                          })),
                        ),
                      ),
                    if (dashboardController.isLoading.value ||
                        editProfileController.isLoading.value)
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ]),
          ],
        );
      }),
      drawer: Drawer(
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
                                      : Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.grey),
                                          child: ClipOval(
                                              child: Image.network(
                                            "${editProfileController.member!.member!.photo1 != null ? "http://devoteematrimony.aks.5g.in/${editProfileController.member!.member!.photo1}" : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg"}",
                                            fit: BoxFit.cover,
                                          )),
                                        ),
                                  Container(
                                    width: 70.0,
                                    height: 70.0,
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.primaryColor),
                                        child: SvgPicture.asset(
                                            "assets/images/edit_icon.svg")),
                                  )
                                ]),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      editProfileController.member == null
                                          ? SizedBox()
                                          : Text(
                                              "${editProfileController.member!.member!.name} ${editProfileController.member!.member!.surename} ",
                                              overflow: TextOverflow.ellipsis,
                                              style: FontConstant.styleMedium(
                                                  fontSize: 15,
                                                  color: AppColors.constColor),
                                            ),
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
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 4, right: 4),
                                            height: 15,
                                            width: 1,
                                            color: AppColors.grey,
                                          ),
                                          Image.asset(
                                              "assets/images/Crown.png"),
                                          Text(
                                            "Platanium",
                                            overflow: TextOverflow.ellipsis,
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.constColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                //  Spacer(),
                                GestureDetector(
                                    onTap: () => {
                                          _scaffoldKey.currentState
                                              ?.closeDrawer()
                                        },
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
                                            value: 0.6,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 15,
                                          padding: EdgeInsets.only(
                                              left: 15, right: 5),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Profile Status - 80%",
                                            style: FontConstant.styleRegular(
                                                fontSize: 10,
                                                color: AppColors.constColor),
                                          ))
                                    ]),
                                  ),
                                  SvgPicture.asset(
                                      "assets/images/edit_icon.svg")
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
                      onTap: () => {_scaffoldKey.currentState?.closeDrawer()},
                      child: buildoption("assets/images/icons/dashboard.svg",
                          "Dashboard", 22, 22),
                    ),
                    GestureDetector(
                      onTap: () => {Get.toNamed("/editProfile")},
                      child: buildoption("assets/images/profile_icon.svg",
                          "My Profile", 22, 22),
                    ),
                    buildoption("assets/images/icons/mypackage.svg",
                        "My Packages", 22, 22),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 6),
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
                        onTap: () => {Get.toNamed("/inbox")},
                        child: buildoption(
                            "assets/images/icons/inbox.svg", "Inbox", 18, 18)),
                    buildoption(
                        "assets/images/icons/chats.svg", "Chat", 18, 18),
                    GestureDetector(
                      onTap: () => {Get.toNamed("/shortlistProfile")},
                      child: buildoption("assets/images/icons/shortlist.svg",
                          "My Shortlist Profiles", 22, 22),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Options & Settings",
                        style: FontConstant.styleRegular(
                            fontSize: 18, color: AppColors.constColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {Get.toNamed("/partner")},
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
                              child:
                                  expansionOption("Suggestion from Our Side")),
                          GestureDetector(
                              onTap: () => {Get.toNamed("/socialMedia")},
                              child:
                                  expansionOption("Our Social Media Handles")),
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
                                      fontSize: 15,
                                      color: AppColors.constColor),
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
                          "Spiritual Wisdom", 22, 22),
                    ),
                    GestureDetector(
                      onTap: () => {Get.toNamed("/recommended")},
                      child: buildoption("assets/images/icons/recomm.svg",
                          "Recommended by Senoir Devotees", 22, 22),
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
                    buildoption("assets/images/icons/refferal.svg",
                        "Referral and Reward Scheme", 22, 22),
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
                                      fontSize: 15,
                                      color: AppColors.constColor),
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
                    buildoption("assets/images/icons/share.svg",
                        "Share Application to others", 22, 22),
                    buildoption("assets/images/icons/setting.svg",
                        "Account Setting", 22, 22),
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
