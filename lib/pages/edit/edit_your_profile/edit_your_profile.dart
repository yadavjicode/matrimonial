import 'dart:io';

import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_Photo_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("Profile Edit"),
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
    final double screenHeight = MediaQuery.of(context).size.height;

        String image = editProfilePhotoController.selectedImage.value != null
            ? editProfilePhotoController.selectedImage.value!.path
            : (editProfileController.member!.member!.photo1 != null
                ? "http://devoteematrimony.aks.5g.in/${editProfileController.member!.member!.photo1}"
                : "https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg");

        return Column(
          children: [
            Container(
              width: screenWidth*1,
              height:(screenWidth*1)*(5/4) ,
              color: AppColors.black,
              child: editProfilePhotoController.selectedImage.value != null
                  ? Image.file(editProfilePhotoController.selectedImage.value!,
                      fit: BoxFit.fill)
                  : Image.network(image, fit: BoxFit.cover,width: screenWidth*1,
              height:(screenWidth*1)*(5/4) ,),
            ),
            GestureDetector(
              onTap: () {
                if (editProfilePhotoController.selectedImage.value != null) {
                  editProfilePhotoController.profileCompleteFill(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please select an image before updating.'),
                    backgroundColor: AppColors.primaryColor,
                     duration: Duration(seconds: 1)
                  ));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: EdgeInsets.all(10),
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
                    onTap: () => editProfilePhotoController.pickImageFromGallery(),
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
                    onTap: () => editProfilePhotoController.pickImageFromCamera(),
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
