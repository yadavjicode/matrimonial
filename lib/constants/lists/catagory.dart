import 'package:devotee/utils/constants.dart';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SubCastController extends GetxController {
  final CastController castController = Get.find<CastController>();
  final ReligionsController religionController =
      Get.find<ReligionsController>();

  var selectedItem = Rxn<String>();
  var subCastLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(castController.selectedItemId, (_) {
      fetchSubCastList();
    });
    
  }

  List<String> getSubCastList() {
    return subCastLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchSubCastList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.subCastUrl}';

      final selectedCastId = castController.selectedItemId.value;
      final selectedReligionId = religionController.selectedItemId.value;

      if (selectedCastId == null || selectedReligionId == null) {
        print('No cast or religion selected');
        subCastLists.clear();
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'caste_id': selectedCastId,
          'religion_id': selectedReligionId,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedSubCasts =
              List<String>.from(data['data'].map((item) => item['name']));
          subCastLists.assignAll(fetchedSubCasts);
          print(fetchedSubCasts);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch sub-cast list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching sub-cast list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CastController extends GetxController {
  final ReligionsController religionController =
      Get.find<ReligionsController>();
  var selectedItem = Rxn<String>();
  var selectedItemId = Rxn<int>();
  var castLists = <Map<String, dynamic>>[].obs; // Store maps of {id, name}
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(religionController.selectedItemId, (_) {
      fetchCastList();
    });
  }

  List<String> getCastNames() {
    return castLists.map((item) => item['name'] as String).toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
    final selectedItemData =
        castLists.firstWhere((item) => item['name'] == value, orElse: () => {});
    selectedItemId.value = selectedItemData['id'];
  }

  void fetchCastList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.castUrl}';

      final selectedReligionId = religionController.selectedItemId.value;
      if (selectedReligionId == null) {
        print('No religion selected');
        castLists.clear();
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'religion': selectedReligionId,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<Map<String, dynamic>> fetchedCasts =
              List<Map<String, dynamic>>.from(data['data']
                  .map((item) => {'id': item['id'], 'name': item['name']}));
          castLists.assignAll(fetchedCasts);
          print(fetchedCasts);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch cast list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching cast list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class ReligionsController extends GetxController {
  var selectedItem = RxnString();
  var selectedItemId = RxnInt();
  var religionsLists = <Map<String, dynamic>>[].obs; // Change to a list of maps
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchReligionList();
  }

  List<String> getReligionNames() {
    return religionsLists.map((item) => item['name'].toString()).toList();
  }

  void selectItem(String? value) {
  selectedItem.value = value;
  
  // Use orElse to handle the case where no matching item is found
  selectedItemId.value = religionsLists
      .firstWhere(
        (item) => item['name'] == value, 
        orElse: () => {'id': null}, // Provide a default value if no match is found
      )['id'];
}
  void fetchReligionList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.religionUrl}';
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<Map<String, dynamic>> fetchedReligions =
              List<Map<String, dynamic>>.from(data['data']);
          religionsLists.assignAll(fetchedReligions);
          print(fetchedReligions);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch religion list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching religion list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
