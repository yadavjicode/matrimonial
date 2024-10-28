import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/controller/withdrawal_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';

import '../../../../constants/widget/dialog.dart';
import '../../../../controller/profile_details_controller.dart';

class SentPending extends StatefulWidget {
  const SentPending({super.key});
  @override
  State<SentPending> createState() => _SentPendingState();
}

class _SentPendingState extends State<SentPending> {
  final InboxSentController inboxSentController =
      Get.put(InboxSentController());
  final WithdrawalController withdrawalController =
      Get.put(WithdrawalController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxSentController.inboxSent(context, "Pending");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.constColor,
        body: Obx(() {
          return Stack(
            children: [
              if (inboxSentController.isLoading.value == false)
                pendingContent(),
              if (inboxSentController.isLoading.value ||
                  profileDetailsController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }

  Widget pendingContent() {
    final double screenWidth = MediaQuery.of(context).size.width;

    final member = inboxSentController.member;
    if (member == null ||
        member.responseData == null ||
        member.responseData!.data == null) {
      return Center(
          child: Text("No data available",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    }
    if (member.responseData!.data!.isEmpty) {
      return Center(
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children:
                  inboxSentController.member!.responseData!.data!.map((data) {
                String name = "${data.name ?? ""} ${data.surename ?? ""}";
                String date = CommanClass.dateFormat(data.updatedAt);
                String mId = data.receicedMatriID ?? "";
                String image = CommanClass.photo(data.photo1, data.gender);
                List<String?> haList = [
                  data.age != null ? "${data.age} Yrs" : null,
                  data.height,
                  data.maritalstatus
                ];
                String haString = CommanClass.commaString(haList);
                List<String?> eoList = [data.occupation];
                String eoString = CommanClass.commaString(eoList);
                List<String?> crList = [data.caste, data.religion];
                String crString = CommanClass.commaString(crList);
                List<String?> scList = [data.state, data.country];
                String scString = CommanClass.commaString(scList);
                List<String?> info = [haString, eoString, crString, scString];
                String infos = CommanClass.hyphenString(info);

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 8, bottom: 10, right: 2),
                            child: GestureDetector(
                              onTap: () {
                                if (userProfileController
                                        .member?.member?.accountType ==
                                    1) {
                                  profileDetailsController.profileDetails(
                                      context, mId, "Matches", "", [
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    "5",
                                    "6",
                                    "7",
                                    "8",
                                    "9",
                                    "10",
                                    "11",
                                    "12",
                                    "13",
                                    "14",
                                    "15"
                                  ]);
                                } else {
                                  DialogConstant.packageDialog(
                                      context, 'view profile feature');
                                }
                              },
                              child: ProfileImage(
                                size: screenWidth * 0.2,
                                url: image,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("ID: $mId",
                                          style: FontConstant.styleMedium(
                                              fontSize: 12,
                                              color: AppColors.darkgrey)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          textAlign: TextAlign.right,
                                          "Sent On: $date",
                                          style: FontConstant.styleMedium(
                                              fontSize: 12,
                                              color: AppColors.darkgrey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          name,
                                          overflow: TextOverflow.ellipsis,
                                          style: FontConstant.styleSemiBold(
                                              fontSize: 13,
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: Text(
                                      infos,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: FontConstant.styleMedium(
                                          fontSize: 12,
                                          color: AppColors.darkgrey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (userProfileController.member!.member!.accountType !=
                          1)
                        GestureDetector(
                          onTap: () => {Get.toNamed("/membership")},
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(3),
                            margin: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 8),
                            decoration: const BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Text(
                              "Upgrade now to connect with the user",
                              style: FontConstant.styleMedium(
                                  fontSize: 12, color: AppColors.black),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => {
                                withdrawalController.withdrawal(
                                  context,
                                  mId,
                                  btnOkOnPress: () => {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      inboxSentController.inboxSent(
                                          context, "Pending");
                                    })
                                  },
                                ),
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 26,
                                    width: 26,
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.delete,
                                      color: AppColors.constColor,
                                    ),
                                    // child: Image.asset(
                                    //     "assets/images/delete.png"),
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Withdrawal",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     Image.asset("assets/images/whatsapp.png"),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text(
                            //       "Whatsapp",
                            //       style: FontConstant.styleMedium(
                            //           fontSize: 12, color: Colors.green),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   children: [
                            //     Image.asset("assets/images/call.png"),
                            //     SizedBox(
                            //       width: 5,
                            //     ),
                            //     Text(
                            //       "Call",
                            //       style: FontConstant.styleMedium(
                            //           fontSize: 12, color: AppColors.purple),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            )),
      );
    }
  }
}
