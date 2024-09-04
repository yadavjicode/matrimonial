import 'dart:io';
import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/edit_profile_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class EditProfilePhotoController extends GetxController {
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  Future<void> profileCompleteFill(BuildContext context) async {
    final profileModel = EditProfilePhotoModel();
    isLoading.value = true;

    try {
      if (selectedImage.value == null) {
        throw Exception('No image selected');
      }

      final response = await EditProfilePhotoModel.editProfile(
          profileModel, selectedImage.value!);
      if (response["status"] == true) {
        print('Profile update successful: ${response['data']}');
        editProfileController.userDetails(context).then((value) =>
            APIs.updateUserImage(
                "http://devoteematrimony.aks.5g.in/${editProfileController.member!.member!.Photo1}"));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
                backgroundColor: AppColors.primaryColor,
                content: Text(
                  'Profile update successful: ${response['data']}',
                  style: TextStyle(color: AppColors.constColor),
                ),
                duration: Duration(seconds: 1)))
            .closed
            .then((_) {
          // After the SnackBar is dismissed, navigate back
          Navigator.pop(context);
        });
      } else {
        print('Profile update failed: ${response['message']}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text('Profile update failed: ${response['message']}'),
            duration: Duration(seconds: 1)));
      }
    } catch (e) {
      print('Profile update failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text('Profile update failed: $e'),
          duration: Duration(seconds: 1)));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        Get.back(); // Close bottom sheet after selection
      } else {
        print('No image selected.');
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text('No image selected.'),
            duration: Duration(seconds: 1)));
      }
    } catch (e) {
      print('Error while selecting image: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text('Error while selecting image: $e'),
          duration: Duration(seconds: 1)));
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        Get.back(); // Close bottom sheet after selection
      } else {
        print('No image selected.');
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            backgroundColor: AppColors.primaryColor,
            content: Text('No image selected.'),
            duration: Duration(seconds: 1)));
      }
    } catch (e) {
      print('Error while selecting image: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          backgroundColor: AppColors.primaryColor,
          content: Text('Error while selecting image: $e'),
          duration: Duration(seconds: 1)));
    }
  }
}