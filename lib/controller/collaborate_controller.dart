import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/collaborate_model.dart';
import 'package:devotee/model/suggestion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class CollaborateController with ChangeNotifier {
  final ApiService apiService = ApiService();
  CollaborateModel? _member;
  var isLoading = false.obs;
  String? _error;
  CollaborateModel? get member => _member;
  String? get error => _error;

  Future<void> collaborate(
    BuildContext context,
    String name,String phoneno,String email,String city,String state
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Collaborate(name, phoneno, email, city, state);

      // Show SnackBar and wait for it to be dismissed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.primaryColor,
        content: Text(
          '${member?.message}',
          style: TextStyle(color: AppColors.constColor),
          
        ),
        duration: Duration(seconds: 1)
      )).closed.then((_) {
        // After the SnackBar is dismissed, navigate back
        Navigator.pop(context);
      });

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
