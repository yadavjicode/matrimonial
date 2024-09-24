import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class WeightController extends GetxController {
  var selectedItem = RxnString();
  var WeightLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeightList();
  }

  List<String> getWeightList() {
    return WeightLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchWeightList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.weightUrl}';

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
          List<String> fetchedWeight = List<String>.from(data['data']);
          WeightLists.assignAll(fetchedWeight);
          print(fetchedWeight);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch Weight list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching Weight list: $e');
    } finally {
      isLoading.value = false;
    }
  }

  

}

class WeightConsController extends GetxController {
  var selectedItem = RxnString();

   List<String> getWeight() {
    List<String> Weight = [];
    for (int weight = 35; weight <= 135; weight++) {
      Weight.add('$weight KG');
    }
    return Weight;
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

int weightInt(String weight){
    String numericWeight = weight.replaceAll(RegExp(r'[^0-9]'), '');
    return int.parse(numericWeight);

  }

}
