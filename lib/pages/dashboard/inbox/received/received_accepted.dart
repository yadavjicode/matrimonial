import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/inbox_received_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReceivedAccepted extends StatefulWidget {
  const ReceivedAccepted({super.key});

  @override
  State<ReceivedAccepted> createState() => _ReceivedAcceptedState();
}

class _ReceivedAcceptedState extends State<ReceivedAccepted> {
  InboxReceivedController inboxReceivedController =
      Get.put(InboxReceivedController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      inboxReceivedController.inboxSent(context, "Accepted");
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
              if (inboxReceivedController.isLoading.value == false)
                acceptContent(),
              if (inboxReceivedController.isLoading.value ||
                  profileDetailsController.isLoading.value)
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        }));
  }

  Widget acceptContent() {
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
              String date = DateFormat('dd-MM-yyyy')
                  .format(DateTime.parse(data.updatedAt));
              String mId = data.sentMatriID ?? "";
              String image = data.photo1 != null
                  ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
                  : data.gender == "Male"
                      ? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png"
                      : "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";

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
                              left: 10, top: 10, bottom: 10, right: 2),
                          child: GestureDetector(
                            onTap: () {
                              profileDetailsController.profileDetails(
                                  context, mId, "", [
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
                                "11"
                              ]);
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
                    InkWell(
                      onTap: () => {
                        profileDetailsController.profileDetails(
                            context, mId, "", [
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
                          "11"
                        ])
                      },
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset(
                            "assets/images/pink_search.svg",
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "View Profile",
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: AppColors.black),
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }
}
