import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/custom_drawer.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/pages/dashboard/inbox/received/received_tab.dart';
import 'package:devotee/pages/dashboard/inbox/sent/sent_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  Color firstContainerColor = Color(0xff583689);
  Color secondContainerColor = AppColors.constColor;
  Color firstTextColor = AppColors.constColor;
  Color secondTextColor = AppColors.black;
  bool showFirstPage = true;
  bool showSecondPage = false;
  InboxSentController inboxSentController = Get.put(InboxSentController());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxSentController.inboxSent(context, "Pending");
    });
    updateTextColors();
  }

  void showFirstPageContent() {
    setState(() {
      showFirstPage = true;
      showSecondPage = false;
      updateTextColors();
    });
  }

  void showSecondPageContent() {
    setState(() {
      showFirstPage = false;
      showSecondPage = true;
      updateTextColors();
    });
  }

  void updateTextColors() {
    if (showFirstPage) {
      firstContainerColor = Color(0xff583689);
      secondContainerColor = AppColors.constColor;
      firstTextColor = AppColors.constColor;
      secondTextColor = AppColors.black;
    } else {
      firstContainerColor = AppColors.constColor;
      secondContainerColor = Color(0xff583689);
      firstTextColor = AppColors.black;
      secondTextColor = AppColors.constColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Inbox",
          style: FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/menu.svg"),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png"),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: showFirstPageContent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: firstContainerColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        width: 125,
                        height: 28,
                        child: Center(
                          child: Text(
                            'Received',
                            style: FontConstant.styleMedium(
                              fontSize: 16,
                              color: firstTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: showSecondPageContent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondContainerColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        width: 125,
                        height: 28,
                        child: Center(
                          child: Text(
                            'Sent',
                            style: FontConstant.styleMedium(
                              fontSize: 16,
                              color: secondTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Visibility(visible: showFirstPage, child: ReceivedTab()),
                    Visibility(
                      visible: showSecondPage,
                      child: SentTab(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(scaffoldKey: scaffoldKey),
    );
  }
}
