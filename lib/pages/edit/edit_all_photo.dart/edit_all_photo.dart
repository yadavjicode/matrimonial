import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/model/edit_profile_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/edit_profile_controller.dart';

class EditAllPhoto extends StatefulWidget {
  const EditAllPhoto({super.key});

  @override
  State<EditAllPhoto> createState() => _EditAllPhotoState();
}

class _EditAllPhotoState extends State<EditAllPhoto> {
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final EditProfilePhotoModel editProfilePhotoModel =
      Get.put(EditProfilePhotoModel());
 
   
  List<List<String>> getImageListValues() {
    List<List<String>> imgList = [];

    // Ensure member and member.member are not null
    if (_editProfileController.member?.member != null) {
      if (_editProfileController.member!.member!.photo1 != null) {
        imgList.add([_editProfileController.member!.member!.photo1!, "Photo1"]);
      }
      if (_editProfileController.member!.member!.photo2 != null) {
        imgList.add([_editProfileController.member!.member!.photo2!, "Photo2"]);
      }
      if (_editProfileController.member!.member!.photo3 != null) {
        imgList.add([_editProfileController.member!.member!.photo3!, "Photo3"]);
      }
      if (_editProfileController.member!.member!.photo4 != null) {
        imgList.add([_editProfileController.member!.member!.photo4!, "Photo4"]);
      }
      if (_editProfileController.member!.member!.photo5 != null) {
        imgList.add([_editProfileController.member!.member!.photo5!, "Photo5"]);
      }
    }

    return imgList;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "All Images",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          color: AppColors.constColor,
          child: Obx(() {
            final imgList = getImageListValues();
            return Stack(children: [
              Column(
                children: imgList
                    .map((data) => Stack(children: [
                          Container(
                            child: Image.network(
                                "http://devoteematrimony.aks.5g.in/${data[0]}"),
                          ),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                      setState(() {
                                        Get.toNamed("/updatePhoto", arguments: {
                                           "imageUrl": "http://devoteematrimony.aks.5g.in/${data[0]}",
                                          "value": data[1]
                                        });
                                        print(
                                            "id============================================${data[1]}");
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.constColor)),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          "assets/images/icons/penicon.svg",
                                          color: AppColors.constColor,
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  InkWell(
                                    // onTap: () {
                                    //   setState(() {
                                    //     Get.toNamed("/updatePhoto", arguments: {
                                    //        "imageUrl": "http://devoteematrimony.aks.5g.in/${data[0]}",
                                    //       "value": data[1]
                                    //     });
                                    //     print(
                                    //         "id============================================${data[1]}");
                                    //   });
                                    // },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.constColor)),
                                      child: Center(
                                          child: Icon(
                                        Icons.delete_forever_outlined,
                                        color: AppColors.red,
                                      )),
                                    ),
                                  ),
                                ],
                              ))
                        ]))
                    .toList(),
              ),
              if (_editProfileController.isLoading.value)
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ]);
          }),
        ),
      ),
    );
  }
}
