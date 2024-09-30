import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/suggestion_model.dart';
import 'package:devotee/model/testimonial_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class TestimonialController with ChangeNotifier {
  final ApiService apiService = ApiService();
  TestimonialModel? _member;
  var isLoading = false.obs;
  String? _error;
  TestimonialModel? get member => _member;
  String? get error => _error;

  Future<void> testimonial(
    BuildContext context,
   
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Testimonial();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColors.primaryColor,
      //   content: Text(
      //     '${member?.message}',
      //     style: TextStyle(color: AppColors.constColor),
      //   ),
      // ));
      
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
      Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
