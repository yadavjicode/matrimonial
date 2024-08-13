import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/professional_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ProfessionalDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ProfessionalDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ProfessionalDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> professionalDetails(
      BuildContext context,
      String profesion,
      String working,
      String empolyment,
      String workingState,
      String workingCity,
      String pincode,
      String annualSalary) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.professionalDetails(profesion, working,
          empolyment, workingState, workingCity, pincode, annualSalary);
      Get.toNamed('/devotion');
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
