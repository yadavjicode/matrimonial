import 'package:devotee/model/basic_details_model.dart';
import 'package:devotee/model/contact_details_model.dart';
import 'package:devotee/model/location_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class LocationDetailsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  LocationDetailsModel? _member;
  var isLoading = false.obs;
  String? _error;
  LocationDetailsModel? get member => _member;
  String? get error => _error;

  Future<void> locationDetails(
      BuildContext context,
      String country,
      String residence,
      String permanentHouse,
      String permanentState,
      String permanentcity,
      String permanentPincode,
      String temporaryState,
      String temporaryCity,
      String temporaryPincode,
      String referARelation,
      String referAName,
      String referAEmail,
      String referAMobileno,
      String referBRelation,
      String referBName,
      String referBEmail,
      String referBMobileno) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.LocationDetails(
          country,
          residence,
          permanentHouse,
          permanentState,
          permanentcity,
          permanentPincode,
          temporaryState,
          temporaryCity,
          temporaryPincode,
          referARelation,
          referAName,
          referAEmail,
          referAMobileno,
          referBRelation,
          referBName,
          referBEmail,
          referBMobileno);
      Get.toNamed('/education');
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
