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
            Container(
              child:Obx(() {

          return 
          
          TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                labelPadding: EdgeInsets.only(bottom: 10),
                unselectedLabelColor: Colors.black,
                tabs: [
               //   if (inboxSentController.isLoading.value == false)
                  Text(
                    "Pending (${(inboxSentController.isLoading.value == false)?inboxSentController.member!.pendingSentInvitationCount:inboxSentController.member!.pendingSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                  //  if (inboxSentController.isLoading.value == false)
                  Text(
                    "Accepted (${(inboxSentController.isLoading.value == false)?inboxSentController.member!.acceptedSentInvitationCount:inboxSentController.member!.acceptedSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
              //     if (inboxSentController.isLoading.value == false)
                  Text(
                    "Declined (${(inboxSentController.isLoading.value == false)?inboxSentController.member!.declinedSentInvitationCount:inboxSentController.member!.declinedSentInvitationCount})",
                    style: TextStyle(fontSize: 16),
                  ),
                //    if (inboxSentController.isLoading.value)
                // Center(
                //   child: CircularProgressIndicator(
                //     color: AppColors.primaryColor,
                //   ),
                // ),
                ],
              );
              }
              )
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
