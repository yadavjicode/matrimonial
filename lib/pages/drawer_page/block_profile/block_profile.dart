import 'package:devotee/controller/block_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../constants/widget/dialog.dart';
import '../../../constants/widget/profile_image.dart';
import '../../../utils/comman_class_method.dart';
import '../../../utils/size.dart';

class BlockProfile extends StatefulWidget {
  const BlockProfile({super.key});

  @override
  State<BlockProfile> createState() => _BlockProfileState();
}

class _BlockProfileState extends State<BlockProfile> {
  final BlockProfileController blockProfileController =
      Get.put(BlockProfileController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      blockProfileController.blockProfile(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          "Blocked Profile",
          style: FontConstant.styleMedium(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png")),
        Obx(() {
          return Stack(
            children: [
              if (!blockProfileController.isLoading.value) blockContent(),
              if (blockProfileController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          );
        })
      ]),
    );
  }

  Widget blockContent() {
    final member = blockProfileController.member;

    if (member == null ||
        member.responseData == null ||
        member.responseData == null) {
      return Center(
          child: Text("No data available",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    }

    if (blockProfileController.member!.responseData!.isEmpty) {
      return Container(
          margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 2,
              left: SizeConfig.blockSizeHorizontal * 4,
              right: SizeConfig.blockSizeHorizontal * 4),
          color: AppColors.constColor,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text("No users found!",
              style: FontConstant.styleMedium(
                  fontSize: 15, color: AppColors.darkgrey)));
    } else {
      return Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.blockSizeHorizontal * 4,
            right: SizeConfig.blockSizeHorizontal * 4),
        child: Container(
          height: double.infinity,
          color: AppColors.constColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children:
                      blockProfileController.member!.responseData!.map((data) {
                    String name = "${data.name ?? ""} ${data.surename ?? ""}";
                    String date = CommanClass.dateFormat(data.createdAt);
                    String id = data.blockedId.toString();
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
                    List<String?> info = [
                      haString,
                      eoString,
                      crString,
                      scString
                    ];
                    String infos = CommanClass.hyphenString(info);

                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.constColor,
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        SizeConfig.blockSizeHorizontal * 2,
                                    vertical: SizeConfig.blockSizeVertical * 1),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top:
                                            SizeConfig.blockSizeVertical * 0.2),
                                    child: ProfileImage(
                                      size: SizeConfig.screenWidth * 0.2,
                                      url: image,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: SizeConfig.blockSizeHorizontal * 2,
                                      top: SizeConfig.blockSizeVertical * 1,
                                      bottom:
                                          SizeConfig.blockSizeVertical * 0.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("ID: $id",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey)),
                                          SizedBox(
                                            width:
                                                SizeConfig.blockSizeHorizontal *
                                                    2,
                                          ),
                                          Expanded(
                                            child: Text(
                                              textAlign: TextAlign.right,
                                              "Blocked On: $date",
                                              style: FontConstant.styleMedium(
                                                  fontSize: 12,
                                                  color: AppColors.darkgrey),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        name,
                                        overflow: TextOverflow.ellipsis,
                                        style: FontConstant.styleSemiBold(
                                            fontSize: 13,
                                            color: AppColors.primaryColor),
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
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 4,
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
