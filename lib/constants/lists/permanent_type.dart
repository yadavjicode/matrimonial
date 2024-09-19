import 'package:devotee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PermanentTypeController extends GetxController {
  var selectedItem = RxnString();
  var permanentLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPermanentList();
  }

  List<String> getPermanentList() {
    return permanentLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchPermanentList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl =
          '${ApiConstants.baseUrl}${ApiConstants.permanenttypeUrl}';

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
          List<String> fetchedPermanent = List<String>.from(data['data']);
          permanentLists.assignAll(fetchedPermanent);
          print(fetchedPermanent);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch Permanent list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching Permanent list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
