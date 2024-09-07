import 'package:devotee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
//  }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }
// }

class ComplexionController extends GetxController {
  var selectedItem = RxnString();

  static List<String> complexionColors() {
    return [
      'Fair',
      'Medium',
      'Olive',
      'Brown',
      'Dark',
    ];
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}

class ProfessionsController extends GetxController {
  var selectedItem = RxnString();

  static List<String> profession() {
    return [
      "Doctor",
      "Nurse",
      "Pharmacist",
      "Dentist",
      "Physical Therapist",
      "Radiologist",
      "Medical Lab Technician",
      "Paramedic",
      "Civil Engineer",
      "Mechanical Engineer",
      "Electrical Engineer",
      "Software Engineer",
      "Chemical Engineer",
      "Environmental Engineer",
      "Biomedical Engineer",
      "Aerospace Engineer",
      "Software Developer",
      "Data Scientist",
      "IT Manager",
      "Systems Analyst",
      "Cybersecurity Specialist",
      "Network Administrator",
      "Database Administrator",
      "Web Developer",
      "Teacher",
      "Professor",
      "School Counselor",
      "Librarian",
      "Education Administrator",
      "Special Education Teacher",
      "Curriculum Developer",
      "Accountant",
      "Financial Analyst",
      "Marketing Manager",
      "Human Resources Manager",
      "Management Consultant",
      "Sales Manager",
      "Real Estate Agent",
      "Project Manager",
      "Graphic Designer",
      "Writer/Author",
      "Actor/Actress",
      "Musician",
      "Film Director",
      "Photographer",
      "Fashion Designer",
      "Animator",
      "Lawyer",
      "Paralegal",
      "Judge",
      "Police Officer",
      "Firefighter",
      "Social Worker",
      "Public Relations Specialist",
      "Urban Planner",
      "Biologist",
      "Chemist",
      "Physicist",
      "Environmental Scientist",
      "Geologist",
      "Research Scientist",
      "Lab Technician",
      "Meteorologist",
      "Electrician",
      "Plumber",
      "Carpenter",
      "Mechanic",
      "Welder",
      "HVAC Technician",
      "Machinist",
      "Construction Worker",
      "Chef",
      "Restaurant Manager",
      "Hotel Manager",
      "Event Planner",
      "Travel Agent",
      "Flight Attendant",
      "Barista",
      "Housekeeper",
      "Journalist",
      "Editor",
      "Public Relations Specialist",
      "Radio/TV Broadcaster",
      "Content Creator",
      "Copywriter",
      "Advertising Specialist",
      "Personal Trainer",
      "Sports Coach",
      "Athletic Trainer",
      "Physical Education Teacher",
      "Sports Analyst",
      "Nutritionist",
      "Yoga Instructor"
          "other"
    ];
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}

// class ProfessionController extends GetxController {
//   var selectedItem = RxnString();
//   var professionLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProfessionList();
//   }

//   List<String> getProfessionList() {
//     return professionLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchProfessionList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.profession_Url}';

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
//           List<String> fetchedprofessions = List<String>.from(data['data']);
//           professionLists.assignAll(fetchedprofessions);
//           print(fetchedprofessions);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch Profession list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching Profession list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class ProfessionQualController extends GetxController {
//   var selectedItem = RxnString();
//   var professionQualLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProfessionQualList();
//   }

//   List<String> getProfessionQualList() {
//     return professionQualLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchProfessionQualList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl =
//           '${ApiConstants.baseUrl}${ApiConstants.professional_Qual_Url}';

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
//           List<String> fetchedprofessionsQual = List<String>.from(data['data']);
//           professionQualLists.assignAll(fetchedprofessionsQual);
//           print(fetchedprofessionsQual);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch Profession list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching Profession list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class HighestQualController extends GetxController {
//   var selectedItem = RxnString();
//   var HighestLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchHighestList();
//   }

//   List<String> getHighestList() {
//     return HighestLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchHighestList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.highest_Qual_Url}';

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
//           List<String> fetchedHighest = List<String>.from(data['data']);
//           HighestLists.assignAll(fetchedHighest);
//           print(fetchedHighest);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print(
//             'Failed to fetch highest qualification list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching highest qualification list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class IncomeController extends GetxController {
//   var selectedItem = RxnString();
//   var IncomeLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchIncomeList();
//   }

//   List<String> getIncomeList() {
//     return IncomeLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchIncomeList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl = '${ApiConstants.baseUrl}${ApiConstants.income_Url}';

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
//           List<String> fetchedIncome = List<String>.from(data['data']);
//           IncomeLists.assignAll(fetchedIncome);
//           print(fetchedIncome);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch income list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching income list: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// class MotherTongueController extends GetxController {
//   var selectedItem = RxnString();
//   var MotherTongueLists = <String>[].obs;
//   var isLoading = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchMotherTongueList();
//   }

//   List<String> getMotherTongueList() {
//     return MotherTongueLists.toList();
//   }

//   void selectItem(String? value) {
//     selectedItem.value = value;
//   }

//   void fetchMotherTongueList() async {
//     isLoading.value = true;
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       String apiUrl =
//           '${ApiConstants.baseUrl}${ApiConstants.mother_tongue_Url}';

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
//           List<String> fetchedIncome = List<String>.from(data['data']);
//           MotherTongueLists.assignAll(fetchedIncome);
//           print(fetchedIncome);
//         } else {
//           // Handle API response status false
//         }
//       } else {
//         // Handle non-200 status code
//         print('Failed to fetch MotherTongue list: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle fetch error
//       print('Error fetching MotherTongue list: $e');
//     } finally {
//       isLoading.value = false;
//     }
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

class NumberController extends GetxController {
  var selectedItem = RxnString();

  static List<String> NumberList() {
    return ["1", "2", "3", "4", "5"];
  }

  void selectItem(String? value) {
    selectedItem.value = value;
  }
}
