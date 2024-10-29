import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/accepted_controller.dart';
import 'package:devotee/controller/inbox_received_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../constants/widget/dialog.dart';
import '../../../../controller/edit_profile_controller.dart';
import '../../../../controller/profile_details_controller.dart';

class ReceivedDeclined extends StatefulWidget {
  const ReceivedDeclined({super.key});

  @override
  State<ReceivedDeclined> createState() => _ReceivedDeclinedState();
}

class _ReceivedDeclinedState extends State<ReceivedDeclined> {
  InboxReceivedController inboxReceivedController =
      Get.put(InboxReceivedController());
  AcceptedController acceptedController = Get.put(AcceptedController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxReceivedController.inboxSent(context, "Declined");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.constColor,
        body: Obx(() {
          return Stack(
            children: [
              if (inboxReceivedController.isLoading.value == false &&
                  acceptedController.isLoading.value == false)
                declinedContent(),
              if (inboxReceivedController.isLoading.value ||
                  acceptedController.isLoading.value ||
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

  Widget declinedContent() {
    final double screenWidth = MediaQuery.of(context).size.width;

    final member = inboxReceivedController.member;
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
                inboxReceivedController.member!.responseData!.data!.map((data) {
              String name = "${data.name ?? ""} ${data.surename ?? ""}";
              String date = CommanClass.dateFormat(data.updatedAt);
              String mId = data.sentMatriID ?? "";
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
              String gender = CommanClass.hisHer(data.gender);

              
              return GestureDetector(
                onTap: () {
                  // Get.toNamed('/profiledtls');
                },
                child: Container(
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
                                left: 10, top: 10, bottom: 10, right: 2),
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
                                        child: Container(
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            "Sent On: $date",
                                            style: FontConstant.styleMedium(
                                                fontSize: 12,
                                                color: AppColors.darkgrey),
                                          ),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "You Declined $gender Request",
                                style: FontConstant.styleMedium(
                                    fontSize: 12, color: AppColors.darkgrey),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                      height: 26,
                                      width: 26,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                          "assets/images/icons/correct.svg")),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => {
                                        acceptedController.accepted(
                                            context, mId),
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          inboxReceivedController.inboxSent(
                                              context, "Declined");
                                        })
                                      },
                                      child: Text(
                                        "Accept Request Now",
                                        style: FontConstant.styleMedium(
                                            fontSize: 12, color: Colors.green),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}
