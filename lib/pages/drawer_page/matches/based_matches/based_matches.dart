import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/chat/screens/home_screen.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/matches_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/sent_invitation_controller.dart';
import 'package:devotee/controller/shortlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BasedMatches extends StatefulWidget {
  const BasedMatches({super.key});

  @override
  State<BasedMatches> createState() => _BasedMatchesState();
}

class _BasedMatchesState extends State<BasedMatches> {
  final MatchesController matchesController = Get.put(MatchesController());
  final ShortlistController shortlistController =
      Get.put(ShortlistController());
  final SentInvitationController sentInvitationController =
      Get.put(SentInvitationController());
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
final Map<String, dynamic> arguments = Get.arguments;
    
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final String keys = arguments['keys'];
      matchesController.matches(context, keys);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String keys = arguments['keys'];
    return Scaffold(
       backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Matches",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body:Obx(() {
      return Stack(
        children: [
         Stack(
          children: [
            Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/bg3.png")),
          // if (matchesController.isLoading.value == false)
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AllMatchesContent(keys),
          ),
              
          ],
        ),
     
                if (matchesController.isLoading.value ||
               shortlistController.isLoading.value ||
               sentInvitationController.isLoading.value ||
               profileDetailsController.isLoading.value)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),

        ]
      );
      }
      )
    );
  }




  Widget AllMatchesContent(String keys) {
    final member = matchesController.member;
    if (member == null || member.searchData!.data == null) {
      return Center(child: Text("No data available"));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: matchesController.member!.searchData!.data!.map((data) {
          // int index = entry.key;
          String name = "${data.name ?? ""} ${data.surename ?? ""}";
          String id = data.matriID;
          String image = data.photo1 != null
              ? "http://devoteematrimony.aks.5g.in/${data.photo1}"
              : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg";
          //String head = entry.value[1];

          return GestureDetector(
            onTap: () {
            
            },
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              //  width: 320,
              decoration: BoxDecoration(
                // color: selectedIndex == index
                //     ? Colors.grey.shade300
                //     : Colors.white,
                color: AppColors.constColor,
                border: Border.all(color: Colors.grey.shade200),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 8, bottom: 8, top: 8),
                        child: Stack(children: [
                          ClipRRect(
                           borderRadius: BorderRadius.all(Radius.circular(7)),
                            child: Image.network(
                              "$image",
                              height: 196,
                          width: 137,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                              width: 137,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 170),
                              child: GestureDetector(
                                onTap: () {
                                  print("${id}");
                                  sentInvitationController.sentInvitation(
                                    context,
                                    data.matriID!,
                                    btnOkOnPress: () => {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        matchesController.matches(
                                            context, keys);
                                      }),
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    data.interestStatus == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green),
                                            child: SvgPicture.asset(
                                                "assets/images/icons/correct.svg"),
                                          )
                                        : Container(
                                            alignment: Alignment.center,
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white),
                                            child: SvgPicture.asset(
                                                "assets/images/icons/pinkcorrect.svg"),
                                          ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Send Interest",
                                      style: FontConstant.styleMedium(
                                          fontSize: 12,
                                          color: AppColors.constColor),
                                    ),
                                  ],
                                ),
                              ))
                        ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: FontConstant.styleSemiBold(
                                    fontSize: 15,
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                "ID: ${data.matriID}",
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.black),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 5, bottom: 5, top: 5),
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Last Online: 6 Jul 2024, 11:13 am",
                                      style: FontConstant.styleMedium(
                                          fontSize: 13, color: AppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 5),
                                child: Container(
                                  height: 1,
                                  color: Colors.grey.shade200,
                                ),
                              ),
                              Text(
                                "${data.occupation == null ? "" : "${data.occupation} - "}${data.education == null ? "" : "${data.education}"}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Text(
                                "${data.age == null ? "" : "${data.age} Yrs, "}${data.height == null ? "" : "${data.height}"}",
                                overflow: TextOverflow.ellipsis,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.darkgrey),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text("Created By: Myself",
                                    style: FontConstant.styleMedium(
                                        fontSize: 13,
                                        color: AppColors.darkgrey)),
                              ),
                              Text(
                                "${data.caste == null ? "" : "${data.caste}, "}${data.religion == null ? "" : "${data.religion}"} ${data.caste == null && data.religion == null || data.state == null && data.country == null ? "" : " - "}${data.state == null ? "" : "${data.state}, "}${data.country == null ? "" : "${data.country}"}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: FontConstant.styleMedium(
                                    fontSize: 13, color: AppColors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              shortlistController.shortlist(
                                context,
                                id,
                                btnOkOnPress: () => {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    matchesController.matches(
                                        context, "matches");
                                  }),
                                },
                              ),
                            },
                            child: Row(
                              children: [
                                Icon(
                                  data.shortlistStatus == 1
                                      ? (Icons.favorite)
                                      : Icons.favorite_border_rounded,
                                  color: data.shortlistStatus == 1
                                      ? Colors.red
                                      : AppColors.primaryColor,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "Shortlist",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              if (id.trim().isNotEmpty && id.trim() != null) {
                                await APIs.addChatUser(id).then((value) {
                                  if (!value) {
                                    Dialogs.showSnackbar(
                                        context, 'User does not Exists!');
                                  } else {
                                    Get.to(HomeScreen());
                                  }
                                });
                              }
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/chat_d.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "Chat Now",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => {
                              profileDetailsController.profileDetails(
                                  context, id)
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/pink_search.svg",
                                  height: 20,
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "View Profile",
                                    style: FontConstant.styleMedium(
                                        fontSize: 11, color: AppColors.black),
                                  ),
                                )
                              ],
                            ),
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
    );
  }
}