import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ResidenceTypeController extends GetxController {
  var selectedItem = RxnString();
  var residenceLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchResidenceList();
  }

  List<String> getResidenceList() {
    return residenceLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchResidenceList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl =
          '${ApiConstants.baseUrl}${ApiConstants.residence_type_Url}';

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
          List<String> fetchedResidence = List<String>.from(data['data']);
          residenceLists.assignAll(fetchedResidence);
          print(fetchedResidence);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch Residence list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching Residence list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
