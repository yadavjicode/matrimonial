import 'package:devotee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SmokeHabitController extends GetxController {
  var selectedItem = RxnString();
  var SmokeHabitLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSmokeHabitList();
  }

  List<String> getSmokeHabitList() {
    return SmokeHabitLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchSmokeHabitList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.smokehabitsUrl}';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedDrinkHabit = List<String>.from(data['data']);
          SmokeHabitLists.assignAll(fetchedDrinkHabit);
          print(fetchedDrinkHabit);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch SmokeHabit list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching SmokeHabit list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
