import 'package:devotee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RelationController extends GetxController {
  var selectedItem = RxnString();
  var relationLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRelationList();
  }

  List<String> getRelationList() {
    return relationLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchRelationList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.relationUrl}';

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
          List<String> fetchedRelation = List<String>.from(data['data']);
          relationLists.assignAll(fetchedRelation);
          print(fetchedRelation);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch relation list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching relation list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
