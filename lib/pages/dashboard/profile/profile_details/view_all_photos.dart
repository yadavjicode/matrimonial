import 'package:devotee/constants/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../constants/color_constant.dart';
import '../../../../controller/profile_details_controller.dart';

class ViewAllPhotos extends StatefulWidget {
  const ViewAllPhotos({super.key});

  @override
  State<ViewAllPhotos> createState() => _ViewAllPhotosState();
}

class _ViewAllPhotosState extends State<ViewAllPhotos> {
  ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  int currentIndex = 0; // Track the current image index

  // Function to get the list of image URLs
  List<String> getImageList() {
    List<String> imgList = [];

    if (profileDetailsController.member?.data?.photo1 != null) {
      imgList.add(profileDetailsController.member?.data?.photo1!);
    }
    if (profileDetailsController.member?.data?.photo2 != null) {
      imgList.add(profileDetailsController.member?.data?.photo2!);
    }
    if (profileDetailsController.member?.data?.photo3 != null) {
      imgList.add(profileDetailsController.member?.data?.photo3!);
    }
    if (profileDetailsController.member?.data?.photo4 != null) {
      imgList.add(profileDetailsController.member?.data?.photo4!);
    }
    if (profileDetailsController.member?.data?.photo5 != null) {
      imgList.add(profileDetailsController.member?.data?.photo5!);
    }
    return imgList;
  }

  @override
  Widget build(BuildContext context) {
    List<String> images = getImageList(); // Fetch the list of images

    if (images.isEmpty) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
            child: Text(
          "No photos available!",
          style: FontConstant.styleSemiBold(
              fontSize: 13, color: AppColors.darkgrey),
        )),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: images.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(
                      "http://devoteematrimony.aks.5g.in/${images[index]}"), // Load the image
                  minScale:
                      PhotoViewComputedScale.contained, // Minimum zoom scale
                  maxScale:
                      PhotoViewComputedScale.covered * 2.0, // Max zoom scale
                );
              },
              scrollPhysics: const BouncingScrollPhysics(), // Allow swiping
              backgroundDecoration: const BoxDecoration(
                color: Colors.black, // Set background color
              ),
              loadingBuilder: (context, progress) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                  value: progress == null
                      ? null
                      : progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!,
                ),
              ),
              pageController: PageController(initialPage: currentIndex),
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index; // Update current index on page change
                });
              },
            ),
            Positioned(
              bottom: 20, // Position at the bottom of the screen
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.5), // Semi-transparent background
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${currentIndex + 1} / ${images.length}", // Display current index and total
                    style: const TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 16,
                    ),
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
                        color: Colors.black.withOpacity(0.5),
                        // borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.constColor,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
