import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/upload_profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class ShowImage extends StatefulWidget {
  const ShowImage({super.key});

  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  final UploadProfileController completeProfileController =
      Get.put(UploadProfileController());
 static File? profileImage; // Changed dynamic to File? to handle the null case

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Select Images",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAndToNamed('/profile');
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/background.png"),
          ),
          Column(
            children: [
              Container(
                height: screenHeight * 0.4,
                
                child: profileImage != null // Check if profileImage is not null
                    ? Image.file(profileImage!)
                    : Image.file(completeProfileController.selectedImages[0])
              ),
             
              Container(
                // height: screenHeight * 0.17,
                width: screenWidth,
                color: AppColors.constColor,
                child: Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: completeProfileController.selectedImages
                          .map((image) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade200,)
                            ),
                            child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          profileImage = image;
                                        });
                                        print(image);
                                      },
                                      child: Image.file(
                                        image,
                                        height: 120,
                                        width: 120,
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          completeProfileController
                                              .selectedImages
                                              .remove(image);
                                        },
                                        child: Icon(Icons.remove_circle,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ],
                                ),
                          ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => {
                  completeProfileController.profileCompleteFill(context)
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    "Add Photos",
                    style: FontConstant.styleRegular(
                        fontSize: 15, color: AppColors.constColor),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
