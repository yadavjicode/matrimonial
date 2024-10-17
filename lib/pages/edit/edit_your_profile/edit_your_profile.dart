import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_Photo_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditYourProfile extends StatefulWidget {
  const EditYourProfile({super.key});

  @override
  State<EditYourProfile> createState() => _EditYourProfileState();
}

class _EditYourProfileState extends State<EditYourProfile> {
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final EditProfilePhotoController editProfilePhotoController =
      Get.put(EditProfilePhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("Profile Edit",
            style:
                FontConstant.styleSemiBold(fontSize: 18, color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
        ],
      ),
      body: Obx(() {
        final double screenWidth = MediaQuery.of(context).size.width;

        String image = editProfilePhotoController.selectedImage.value != null
            ? editProfilePhotoController.selectedImage.value!.path
            : CommanClass.photo(editProfileController.member?.member?.photo1,
                editProfileController.member?.member?.gender);

        return Column(
          children: [
            Container(
              width: screenWidth * 1,
              height: (screenWidth * 1) * (5 / 4),
              color: AppColors.constColor,
              child: editProfilePhotoController.selectedImage.value != null
                  ? Image.file(editProfilePhotoController.selectedImage.value!,
                      fit: BoxFit.fill)
                  : Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: screenWidth * 1,
                      height: (screenWidth * 1) * (5 / 4),
                    ),
            ),
            GestureDetector(
              onTap: () {
                if (editProfilePhotoController.selectedImage.value != null) {
                  editProfilePhotoController.profileCompleteFill(
                      context, "Photo1");
                } else {
                  Dialogs.showSnackbar(
                      context, 'Please select an image before updating.');
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  "Update Profile",
                  style: FontConstant.styleRegular(
                      fontSize: 15, color: AppColors.constColor),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(25),
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        editProfilePhotoController.pickImageFromGallery(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/gallery.svg",
                          height: 70,
                          width: 70,
                        ),
                        Text(
                          "From Gallery",
                          style: FontConstant.styleRegular(
                              fontSize: 19, color: AppColors.black),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () =>
                        editProfilePhotoController.pickImageFromCamera(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/camera.svg",
                          height: 70,
                          width: 70,
                        ),
                        Text(
                          "From Camera",
                          style: FontConstant.styleRegular(
                              fontSize: 19, color: AppColors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
