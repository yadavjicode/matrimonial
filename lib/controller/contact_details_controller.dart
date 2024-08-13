import 'package:devotee/model/basic_details_model.dart';
import 'package:devotee/model/contact_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class ContactDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  ContactDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  ContactDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> contactDetails(BuildContext context, String mobileno,
      String email, String instaid) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.contactDetails(mobileno, email, instaid);
      Get.toNamed('/location');
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
