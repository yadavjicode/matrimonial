import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/photo_delete_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/edit_profile_Photo_controller.dart';
import '../../../controller/edit_profile_controller.dart';

class EditAllPhoto extends StatefulWidget {
  const EditAllPhoto({super.key});

  @override
  State<EditAllPhoto> createState() => _EditAllPhotoState();
}

class _EditAllPhotoState extends State<EditAllPhoto> {
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final PhotoDeleteController photoDeleteController =
      Get.put(PhotoDeleteController());
  final EditProfilePhotoController editProfilePhotoController =
      Get.put(EditProfilePhotoController());

  List<List<String>> getImageListValues() {
    List<List<String>> imgList = [];

    if (_editProfileController.member?.member != null) {
      String dummyphoto =
          _editProfileController.member?.member?.gender == "Male"
              ? "public/images/nophoto.png"
              : "public/images/nophotof.jpg";

      if (_editProfileController.member?.member?.photo2 != null) {
        imgList.add(
            [_editProfileController.member?.member?.photo2!, "Photo2", "1"]);
      } else {
        imgList.add(
          [dummyphoto, "Photo2", "0"],
        );
      }
      if (_editProfileController.member?.member?.photo3 != null) {
        imgList.add(
            [_editProfileController.member?.member?.photo3!, "Photo3", "1"]);
      } else {
        imgList.add([dummyphoto, "Photo3", "0"]);
      }
      if (_editProfileController.member?.member?.photo4 != null) {
        imgList.add(
            [_editProfileController.member?.member?.photo4!, "Photo4", "1"]);
      } else {
        imgList.add([dummyphoto, "Photo4", "0"]);
      }
      if (_editProfileController.member?.member?.photo5 != null) {
        imgList.add(
            [_editProfileController.member?.member?.photo5!, "Photo5", "1"]);
      } else {
        imgList.add([dummyphoto, "Photo5", "0"]);
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
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(() {
              String dummyphoto =
                  _editProfileController.member?.member?.gender == "Male"
                      ? "public/images/nophoto.png"
                      : "public/images/nophotof.jpg";
              final imgList = getImageListValues();
              return Stack(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: screenWidth,
                        height: screenWidth * 5 / 4,
                        color: AppColors.constColor,
                        child: _editProfileController.member != null &&
                                _editProfileController.member?.member != null
                            ? Stack(children: [
                                Image.network(
                                  _editProfileController
                                              .member?.member?.photo1 !=
                                          null
                                      ? "http://devoteematrimony.aks.5g.in/${_editProfileController.member?.member?.photo1}"
                                      : "http://devoteematrimony.aks.5g.in/${dummyphoto}",
                                  fit: BoxFit.cover,
                                  width: screenWidth,
                                  height: screenWidth * 5 / 4,
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: _editProfileController
                                              .member?.member?.photo1 !=
                                          null
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              Get.toNamed("/updatePhoto",
                                                  arguments: {
                                                    "imageUrl": _editProfileController
                                                                .member
                                                                ?.member
                                                                ?.photo1 !=
                                                            null
                                                        ? "http://devoteematrimony.aks.5g.in/${_editProfileController.member?.member?.photo1}"
                                                        : "http://devoteematrimony.aks.5g.in/${dummyphoto}",
                                                    "value": "Photo1",
                                                    "title": "Update Photo"
                                                  });
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color:
                                                        AppColors.constColor)),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                "assets/images/icons/penicon.svg",
                                                color: AppColors.constColor,
                                                width: 25,
                                                height: 25,
                                              ),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            setState(() {
                                              Get.toNamed("/updatePhoto",
                                                  arguments: {
                                                    "imageUrl": _editProfileController
                                                                .member
                                                                ?.member
                                                                ?.photo1 !=
                                                            null
                                                        ? "http://devoteematrimony.aks.5g.in/${_editProfileController.member?.member?.photo1}"
                                                        : "http://devoteematrimony.aks.5g.in/${dummyphoto}",
                                                    "value": "Photo1",
                                                    "title": "Add Photo"
                                                  });
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: AppColors.black)),
                                            child: const Center(
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                        ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () => {Navigator.pop(context)},
                                      child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            // border: Border.all(color: AppColors.constColor),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            // borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_back,
                                            color: AppColors.constColor,
                                          )),
                                    ),
                                  ),
                                ),
                              ])
                            : Center(
                                child: Text(
                                  "No Image",
                                  style: FontConstant.styleRegular(
                                      fontSize: 16, color: AppColors.darkgrey),
                                ),
                              )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: imgList
                            .map((data) => Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: ProfileImageSquare(
                                      size: screenWidth * 0.4,
                                      url:
                                          "http://devoteematrimony.aks.5g.in/${data[0]}",
                                    ),
                                  ),
                                  Positioned(
                                      right: 7,
                                      top: 7,
                                      child: Column(
                                        children: [
                                          data[2] == "1"
                                              ? InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      Get.toNamed(
                                                          "/updatePhoto",
                                                          arguments: {
                                                            "imageUrl":
                                                                "http://devoteematrimony.aks.5g.in/${data[0]}",
                                                            "value": data[1],
                                                            "title":
                                                                "Update Photo"
                                                          });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .constColor)),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        "assets/images/icons/penicon.svg",
                                                        color: AppColors
                                                            .constColor,
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      Get.toNamed(
                                                          "/updatePhoto",
                                                          arguments: {
                                                            "imageUrl":
                                                                "http://devoteematrimony.aks.5g.in/${data[0]}",
                                                            "value": data[1],
                                                            "title": "Add Photo"
                                                          });
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            color: AppColors
                                                                .black)),
                                                    child: const Center(
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ),
                                                ),
                                          const SizedBox(height: 15),
                                          if (data[2] == "1")
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  photoDeleteController
                                                      .photoDelete(
                                                          context, data[1], 1);
                                                });
                                              },
                                              child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: AppColors.red)),
                                                child: const Center(
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
                    ),
                  ],
                ),
                if (_editProfileController.isLoading.value ||
                    photoDeleteController.isLoading.value ||
                    editProfilePhotoController.isLoading.value)
                  SizedBox(
                    width: screenWidth,
                    height: screenHeight * 0.8,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
              ]);
            }),
          ),
        ));
  }
}
