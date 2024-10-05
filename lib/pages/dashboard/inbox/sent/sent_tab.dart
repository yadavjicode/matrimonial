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
                  //   if (inboxSentController.isLoading.value == false)
                  Text(
                    "Pending (${(inboxSentController.isLoading.value == false) ? inboxSentController.member?.pendingSentInvitationCount ?? 0 : inboxSentController.member?.pendingSentInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                  //  if (inboxSentController.isLoading.value == false)
                  Text(
                    "Accepted (${(inboxSentController.isLoading.value == false) ? inboxSentController.member?.acceptedSentInvitationCount ?? 0 : inboxSentController.member?.acceptedSentInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                  //     if (inboxSentController.isLoading.value == false)
                  Text(
                    "Declined (${(inboxSentController.isLoading.value == false) ? inboxSentController.member?.declinedSentInvitationCount ?? 0 : inboxSentController.member?.declinedSentInvitationCount ?? 0})",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            }),
            const Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [SentPending(), SentAccepted(), SentDeclined()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
