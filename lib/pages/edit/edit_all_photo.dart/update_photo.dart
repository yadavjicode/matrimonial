import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_Photo_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpdatePhoto extends StatefulWidget {
  const UpdatePhoto({super.key});

  @override
  State<UpdatePhoto> createState() => _UpdatePhotoState();
}

class _UpdatePhotoState extends State<UpdatePhoto> {
  final EditProfileController editProfileController =
      Get.put(EditProfileController());
  final EditProfilePhotoController editProfilePhotoController =
      Get.put(EditProfilePhotoController());
    final Map<String, dynamic> arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final String imageurl = arguments['imageUrl'];
    final String values = arguments['value'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("Update Photo"),
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
                ? imageurl
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
                  editProfilePhotoController.profileCompleteFill(context,values);
                } else {
                 
                   Dialogs.showSnackbar(context, 'Please select an image before updating.');
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
                  "Update Photo",
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