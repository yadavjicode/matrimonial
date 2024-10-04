import 'package:badges/badges.dart' as badges;
import 'package:devotee/chat/api/direct_chat_controller.dart';
import 'package:devotee/chat/helper/count_unread_message.dart';
import 'package:devotee/chat/widgets/notificationIcon_count.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/custom_drawer.dart';
import 'package:devotee/controller/dashboard_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/notification_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:devotee/pages/dashboard/home/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/widget/dialog.dart';


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
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final DirectChatController directChatController =
      Get.put(DirectChatController());
  final NotificationController notificationController = Get.find();

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
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
                            GestureDetector(
                              onTap: () => {
                                // {Get.toNamed('/guruscreen')}
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: SvgPicture.asset(
                                  "assets/images/icons/music.svg",
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Dashboard",
                                style: FontConstant.styleSemiBold(
                                    fontSize: 18, color: AppColors.constColor),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () => {
                                if (editProfileController
                                        .member?.member?.accountType ==
                                    1)
                                  {Get.toNamed('/search')}
                                else
                                  {
                                    DialogConstant.packageDialog(
                                        context, 'search feature')
                                  }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 5, top: 5, left: 10),
                                child: SvgPicture.asset(
                                    "assets/images/searchd.svg"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                notificationController.clearNotificationCount();
                              },
                              // child: Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 8, top: 5, right: 15),
                              //   child: SvgPicture.asset(
                              //       "assets/images/notification.svg"),
                              // ),
                              child: Obx(() {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, top: 5, right: 12),
                                  child: badges.Badge(
                                    badgeContent: Text(
                                      '${notificationController.notificationCount}',
                                      style: FontConstant.styleRegular(
                                          fontSize: 12,
                                          color: AppColors.constColor),
                                    ),
                                    child: Icon(
                                      Icons.notification_add_outlined,
                                      color: AppColors.constColor,
                                      size: 27,
                                    ),
                                  ),
                                );
                              }),
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
                                    dashboardController.member != null &&
                                            dashboardController
                                                    .member!.responseData !=
                                                null
                                        ? "${dashboardController.member?.responseData?.receivedInvitation}"
                                        : "0",
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
                                CountUnreadMessage(),
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
                                // Text(
                                //   "0",
                                //   style: FontConstant.styleRegular(
                                //       fontSize: 22,
                                //       color: AppColors.primaryColor),
                                // ),
                                NotificationCount(),
                                Text(
                                  "Notifications",
                                  style: FontConstant.styleRegular(
                                      fontSize: 14, color: AppColors.black),
                                ),
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
                          onRefresh: () async {
                            dashboardController.dashboard(context);
                          },
                          child: Container(child: Obx(() {
                            return Stack(children: [
                              SingleChildScrollView(
                                child: Stack(children: [HomeBody()]),
                              ),
                              if (shortlistController.isLoading.value ||
                                  sentInvitationController.isLoading.value ||
                                  profileDetailsController.isLoading.value ||
                                  directChatController.isLoading.value)
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
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey),
    );
  }
}
