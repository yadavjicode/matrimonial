import 'package:devotee/utils/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CountryController extends GetxController {
  var selectedItem = RxnString();
  var countryLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountryList();
  }

  List<String> getCountryList() {
    return countryLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchCountryList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.countryUrl}';

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
          List<String> fetchedCountries =
              List<String>.from(data['data'].map((item) => item['country']));
          countryLists.assignAll(fetchedCountries);
          print(fetchedCountries);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch country list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching country list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class StateControllerPermanent extends GetxController {
  final CountryController countryController = Get.find<CountryController>();
  var selectedItem = RxnString();
  var stateLists = <String>[].obs;
  var isLoading = false.obs;

  static String? Country;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the selected country and fetch state list accordingly
    ever(countryController.selectedItem, (_) {
      fetchStateList();
    });
  }

  List<String> getStateList() {
    return stateLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchStateList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.stateurl}';

      final selectedCountry = countryController.selectedItem.value;
      if (selectedCountry == null) {
        print('No country selected');
        stateLists.clear(); // Clear the state list if no country is selected
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'countryarray': [selectedCountry],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedStates =
              List<String>.from(data['data'].map((item) => item['state']));
          stateLists.assignAll(fetchedStates);
          print(fetchedStates);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch state list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching state list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class StateControllerTemporary extends GetxController {
  final CountryController countryController = Get.find<CountryController>();
  var selectedItem = RxnString();
  var stateLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the selected country and fetch state list accordingly
    ever(countryController.selectedItem, (_) {
      fetchStateList();
    });
  }

  List<String> getStateList() {
    return stateLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchStateList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.stateurl}';

      final selectedCountry = countryController.selectedItem.value;
      if (selectedCountry == null) {
        print('No country selected');
        stateLists.clear(); // Clear the state list if no country is selected
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'countryarray': [selectedCountry],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedStates =
              List<String>.from(data['data'].map((item) => item['state']));
          stateLists.assignAll(fetchedStates);
          print(fetchedStates);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch state list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching state list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CityControllerTemporary extends GetxController {
  final StateControllerTemporary stateController =
      Get.find<StateControllerTemporary>();
  var selectedItem = RxnString();
  var cityLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the selected country and fetch state list accordingly
    ever(stateController.selectedItem, (_) {
      fetchCityList();
    });
  }

  List<String> getCityList() {
    return cityLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchCityList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.cityUrl}';

      final selectedState = stateController.selectedItem.value;
      if (selectedState == null) {
        print('No state selected');
        cityLists.clear(); // Clear the state list if no country is selected
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'state': selectedState,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedCitys =
              List<String>.from(data['data'].map((item) => item['city']));
          cityLists.assignAll(fetchedCitys);
          print(fetchedCitys);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch city list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching city list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CityControllerPermanent extends GetxController {
  final StateControllerPermanent stateController =
      Get.find<StateControllerPermanent>();
  var selectedItem = RxnString();
  var cityLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Listen for changes in the selected country and fetch state list accordingly
    ever(stateController.selectedItem, (_) {
      fetchCityList();
    });
  }

  List<String> getCityList() {
    return cityLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchCityList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.cityUrl}';

      final selectedState = stateController.selectedItem.value;
      if (selectedState == null) {
        print('No state selected');
        cityLists.clear(); // Clear the state list if no country is selected
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'state': selectedState,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedCitys =
              List<String>.from(data['data'].map((item) => item['city']));
          cityLists.assignAll(fetchedCitys);
          print(fetchedCitys);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch city list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching city list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class StateController extends GetxController {
  var selectedItem = RxnString();
  var stateLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchStateList();
  }

  List<String> getStateList() {
    return stateLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchStateList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.stateurl}';

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'countryarray': "India",
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedStates =
              List<String>.from(data['data'].map((item) => item['state']));
          stateLists.assignAll(fetchedStates);
          print(fetchedStates);
          print(data);
        } else {
          print('API response status is false');
        }
      } else {
        print('Failed to fetch state list: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching state list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CityController extends GetxController {
  final StateController stateController = Get.find<StateController>();
  var selectedItem = RxnString();
  var cityLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(stateController.selectedItem, (_) {
      fetchCityList();
    });
  }

  List<String> getCityList() {
    return cityLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchCityList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.cityUrl}';

      final selectedState = stateController.selectedItem.value;
      if (selectedState == null) {
        print('No state selected');
        cityLists.clear();
        isLoading.value = false;
        return;
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'state': selectedState,
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedCities =
              List<String>.from(data['data'].map((item) => item['city']));
          cityLists.assignAll(fetchedCities);
          print(fetchedCities);
        } else {
          print('API response status is false');
        }
      } else {
        print('Failed to fetch city list: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching city list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}

class CountryCodeController extends GetxController {
  var selectedItem = RxnString();
  var countryCodeLists = <String>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCountryCodeList();
  }

  List<String> getCountryCodeList() {
    return countryCodeLists.toList();
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }

  void fetchCountryCodeList() async {
    isLoading.value = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.countryCodeUrl}';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $token',
          // 'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == true) {
          List<String> fetchedCountrieCode = List<String>.from(
              data['country_code'].map((item) => "+${item['phonecode']}"));
          countryCodeLists.assignAll(fetchedCountrieCode);
          print(fetchedCountrieCode);
        } else {
          // Handle API response status false
        }
      } else {
        // Handle non-200 status code
        print('Failed to fetch country code list: ${response.statusCode}');
      }
    } catch (e) {
      // Handle fetch error
      print('Error fetching country code list: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
