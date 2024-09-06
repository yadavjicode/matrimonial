import 'dart:io';
import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/model/edit_profile_photo_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class EditProfilePhotoController extends GetxController {
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  // Method to handle the complete profile update process
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
        editProfileController.userDetails(context).then((value) {
          final photoUrl = editProfileController.member?.member?.Photo1;
          if (photoUrl != null && photoUrl.isNotEmpty) {
            APIs.updateUserImage("http://devoteematrimony.aks.5g.in/$photoUrl");
          }
        });
        Dialogs.showSnackbarPop(
            context, 'Profile update successful: ${response['data']}');
      } else {
        print('Profile update failed: ${response['message']}');

        Dialogs.showSnackbar(
            Get.context!, 'Profile update failed: ${response['message']}');
      }
    } catch (e) {
      print('Profile update failed: $e');
      Dialogs.showSnackbar(Get.context!, 'Profile update failed: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to pick an image from the gallery
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
        await cropImage(File(pickedFile.path));
        Get.back(); // Close bottom sheet after selection
      } else {
        print('No image selected.');
        _showSnackBar('No image selected.');
      }
    } catch (e) {
      print('Error while selecting image: $e');
      _showSnackBar('Error while selecting image: $e');
    }
  }

  // Method to pick an image from the camera
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        await cropImage(File(pickedFile.path));
        Get.back(); // Close bottom sheet after selection
      } else {
        print('No image selected.');
        _showSnackBar('No image selected.');
      }
    } catch (e) {
      print('Error while selecting image: $e');
      _showSnackBar('Error while selecting image: $e');
    }
  }

  // Method to crop the selected image
  Future<void> cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio:
          CropAspectRatio(ratioX: 4, ratioY: 5), // Custom aspect ratio 4:5
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor:
              AppColors.primaryColor, // Replace with your primary color
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true, // Lock to prevent changing aspect ratio
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true, // Lock to prevent changing aspect ratio
        ),
      ],
    );

    if (croppedFile != null) {
      selectedImage.value = File(croppedFile.path);
    }
  }

  // Helper method to show a snackbar
  void _showSnackBar(String message) {
    Dialogs.showSnackbar(Get.context!, message);
  }
}
