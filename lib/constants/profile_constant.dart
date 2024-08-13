import 'package:devotee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile {
  final String topic;
  final Image image;

  Profile({
    required this.topic,
    required this.image,
  });
}

final List<Profile> profiles = [
  Profile(
    topic: "Myself",
    image: Image.asset('assets/images/icons/user.png'),
  ),
  Profile(
      topic: "My Relative",
      image: Image.asset('assets/images/icons/relative.png')),
  Profile(topic: "My Son", image: Image.asset('assets/images/icons/male.png')),
  Profile(
      topic: "My Daughter",
      image: Image.asset('assets/images/icons/female.png')),
  Profile(
      topic: "My Brother", image: Image.asset('assets/images/icons/Headm.png')),
  Profile(
      topic: "My Sister", image: Image.asset('assets/images/icons/headf.png')),
  Profile(topic: "My Friend", image: Image.asset('assets/images/myfriend.png')),
  Profile(
      topic: "My Counselee", image: Image.asset('assets/images/counsalee.png')),
];

class Gender {
  final String gender;
  final Image image;

  Gender({required this.gender, required this.image});
}

final List<Gender> genders = [
  Gender(
    gender: "Male",
    image: Image.asset('assets/images/icons/male.png'),
  ),
  Gender(
    gender: "Female",
    image: Image.asset('assets/images/icons/female.png'),
  ),
];

class Looking {
  final String gender;
  final Image image;

  Looking({required this.gender, required this.image});
}

final List<Looking> looking = [
  Looking(
    gender: "Groom",
    image: Image.asset('assets/images/icons/male.png'),
  ),
  Looking(
    gender: "Bride",
    image: Image.asset('assets/images/icons/female.png'),
  ),
];



// class HeightController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> heightTypes() {
//     List<String> heights = [];
//     for (int feet = 3; feet <= 7; feet++) {
//       for (int inches = 0; inches < 12; inches++) {
//         if (inches == 0) {
//           heights.add('$feet ft');
//         } else {
//           heights.add('$feet ft $inches inch');
//         }
//       }
//     }
//     return heights;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class MartialController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> martialStatus() {
//     List<String> status = [
//       'Un Married',
//       'Married',
//       'Widow/Widower',
//       'Divorced',
//       'Separated'
//     ];
//     return status;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class WeightController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> weightList() {
//     List<String> weights = [];
//     for (int i = 30; i <= 120; i++) {
//       weights.add('$i kg');
//     }
//     return weights;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class DietController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> DietList() {
//     List<String> status = [
//       "Vegetarian",
//       "Vegan",
//       "Pescatarian",
//       "Keto",
//       "Paleo",
//       "Mediterranean",
//       "Gluten-Free",
//       "Low-Carb",
//       "Low-Fat",
//       "High-Protein",
//     ];
//     return status;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// // class ReligionController extends GetxController {
// //   var selectedItem = RxnString();

// //   static List<String> religionStatus() {
// //     List<String> religion = [
// //       "Hindu",
// //       "Islam",
// //       "Christian",
// //       "Sikh",
// //       "Jain",
// //       "Other",
// //     ];
// //     return religion;
// //   }

// //   void selectItem(String? value) {
// //     selectedItem.value = value;
// //   }
// // }

// class DayController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> DayList() {
//     List<String> day = [];
//     for (int i = 1; i <= 31; i++) {
//       day.add("$i");
//     }
//     return day;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class MonthController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> MonthList() {
//     List<String> religion = [
//       "January",
//       "February",
//       "March",
//       "April",
//       "May",
//       "June",
//       "July",
//       "August",
//       "September",
//       "October",
//       "November",
//       "December"
//     ];
//     return religion;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class YearController extends GetxController {
//   var selectedYear = RxnString();

//   static List<String> yearList() {
//     int currentYear = DateTime.now().year;
//     List<String> years = [];
//     for (int i = currentYear - 18; i >= currentYear - 60; i--) {
//       years.add(i.toString());
//     }
//     return years;
//   }

//   void selectYear(String? value) {
//     selectedYear.value = value;
//   }
// }

