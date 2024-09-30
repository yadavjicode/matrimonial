import 'package:devotee/constants/widget/Snackbar.dart';
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

      // ignore: use_build_context_synchronously
      Dialogs.showSnackbarPop(context, '${member?.message}');
      
    } catch (e) {
      _error = e.toString();
      print(_error);

     Dialogs.showSnackbar(context, '${_error}');
    
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
