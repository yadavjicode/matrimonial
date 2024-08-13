import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/pages/dashboard/inbox/sent/sent_accepted.dart';
import 'package:devotee/pages/dashboard/inbox/sent/sent_declined.dart';
import 'package:devotee/pages/dashboard/inbox/sent/sent_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SentTab extends StatefulWidget {
  const SentTab({super.key});

  @override
  State<SentTab> createState() => _SentTabState();
}

class _SentTabState extends State<SentTab> {
  final InboxSentController inboxSentController =
      Get.put(InboxSentController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              child: TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                labelPadding: EdgeInsets.only(bottom: 10),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Text(
                    "Pending (${inboxSentController.member!.pendingSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Accepted (${inboxSentController.member!.acceptedSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Declined (${inboxSentController.member!.declinedSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [SentPending(), SentAccepted(), SentDeclined()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
