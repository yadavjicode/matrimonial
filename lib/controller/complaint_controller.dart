import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:devotee/model/complaint_model.dart';
import 'package:devotee/model/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ComplaintController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ComplaintModel? _member;
  var isLoading = false.obs;
  String? _error;
  ComplaintModel? get member => _member;
  String? get error => _error;

  Future<void> complaint(
    BuildContext context,
    String compalint,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Complaint(compalint);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColors.primaryColor,
      //   content: Text(
      //     '${member?.message}',
      //     style: TextStyle(color: AppColors.constColor),
      //   ),
      // ));
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
