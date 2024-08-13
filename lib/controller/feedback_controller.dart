import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:devotee/model/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class FeedbackController with ChangeNotifier {
  final ApiService apiService = ApiService();
  FeedbackModel? _member;
  var isLoading = false.obs;
  String? _error;
  FeedbackModel? get member => _member;
  String? get error => _error;

  Future<void> feedback(
    BuildContext context,
    String feedback,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Feedback(feedback);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColors.primaryColor,
      //   content: Text(
      //     '${member?.message}',
      //     style: TextStyle(color: AppColors.constColor),
      //   ),
      // ));
      //Get.offAndToNamed('/dashboard');
      Navigator.pop(context);
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade200,
        content: Text(
          '${_error}',
          style: TextStyle(color: Colors.black),
        ),
      ));
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
