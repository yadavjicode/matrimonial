import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HighestQualController extends GetxController {
  var selectedItem = RxnString();
  var HighestLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHighestList();
  }

  List<String> getHighestList() {
    return HighestLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchHighestList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.highestQualUrl}';

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
          List<String> fetchedHighest = List<String>.from(data['data']);
          HighestLists.assignAll(fetchedHighest);
          print(fetchedHighest);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print(
            'Failed to fetch highest qualification list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching highest qualification list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
