import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  SearchsController searchController = Get.put(SearchsController());
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    String selectedText = "";
    int selectedIndex = -1;
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Your Search Result",
          style: FontConstant.styleMedium(
              fontSize: 18, color: AppColors.constColor),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_alt,
              color: Colors.white,
            ),
            onPressed: () {
              // Add filter functionality
            },
          ),
        ],
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey.shade200),
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Age 20 yrs - 40 yrs",
                          style: FontConstant.styleMedium(
                              fontSize: 12, color: AppColors.primaryColor),
                        ),
                        SizedBox(width: 10),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 245, 134, 186)),
                          child: Icon(
                            Icons.close,
                            color: AppColors.primaryColor,
                            size: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey.shade200),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Height: 5 feet - 7 feet",
                            style: FontConstant.styleMedium(
                                fontSize: 12, color: AppColors.primaryColor),
                          ),
                          SizedBox(width: 10),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 245, 134, 186)),
                            child: Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                              size: 15,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: Container(
                // height: 291,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: searchController.member!.data!.map((data) {
                      //  int index = data.;
                      String name = "${data.name ?? ""} ${data.surename ?? ""}";
                      String occupation = data.occupation ?? "";
                      String age = data.age == null
                          ? ""
                          : "${data.age.toString()} Years, ";
                      String height = data.height ?? "";
                      String aadress =
                          " ${data.caste == null ? "" : "${data.caste}, "}${data.religion == null ? "" : "${data.religion}"}${data.caste == null && data.religion == null || data.state == null && data.country == null ? "" : " - "}${data.state == null ? "" : "${data.state}, "}${data.country ?? ""}";
                      String id = data.matriID ?? "";
                      String image = data.profileImages != null
                          ? "http://devoteematrimony.aks.5g.in/${data.profileImages}"
                          : "https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg";
                      // // String head = entry.value[1];

                      return GestureDetector(
                        onTap: () {
                          print("id===============$id");
                          profileDetailsController.profileDetails(context, id);
                          // Get.toNamed('/profiledtls');
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              top: 5, bottom: 10, left: 10, right: 10),
                          //  width: 320,
                          decoration: BoxDecoration(
                            color: selectedIndex == data.name
                                ? Colors.grey.shade300
                                : Colors.white,
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, bottom: 8, top: 8),
                                    child: Stack(children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
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
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: 22,
                                              width: 22,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green),
                                              child: SvgPicture.asset(
                                                  "assets/images/icons/correct.svg"),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Send Interest",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            name,
                                            style: FontConstant.styleSemiBold(
                                                fontSize: 15,
                                                color: AppColors.primaryColor),
                                          ),
                                          Text(
                                            "ID: $id",
                                            style: FontConstant.styleMedium(
                                                fontSize: 13,
                                                color: AppColors.black),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    right: 5,
                                                    bottom: 5,
                                                    top: 5),
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
                                                  style:
                                                      FontConstant.styleMedium(
                                                          fontSize: 13,
                                                          color:
                                                              AppColors.grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8, bottom: 8),
                                            child: Container(
                                              height: 1,
                                              color: Colors.grey.shade200,
                                            ),
                                          ),
                                          Text(
                                            occupation,
                                            style: FontConstant.styleMedium(
                                                fontSize: 13,
                                                color: AppColors.darkgrey),
                                          ),
                                          Text(
                                            "${age}${height}",
                                            style: FontConstant.styleMedium(
                                                fontSize: 13,
                                                color: AppColors.darkgrey),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text("Created By: Myself",
                                                style: FontConstant.styleMedium(
                                                    fontSize: 13,
                                                    color: AppColors.darkgrey)),
                                          ),
                                          Text(
                                            aadress,
                                            style: FontConstant.styleMedium(
                                                fontSize: 13,
                                                color: AppColors.black),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/like.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Shortlist",
                                          style: FontConstant.styleMedium(
                                              fontSize: 11,
                                              color: AppColors.black),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/chat_d.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "Chat Now",
                                          style: FontConstant.styleMedium(
                                              fontSize: 11,
                                              color: AppColors.black),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/pink_search.svg",
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "View Profile",
                                          style: FontConstant.styleMedium(
                                              fontSize: 11,
                                              color: AppColors.black),
                                        )
                                      ],
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
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