// class CountryController extends GetxController {
//   var selectedItem = RxnString();
//   var countryLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCountryList();
//   }

//   List<String> getCountryList() {
//     return countryLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchCountryList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.country_Url}';

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           // 'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedCountries =
//               List<String>.from(data['data'].map((item) => item['country']));
//           countryLists.assignAll(fetchedCountries);
//           print(fetchedCountries);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch country list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching country list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class StateControllerPermanent extends GetxController {
//   final CountryController countryController = Get.find<CountryController>();
//   var selectedItem = RxnString();
//   var stateLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen for changes in the selected country and fetch state list accordingly
//     ever(countryController.selectedItem, (_) {
//       fetchStateList();
//     });
//   }

//   List<String> getStateList() {
//     return stateLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchStateList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.state_url}';

//       final selectedCountry = countryController.selectedItem.value;
//       if (selectedCountry == null) {
//         print('No country selected');
//         stateLists.clear(); // Clear the state list if no country is selected
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'countryarray': [selectedCountry],
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedStates =
//               List<String>.from(data['data'].map((item) => item['state']));
//           stateLists.assignAll(fetchedStates);
//           print(fetchedStates);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch state list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching state list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class StateControllerTemporary extends GetxController {
//   final CountryController countryController = Get.find<CountryController>();
//   var selectedItem = RxnString();
//   var stateLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen for changes in the selected country and fetch state list accordingly
//     ever(countryController.selectedItem, (_) {
//       fetchStateList();
//     });
//   }

//   List<String> getStateList() {
//     return stateLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchStateList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.state_url}';

//       final selectedCountry = countryController.selectedItem.value;
//       if (selectedCountry == null) {
//         print('No country selected');
//         stateLists.clear(); // Clear the state list if no country is selected
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'countryarray': [selectedCountry],
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedStates =
//               List<String>.from(data['data'].map((item) => item['state']));
//           stateLists.assignAll(fetchedStates);
//           print(fetchedStates);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch state list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching state list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class CityControllerTemporary extends GetxController {
//   final StateControllerTemporary stateController =
//       Get.find<StateControllerTemporary>();
//   var selectedItem = RxnString();
//   var cityLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen for changes in the selected country and fetch state list accordingly
//     ever(stateController.selectedItem, (_) {
//       fetchCityList();
//     });
//   }

//   List<String> getCityList() {
//     return cityLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchCityList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.city_Url}';

//       final selectedState = stateController.selectedItem.value;
//       if (selectedState == null) {
//         print('No state selected');
//         cityLists.clear(); // Clear the state list if no country is selected
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'state': selectedState,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedCitys =
//               List<String>.from(data['data'].map((item) => item['city']));
//           cityLists.assignAll(fetchedCitys);
//           print(fetchedCitys);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch city list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching city list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class CityControllerPermanent extends GetxController {
//   final StateControllerPermanent stateController =
//       Get.find<StateControllerPermanent>();
//   var selectedItem = RxnString();
//   var cityLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Listen for changes in the selected country and fetch state list accordingly
//     ever(stateController.selectedItem, (_) {
//       fetchCityList();
//     });
//   }

//   List<String> getCityList() {
//     return cityLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchCityList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.city_Url}';

//       final selectedState = stateController.selectedItem.value;
//       if (selectedState == null) {
//         print('No state selected');
//         cityLists.clear(); // Clear the state list if no country is selected
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'state': selectedState,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedCitys =
//               List<String>.from(data['data'].map((item) => item['city']));
//           cityLists.assignAll(fetchedCitys);
//           print(fetchedCitys);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch city list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching city list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class SubCastController extends GetxController {
//   final CastController castController = Get.find<CastController>();
//   final ReligionsController religionController =
//       Get.find<ReligionsController>();

//   var selectedItem = Rxn<String>();
//   var subCastLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     ever(castController.selectedItemId, (_) {
//       fetchSubCastList();
//     });
//     ever(religionController.selectedItemId, (_) {
//       fetchSubCastList();
//     });
//   }

