import 'package:devotee/controller/inbox_sent_controller.dart';
import 'package:devotee/controller/withdrawal_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SentPending extends StatefulWidget {
  const SentPending({super.key});
  @override
  State<SentPending> createState() => _SentPendingState();
}

class _SentPendingState extends State<SentPending> {
 final InboxSentController inboxSentController = Get.put(InboxSentController());
  final WithdrawalController withdrawalController=Get.put(WithdrawalController());
  @override
  void initState() {
    // TODO: implement initState
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

  Widget pendingContent() {
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
            children:
                inboxSentController.member!.responseData!.data!.map((data) {
              // int index = entry.key;
              String name = "${data.name ?? ""} ${data.surename ?? ""}";
              String date = DateFormat('dd-MM-yyyy')
                  .format(DateTime.parse(data.updatedAt));
              String mId = data.receicedMatriID ?? "";
              String image = data.photo1 != null
                  ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
                  : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
              return Container(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.grey),
                            child: ClipOval(
                                child: Image.network(
                              image,
                              fit: BoxFit.cover,
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
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                      decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "To contact her directly,",
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: AppColors.black),
                          ),
                          Text(
                            " Upgrade Now",
                            style: FontConstant.styleSemiBold(
                                fontSize: 12, color: AppColors.primaryColor),
                          ),
                        ],
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
                                              context, mId,btnOkOnPress: () => {
                                                WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            inboxSentController.inboxSent(
                                                context, "Pending");
                                          })
                                              },),
                                          
                                        },
                            child: Row(
                              children: [
                                Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: Colors.red, shape: BoxShape.circle),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.delete,
                                    color: AppColors.constColor,
                                  ),
                                  // child: Image.asset(
                                  //     "assets/images/delete.png"),
                                ),
                                SizedBox(
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
                          Row(
                            children: [
                           Image.asset("assets/images/whatsapp.png"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Whatsapp",
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: Colors.green),
                          ),
                            ],
                          ),
                          Row(
                            children: [
                          Image.asset("assets/images/call.png"),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Call",
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: AppColors.purple),
                          ),
                            ],
                          )
                         
                          
                          
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
