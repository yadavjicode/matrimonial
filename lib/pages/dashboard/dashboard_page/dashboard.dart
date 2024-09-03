import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/chat/screens/home_screen.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/inbox_received_controller.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/pages/dashboard/profile/edit_profile/edit_profile.dart';
import 'package:devotee/pages/dashboard/home/home_page.dart';
import 'package:devotee/pages/dashboard/inbox/inbox.dart';
import 'package:devotee/pages/dashboard/profile/my_shortlist_profile/my_shortlist_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PageController controller = PageController(initialPage: 4);
  var selected = 0;
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final InboxSentController inboxSentController =
      Get.put(InboxSentController());
  final InboxReceivedController inboxReceivedController =
      Get.put(InboxReceivedController());
  final StateController stateController = Get.put(StateController());

  void login() async {
    if (_editProfileController.member!.member!.matriID != null) {
      print("===================================login chat");
      if (await APIs.userExists() && mounted) {
        // ignore: use_build_context_synchronously
        // _editProfileController.userDetails(context);
        // APIs.updateUserImage("http://devoteematrimony.aks.5g.in/${_editProfileController.member!.member!.Photo1}");
      } else {
        // ignore: use_build_context_synchronously
        // _editProfileController.userDetails(context);
        await APIs.createUser().then((value) {});
      }
    } else {}
  }

  @override
  void initState() {
    _editProfileController.userDetails(context).then((value) => login());
    inboxSentController.inboxSent(context, "Pending");
    inboxReceivedController.inboxSent(context, "Pending");
    stateController.fetchStateList();
    //  login();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WillPopScope(
      onWillPop: () async {
        // Show the confirmation dialog
        bool shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit;
      },
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: const [
            Inbox(),
            ProfileEdit(),
            MyShorlistProfile(),
            HomeScreen(),
            Home(),
          ],
        ),
      ),
      bottomNavigationBar: StylishBottomBar(
        notchStyle: NotchStyle.circle,
        backgroundColor: AppColors.primaryColor,
        option: AnimatedBarOptions(
          iconSize: 30,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.Default,
        ),
        items: [
          BottomBarItem(
            icon: Image.asset("assets/images/email.png"),
            title: Text(
              'inbox',
              style:
                  FontConstant.styleSemiBold(fontSize: 0, color: Colors.white),
            ),
            backgroundColor: Colors.white,
            //  selectedIcon: Icon(Icons.chat)
          ),
          BottomBarItem(
            icon: Image.asset("assets/images/users.png"),
            title: Text(
              'Profile',
              style:
                  FontConstant.styleSemiBold(fontSize: 0, color: Colors.white),
            ),
            backgroundColor: Colors.white,
            //  selectedIcon: Icon(Icons.person)
          ),
          BottomBarItem(
            icon: Image.asset("assets/images/love.png"),
            title: Text(
              'Liked',
              style:
                  FontConstant.styleSemiBold(fontSize: 0, color: Colors.white),
            ),
            backgroundColor: Colors.white,
            // selectedIcon: Icon(Icons.favorite)
          ),
          BottomBarItem(
            icon: Image.asset("assets/images/chat.png"),
            title: Text(
              'Search',
              style:
                  FontConstant.styleSemiBold(fontSize: 0, color: Colors.white),
            ),
            // backgroundColor: Colors.white,
          ),
        ],
        fabLocation: StylishBarFabLocation.center,
        hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;

            controller.jumpToPage(index);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            controller.jumpToPage(4);
          });
        },
        backgroundColor: const Color(0xff583689),
        child: const Icon(
          Icons.home_outlined,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
    Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App',),
            content: Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false), // Cancel
                child: Text('Cancel',style: FontConstant.styleSemiBold(
                fontSize: 15, color: AppColors.black),),
              ),
              TextButton(
                onPressed: () =>{
                 APIs.updateActiveStatus(false),
                  Navigator.of(context).pop(true),
                }  ,// Exit
                child: Text('Exit',style: FontConstant.styleSemiBold(
                fontSize: 15, color: AppColors.black),),
              ),
            ],
          ),
        ) ??
        false;
  }
}