//   List<String> getSubCastList() {
//     return subCastLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchSubCastList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.sub_cast_Url}';

//       final selectedCastId = castController.selectedItemId.value;
//       final selectedReligionId = religionController.selectedItemId.value;

//       if (selectedCastId == null || selectedReligionId == null) {
//         print('No cast or religion selected');
//         subCastLists.clear();
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'caste_id': selectedCastId,
//           'religion_id': selectedReligionId,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<String> fetchedSubCasts =
//               List<String>.from(data['data'].map((item) => item['name']));
//           subCastLists.assignAll(fetchedSubCasts);
//           print(fetchedSubCasts);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch sub-cast list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching sub-cast list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class CastController extends GetxController {
//   final ReligionsController religionController =
//       Get.find<ReligionsController>();
//   var selectedItem = Rxn<String>();
//   var selectedItemId = Rxn<int>();
//   var castLists = <Map<String, dynamic>>[].obs; // Store maps of {id, name}
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     ever(religionController.selectedItemId, (_) {
//       fetchCastList();
//     });
//   }

//   List<String> getCastNames() {
//     return castLists.map((item) => item['name'] as String).toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//     final selectedItemData =
//         castLists.firstWhere((item) => item['name'] == value, orElse: () => {});
//     selectedItemId.value = selectedItemData['id'];
//   }

//   void fetchCastList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.cast_Url}';

//       final selectedReligionId = religionController.selectedItemId.value;
//       if (selectedReligionId == null) {
//         print('No religion selected');
//         castLists.clear();
//         return;
//       }

//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode({
//           'religion': selectedReligionId,
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<Map<String, dynamic>> fetchedCasts =
//               List<Map<String, dynamic>>.from(data['data']
//                   .map((item) => {'id': item['id'], 'name': item['name']}));
//           castLists.assignAll(fetchedCasts);
//           print(fetchedCasts);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch cast list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching cast list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class ReligionsController extends GetxController {
//   var selectedItem = RxnString();
//   var selectedItemId = RxnInt();
//   var religionsLists = <Map<String, dynamic>>[].obs; // Change to a list of maps
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchReligionList();
//   }

//   List<String> getReligionNames() {
//     return religionsLists.map((item) => item['name'].toString()).toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//     selectedItemId.value =
//         religionsLists.firstWhere((item) => item['name'] == value)['id'];
//   }

//   void fetchReligionList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.religion_Url}';
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Authorization': 'Bearer $token',
//           'Content-Type': 'application/json',
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['status'] == true) {
//           List<Map<String, dynamic>> fetchedReligions =
//               List<Map<String, dynamic>>.from(data['data']);
//           religionsLists.assignAll(fetchedReligions);
//           print(fetchedReligions);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch religion list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching religion list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class TittleController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> TittleList() {
//     List<String> tittle = [
//       "Mr.",
//       "Mrs.",
//       "Ms.",
//     ];
//     return tittle;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class MaritalController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> MaritalList() {
//     List<String> tittle = [
//       'Single',
//       'Married',
//       'Divorced',
//       'Widowed',
//       'Separated',
//       'Other',
//     ];
//     return tittle;
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class ResidenceTypeController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> residenceTypes() {
//     return [
//       'Visa',
//       'Student Visa',
//       'Permanent Residence',
//       'Temporary Residence',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class PermanentHouseTypeController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> houseTypes() {
//     return [
//       'Own',
//       'Rented',
//       'Leased',
//       'Company Provided',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class RelationController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> relationTypes() {
//     return [
//       'Father',
//       'Mother',
//       'Brother',
//       'Sister',
//       'Son',
//       'Daughter',
//       'Spouse',
//       'Partner',
//       'Friend',
//       'Colleague',
//       'Relative',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class ComplexionController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> complexionColors() {
//     return [
//       'Fair',
//       'Medium',
//       'Olive',
//       'Brown',
//       'Dark',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class ProfessionController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> profession() {
//     return [
//       "Doctor",
//       "Nurse",
//       "Pharmacist",
//       "Dentist",
//       "Physical Therapist",
//       "Radiologist",
//       "Medical Lab Technician",
//       "Paramedic",
//       "Civil Engineer",
//       "Mechanical Engineer",
//       "Electrical Engineer",
//       "Software Engineer",
//       "Chemical Engineer",
//       "Environmental Engineer",
//       "Biomedical Engineer",
//       "Aerospace Engineer",
//       "Software Developer",
//       "Data Scientist",
//       "IT Manager",
//       "Systems Analyst",
//       "Cybersecurity Specialist",
//       "Network Administrator",
//       "Database Administrator",
//       "Web Developer",
//       "Teacher",
//       "Professor",
//       "School Counselor",
//       "Librarian",
//       "Education Administrator",
//       "Special Education Teacher",
//       "Curriculum Developer",
//       "Accountant",
//       "Financial Analyst",
//       "Marketing Manager",
//       "Human Resources Manager",
//       "Management Consultant",
//       "Sales Manager",
//       "Real Estate Agent",
//       "Project Manager",
//       "Graphic Designer",
//       "Writer/Author",
//       "Actor/Actress",
//       "Musician",
//       "Film Director",
//       "Photographer",
//       "Fashion Designer",
//       "Animator",
//       "Lawyer",
//       "Paralegal",
//       "Judge",
//       "Police Officer",
//       "Firefighter",
//       "Social Worker",
//       "Public Relations Specialist",
//       "Urban Planner",
//       "Biologist",
//       "Chemist",
//       "Physicist",
//       "Environmental Scientist",
//       "Geologist",
//       "Research Scientist",
//       "Lab Technician",
//       "Meteorologist",
//       "Electrician",
//       "Plumber",
//       "Carpenter",
//       "Mechanic",
//       "Welder",
//       "HVAC Technician",
//       "Machinist",
//       "Construction Worker",
//       "Chef",
//       "Restaurant Manager",
//       "Hotel Manager",
//       "Event Planner",
//       "Travel Agent",
//       "Flight Attendant",
//       "Barista",
//       "Housekeeper",
//       "Journalist",
//       "Editor",
//       "Public Relations Specialist",
//       "Radio/TV Broadcaster",
//       "Content Creator",
//       "Copywriter",
//       "Advertising Specialist",
//       "Personal Trainer",
//       "Sports Coach",
//       "Athletic Trainer",
//       "Physical Education Teacher",
//       "Sports Analyst",
//       "Nutritionist",
//       "Yoga Instructor"
//           "other"
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class QualificationController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> qualifications() {
//     return [
//       'High School',
//       'Diploma',
//       'Bachelor\'s Degree',
//       'Master\'s Degree',
//       'Doctorate',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class IncomeController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> income() {
//     return [
//       "1 LPA - 2 LPA",
//       "2 LPA - 3 LPA",
//       "3 LPA - 4 LPA",
//       "4 LPA - 5 LPA",
//       "5 LPA - 6 LPA",
//       "6 LPA - 7 LPA",
//       "7 LPA - 8 LPA",
//       "8 LPA - 9 LPA",
//       "9 LPA - 10 LPA",
//       "10 LPA - 11 LPA",
//       "11 LPA - 12 LPA",
//       "12 LPA - 13 LPA",
//       "13 LPA - 14 LPA",
//       "14 LPA - 15 LPA",
//       "15 LPA - 16 LPA",
//       "16 LPA - 17 LPA",
//       "17 LPA - 18 LPA",
//       "18 LPA - 19 LPA",
//       "19 LPA - 20 LPA",
//       "20 LPA - 21 LPA",
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class EmploymentController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> employmentTypes() {
//     return [
//       'Private Sector',
//       'Government Sector',
//       'Self-employed',
//       'Freelancer',
//       'Unemployed',
//       'Student',
//       'Retired',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class LanguageController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> languageList() {
//     return [
//       'English',
//       'Spanish',
//       'French',
//       'German',
//       'Chinese',
//       'Japanese',
//       'Hindi',
//       'Other',
//     ];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

// class NumberController extends GetxController {
//   var selectedItem = RxnString();

//   static List<String> NumberList() {
//     return ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }
