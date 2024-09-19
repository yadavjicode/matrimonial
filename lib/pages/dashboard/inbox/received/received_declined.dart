import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/accepted_controller.dart';
import 'package:devotee/controller/inbox_received_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReceivedDeclined extends StatefulWidget {
  const ReceivedDeclined({super.key});

  @override
  State<ReceivedDeclined> createState() => _ReceivedDeclinedState();
}

class _ReceivedDeclinedState extends State<ReceivedDeclined> {
  InboxReceivedController inboxReceivedController =
      Get.put(InboxReceivedController());
  AcceptedController acceptedController = Get.put(AcceptedController());
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
                  acceptedController.isLoading.value == true)
                Center(
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
    final double screenHeight = MediaQuery.of(context).size.height;
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
            String date =
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data.updatedAt));
            String mId = data.sentMatriID ?? "";
            String image = data.photo1 != null
                ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
                : data.gender=="Male"? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png":"https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";

            return GestureDetector(
              onTap: () {
                // Get.toNamed('/profiledtls');
              },
              child: Container(
                //  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  // color: selectedIndex == index
                  //     ? Colors.grey.shade300
                  //     : Colors.white,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200),
                  //  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                         padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 2),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("ID: ${mId}",
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
                                          "Sent On: ${date}",
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
                                    "${data.age == null ? "" : "${data.age} Yrs, "}${data.height == null ? "" : "${data.height}, "}${data.caste == null ? "" : "${data.caste}, "}${data.religion == null ? "" : "${data.religion}, "}${data.occupation == null ? "" : "${data.occupation}, "}${data.state == null ? "" : "${data.state}, "}${data.country == null ? "" : "${data.country}"}",
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
                              "You Declined her Request",
                              style: FontConstant.styleMedium(
                                  fontSize: 12, color: AppColors.darkgrey),
                            ),
                          ),
                          // SizedBox(
                          //   width: 3,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     Container(
                          //         height: 26,
                          //         width: 26,
                          //         decoration: BoxDecoration(
                          //             color: Colors.green,
                          //             shape: BoxShape.circle),
                          //         alignment: Alignment.center,
                          //         child: SvgPicture.asset(
                          //             "assets/images/icons/correct.svg")),
                          //     SizedBox(
                          //       width: 3,
                          //     ),
                          //     GestureDetector(
                          //       onTap: () => {
                          //         acceptedController.accepted(context, mId),
                          //         WidgetsBinding.instance
                          //             .addPostFrameCallback((_) {
                          //           inboxReceivedController.inboxSent(
                          //               context, "Declined");
                          //         })
                          //       },
                          //       child: Text(
                          //         "Accept Request Now",
                          //         style: FontConstant.styleMedium(
                          //             fontSize: 12, color: Colors.green),
                          //       ),
                          //     ),
                          //   ],
                          // )
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
