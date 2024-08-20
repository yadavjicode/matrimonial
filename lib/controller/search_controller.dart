import 'package:devotee/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class SearchsController with ChangeNotifier {
  final ApiService apiService = ApiService();
  SearchsModel? _member;
  var isLoading = false.obs;
  String? _error;
  SearchsModel? get member => _member;
  String? get error => _error;

String getAge(String ageStr) {
  Map<String, String> monthMap = {};

  // Populate the map with ages from 18 to 50
  for (int i = 18; i <= 50; i++) {
    monthMap["$i Yrs"] = i.toString();
  }

  // Convert the input to the corresponding age number
  return monthMap[ageStr] ?? "Invalid age";
}

String convertToFeetAndInches(double value) {
  int feet = value.floor(); // Get the whole number part as feet
  double decimalPart = value - feet; // Get the decimal part
  int inches = (decimalPart * 12).round(); // Convert the decimal part to inches

  return '${feet}ft ${inches}in';
}

  Future<void> search(
    BuildContext context,
    String ageFrom,
    String ageTo,
    String heightFrom,
    String heightTo,
    String maritalStatus,
    String religion,
    String caste,
    String country,
    String state,
    String city,
    String education,
  ) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.Search(
          
          ageFrom,
          ageTo,
          heightFrom,
          heightTo,
          maritalStatus,
          religion,
          caste,
          country,
          state,
          city,
          education
          );
      Get.toNamed('/searchresult' ,arguments: {"ageFrom":ageFrom,"ageTo":ageTo,"heightFrom":heightFrom,"heightTo":heightTo
     , "maritalStatus":maritalStatus,"religion":religion,"caste":caste,"country":country,"state":state,"city":city,"education":education});
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
