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
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Obx(() {
              return TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                labelPadding: const EdgeInsets.only(bottom: 10),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Text(
                    "Pending (${(inboxReceivedController.isLoading.value == false) ? inboxReceivedController.member?.pendingInvitationCount ?? 0 : inboxReceivedController.member?.pendingInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Accepted (${(inboxReceivedController.isLoading.value == false) ? inboxReceivedController.member?.acceptedInvitationCount ?? 0 : inboxReceivedController.member?.acceptedInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Declined (${(inboxReceivedController.isLoading.value == false) ? inboxReceivedController.member?.declinedInvitationCount ?? 0 : inboxReceivedController.member?.declinedInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            }),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
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
