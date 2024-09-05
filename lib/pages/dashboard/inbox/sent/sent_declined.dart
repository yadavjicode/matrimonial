import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
                Center(
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
    final double screenHeight = MediaQuery.of(context).size.height;
    final member = inboxSentController.member;
    if (member == null ||
        member.responseData == null ||
        member.responseData!.data == null) {
      return Center(child: Text("No data available"));
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: inboxSentController.member!.responseData!.data!.map((data) {
            String name = "${data.name ?? ""} ${data.surename ?? ""}";
            String date =
                DateFormat('dd-MM-yyyy').format(DateTime.parse(data.updatedAt));
            String mId = data.receicedMatriID ?? "";
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
                          padding: const EdgeInsets.only(left: 10,top: 8,bottom: 10,right: 2),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.grey),
                            child: ClipOval(
                                child: Image.network(
                              image,
                              fit: BoxFit.fill,
                            )),
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
                                          "Declined On: ${date}",
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
                      child: Text(
                        "She Declined her Request, You can’t connect with her",
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
