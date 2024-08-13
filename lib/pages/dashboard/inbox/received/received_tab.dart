import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/inbox_received_controller.dart';

import 'package:devotee/pages/dashboard/inbox/received/received_accepted.dart';
import 'package:devotee/pages/dashboard/inbox/received/received_declined.dart';
import 'package:devotee/pages/dashboard/inbox/received/received_pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivedTab extends StatefulWidget {
  const ReceivedTab({super.key});

  @override
  State<ReceivedTab> createState() => _ReceivedTabState();
}

class _ReceivedTabState extends State<ReceivedTab> {
  InboxReceivedController inboxReceivedController =
      Get.put(InboxReceivedController());
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
                    "Pending (${inboxReceivedController.member!.pendingInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Accepted (${inboxReceivedController.member!.acceptedInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Declined (${inboxReceivedController.member!.declinedInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ReceivedPending(),
                  ReceivedAccepted(),
                  ReceivedDeclined()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
