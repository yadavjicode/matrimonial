import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HeightController extends GetxController {
  var selectedItem = RxnString();
  var HeightLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHeightList();
  }

  List<String> getHeightList() {
    return HeightLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchHeightList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.heightUrl}';

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
          List<String> fetchedHeight = List<String>.from(data['data']);
          HeightLists.assignAll(fetchedHeight);
          print(fetchedHeight);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch Height list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching Height list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
