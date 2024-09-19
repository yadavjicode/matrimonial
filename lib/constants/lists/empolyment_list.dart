import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EmpolymentController extends GetxController {
  var selectedItem = RxnString();
  var empolymentLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmpolymentList();
  }

  List<String> getEmpolymentList() {
    return empolymentLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchEmpolymentList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.employmentUrl}';

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
          List<String> fetchedEmpolyment = List<String>.from(data['data']);
          empolymentLists.assignAll(fetchedEmpolyment);
          print(fetchedEmpolyment);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch Empolyment list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching Empolyment list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
