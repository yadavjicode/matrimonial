import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/model/suggestion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class SuggestionController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SuggestionModel? _member;
  var isLoading = false.obs;
  String? _error;
  SuggestionModel? get member => _member;
  String? get error => _error;

  Future<void> suggestion(
    BuildContext context,
    String suggestion,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Suggestion(suggestion);

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
