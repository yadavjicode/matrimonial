import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DietController extends GetxController {
  var selectedItem = RxnString();
  var dietLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDietList();  
  }

  List<String> getDietList() {
    return dietLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchDietList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.dietUrl}';

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
          List<String> fetchedDiets = List<String>.from(data['data']);
          dietLists.assignAll(fetchedDiets);
          print(fetchedDiets);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch diet list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching diet list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
