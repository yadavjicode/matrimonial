import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/horoscope_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class HoroscopeDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  HoroscopeDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  HoroscopeDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> horoscopeDetails(BuildContext context, String timeHoroscope,
      String stateHoroscope, String cityHoroscope) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.horoscopeDetails(
          timeHoroscope, stateHoroscope, cityHoroscope);
      Get.toNamed('/profile');
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
