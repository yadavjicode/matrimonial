import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';

class SentDeclined extends StatefulWidget {
  const SentDeclined({super.key});

  @override
  State<SentDeclined> createState() => _SentDeclinedState();
}

class _SentDeclinedState extends State<SentDeclined> {
  InboxSentController inboxSentController = Get.put(InboxSentController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxSentController.inboxSent(context, "Declined");
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
              if (inboxSentController.isLoading.value == false)
                declineContent(),
              if (inboxSentController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }

  Widget declineContent() {
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
                                left: 10, top: 8, bottom: 10, right: 2),
                            child: ProfileImage(
                              size: screenWidth * 0.2,
                              url: image,
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            textAlign: TextAlign.right,
                                            "Declined On: $date",
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
                                      SizedBox(width: 20),
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
                        child: Text(
                          "She Declined $gender Request, You can’t connect with $gender",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: FontConstant.styleMedium(
                              fontSize: 12, color: AppColors.darkgrey),
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
