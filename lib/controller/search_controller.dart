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

  Future<void> search(
    BuildContext context,
    String gender,
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
          gender,
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
          education);
      Get.toNamed('/searchresult');
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
