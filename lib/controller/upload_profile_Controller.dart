import 'dart:io';
import 'package:devotee/chat/api/apis.dart';
import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/upload_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class UploadProfileController extends GetxController {
  var isLoading = false.obs;
  var selectedImages = <File>[].obs;
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  // Method to handle profile update
  Future<void> profileCompleteFill(BuildContext context) async {
    final profileModel = UploadProfileModel();
    isLoading.value = true;

    try {
      final response = await UploadProfileModel.profileComplete(
          profileModel, selectedImages);
      if (response["status"] == true) {
        print('Photo Upload Successful: ${response['data']}');
        editProfileController.userDetails(context).then((value) {
          final photoUrl = editProfileController.member?.member?.Photo1;
          if (photoUrl != null && photoUrl.isNotEmpty) {
            APIs.updateUserImage("http://devoteematrimony.aks.5g.in/$photoUrl");
          }
        });
        Get.offAndToNamed('/packageInfo');
        // flowController.Flow(context, 11);
        Dialogs.showSnackbar(context, "Photo Upload Successfully!");
      } else {
        print('Photo Upload failed: ${response['message']}');

        Dialogs.showSnackbar(context, 'Photo Upload failed!');
      }
    } catch (e) {
      print('Photo Upload failed: $e');

      Dialogs.showSnackbar(context, 'Photo Upload failed!');
    } finally {
      isLoading.value = false;
    }
  }

  // Method to pick images from the gallery
  Future<void> pickImagesFromGallery() async {
    final picker = ImagePicker();
    try {
      final List<XFile>? pickedFiles = await picker.pickMultiImage(
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        selectedImages.clear();

        if (pickedFiles.length <= 5) {
          for (var file in pickedFiles) {
            await cropAndAddImage(File(file.path));
          }
          Get.toNamed("/showImage");
        } else {
          print('You can only select up to 5 images.');
          // CustomDialog.show(
          //   Get.context!,
          //   'Error',
          //   'You can only select up to 5 images.',
          //   dialogType: DialogType.error,
          // );
          Navigator.of(Get.context!).pop();
          Dialogs.showSnackbar(
              Get.context!, 'You can only select up to 5 images.');
        }
      } else {
        print('No images selected.');

        Navigator.of(Get.context!).pop();
        Dialogs.showSnackbar(Get.context!, 'No images selected.');
      }
    } catch (e) {
      print('Error while selecting images: $e');
      Navigator.of(Get.context!).pop();
      Dialogs.showSnackbar(Get.context!, 'Error while selecting images: $e');
    }
  }

  // Method to pick image from the camera
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        if (selectedImages.length < 5) {
          await cropAndAddImage(File(pickedFile.path));
          Get.toNamed("/showImage");
        } else {
          print('You can only select up to 5 images.');

          Navigator.of(Get.context!).pop();
          Dialogs.showSnackbar(
              Get.context!, 'You can only select up to 5 images.');
        }
      } else {
        Navigator.of(Get.context!).pop();
        Dialogs.showSnackbar(Get.context!, 'No image selected.');
        print('No image selected.');
      }
    } catch (e) {
      print('Error while selecting image: $e');
      Navigator.of(Get.context!).pop();
      Dialogs.showSnackbar(Get.context!, 'Error while selecting image: $e');
    }
  }

  // Method to crop and add the image to the selectedImages list
  Future<void> cropAndAddImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 4, ratioY: 5),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true,
        ),
      ],
    );

    if (croppedFile != null) {
      selectedImages.add(File(croppedFile.path));
    } else {
      print('Image cropping canceled.');
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text('Image cropping canceled.'),
      ));
    }
  }
}
