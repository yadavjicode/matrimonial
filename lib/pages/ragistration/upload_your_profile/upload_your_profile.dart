import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/controller/skip_controller.dart';
import 'package:devotee/controller/upload_profile_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UploadYourProfile extends StatefulWidget {
  const UploadYourProfile({super.key});

  @override
  State<UploadYourProfile> createState() => _UploadYourProfileState();
}

class _UploadYourProfileState extends State<UploadYourProfile> {
  UploadProfileController completeProfileController =
      Get.put(UploadProfileController());
  final FlowController flowController = Get.put(FlowController());
  final SkipController skipController = Get.put(SkipController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Complete Your Profile",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/horoscope');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/background.png")),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Container(
                          height: 450,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade200),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => {
                                  //  _showBottomSheet(context)
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child:
                                      Image.asset("assets/images/upload.png"),
                                ),
                              ),
                              Text(
                                "Upload Square size photograph in",
                                style: FontConstant.styleRegular(
                                    fontSize: 15, color: Color(0xff0B0B0B)),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: Text(
                                    "jpg or png format.",
                                    style: FontConstant.styleRegular(
                                        fontSize: 15, color: Color(0xff0B0B0B)),
                                  )),
                              SizedBox(
                                width: 200,
                                child: CustomButton(
                                    text: "Add Photos",
                                    onPressed: () {
                                      // _showBottomSheet(context);
                                      Get.offAndToNamed("/addPhoto");
                                    },
                                    color: AppColors.primaryColor,
                                    textStyle: FontConstant.styleSemiBold(
                                        fontSize: 15,
                                        color: AppColors.constColor)),
                              ),
                              GestureDetector(
                                onTap: () => {
                                  //  Get.offAndToNamed('/packageInfo')
                                  //  flowController.Flow(context, 11)
                                  skipController.skip(context, "step_11", 11)
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  child: Text("SKIP",
                                      style: FontConstant.styleRegular(
                                          fontSize: 15,
                                          color: Color(0xff0B0B0B))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        "Get more responses by uploading\nupto 5 photos",
                        style: FontConstant.styleRegular(
                            fontSize: 15, color: Colors.grey),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
            if (completeProfileController.isLoading.value ||
                flowController.isLoading.value ||
                skipController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
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
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          {completeProfileController.pickImagesFromGallery()},
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
                          {completeProfileController.pickImageFromCamera()},
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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "You can only select up to 5 images",
                    style: FontConstant.styleRegular(
                        fontSize: 1, color: AppColors.black),
                  ),
                )
              ],
            ),
          );
        });
  }
}
