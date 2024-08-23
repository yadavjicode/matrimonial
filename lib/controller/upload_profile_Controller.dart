import 'dart:io';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/model/upload_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class UploadProfileController extends GetxController {
  var isLoading = false.obs;
  var selectedImages = <File>[].obs;
  final FlowController flowController=Get.put(FlowController());

  Future<void> profileCompleteFill(BuildContext context) async {
    final profileModel = UploadProfileModel();
    isLoading.value = true;

    try {
      final response = await UploadProfileModel.profileComplete(
          profileModel, selectedImages);
      if (response["status"] == true) {
        print('Profile update successful: ${response['data']}');
        flowController.Flow(context, 12);
        // Get.toNamed('/partner');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey.shade200,
          content: Text(
            'Profile update successful: ${response['data']}',
            style: TextStyle(color: Colors.black),
          ),
        ));
      } else {
        print('Profile update failed: ${response['message']}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Profile update failed: ${response['message']}'),
        ));
      }
    } catch (e) {
      print('Profile update failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Profile update failed: $e'),
      ));
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImagesFromGallery() async {
    final picker = ImagePicker();
    try {
      final List<XFile>? pickedFiles = await picker.pickMultiImage(
        imageQuality: 100,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        // Clear the previous selection if necessary
        selectedImages.clear();

        Get.toNamed("/showImage");
        
        // Add new images
        if (pickedFiles.length <= 5) {
          for (var file in pickedFiles) {
            selectedImages.add(File(file.path));
          }
        } else {
          print('You can only select up to 5 images.');
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text('You can only select up to 5 images.'),
          ));
        }
      } else {
        print('No images selected.');
        ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
          content: Text('No images selected.'),
        ));
      }
    } catch (e) {
      print('Error while selecting images: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text('Error while selecting images: $e'),
      ));
    }
  }

  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        if (selectedImages.length < 5) {
          selectedImages.add(File(pickedFile.path));
           Get.toNamed("/showImage");
        } else {
          print('You can only select up to 5 images.');
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text('You can only select up to 5 images.'),
          ));
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error while selecting image: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text('Error while selecting image: $e'),
      ));
    }
  }
}
