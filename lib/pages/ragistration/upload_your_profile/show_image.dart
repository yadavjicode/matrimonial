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
  File? profileImage; 

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          profileImage = null; //
        });
        Get.offAndToNamed('/profile');
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Selected Images",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              profileImage = null;
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: screenWidth * 1,
                      height: (screenWidth * 1) * (5 / 4),
                       color: AppColors.constColor,
                      child:completeProfileController.selectedImages.isNotEmpty? profileImage !=
                              null // Check if profileImage is not null
                          ? Image.file(
                              profileImage!,
                              height: (screenWidth * 1) * (5 / 4),
                              width: screenWidth * 1,
                              fit: BoxFit.cover,
                            )
                          :Image.file(
                              completeProfileController.selectedImages[0],
                              height: (screenWidth * 1) * (5 / 4),
                              width: screenWidth * 1,
                            ):Center(child: Text("No Image",style: FontConstant.styleRegular(
                            fontSize: 15, color: AppColors.black),),)
                            ),
                  
                  Container(
                    // height: screenHeight * 0.17,
                    width: screenWidth,
                    color: AppColors.background,
                    child: Obx(
                      () => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: completeProfileController.selectedImages
                              .map((image) => Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                      color: Colors.grey.shade200,
                                    )),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              profileImage = image;
                                            });
                                            print(image);
                                          },
                                          child: Image.file(image,
                                              height:
                                                  (screenWidth * 0.3) * (5 / 4),
                                              width: screenWidth * 0.3,
                                              fit: BoxFit.cover),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: () {
                                              completeProfileController
                                                  .selectedImages
                                                  .remove(image);
                                                  setState(() {
                                                    profileImage=null; 
                                                  });
                                              
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
                  GestureDetector(
                    onTap: () => {
                      completeProfileController.profileCompleteFill(context)
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "Upload Photos",
                        style: FontConstant.styleRegular(
                            fontSize: 15, color: AppColors.constColor),
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
  }
}
