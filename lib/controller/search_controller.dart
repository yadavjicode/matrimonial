import 'package:devotee/constants/widget/Snackbar.dart';
import 'package:devotee/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';
import 'package:flutter/cupertino.dart';
import '../utils/connection_check/connectivity_service.dart';

class SearchsController extends GetxController {
  final ApiService apiService = ApiService();
  var searchs = <Data>[].obs;
  SearchsModel? _member;
  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  SearchsModel? get member => _member;
  var status = 'all'.obs;
  final ConnectivityService connectivityService =
      Get.put(ConnectivityService());

  String getAge(String ageStr) {
    Map<String, String> monthMap = {};

    // Populate the map with ages from 18 to 50
    for (int i = 18; i <= 50; i++) {
      monthMap["$i Yrs"] = i.toString();
    }

    // Convert the input to the corresponding age number
    return monthMap[ageStr] ?? "";
  }

  String convertToFeetAndInches(double value) {
    int feet = value.floor(); // Get the whole number part as feet
    double decimalPart = value - feet; // Get the decimal part
    int inches =
        (decimalPart * 12).round(); // Convert the decimal part to inches

    return '${feet}ft ${inches}in';
  }

  // Function to fetch matches
  Future<void> search(
      BuildContext context,
      String name,
      String profession,
      String ageFrom,
      String ageTo,
      String heightFrom,
      String heightTo,
      String maritalStatus,
      String religion,
      String caste,
      String country,
      String state,
      String city,
      String education,
      String profilePer,
      String sortby) async {
    if (isLoading.value || !hasMore.value) return; // Prevent duplicate requests

    isLoading.value = true;
    try {
      final response = await apiService.search(
          currentPage.value,
          name,
          profession,
          ageFrom,
          ageTo,
          heightFrom,
          heightTo,
          maritalStatus,
          religion,
          caste,
          country,
          state,
          city,
          education,
          profilePer,
          sortby);
      final searchModel = response;
      _member = response;

      if (searchModel.status == "true") {
        final searchData = searchModel.responseData;
        if (searchData != null) {
          // Filter out duplicates by checking if they already exist in `searchs`
          final newSearchData = searchData.data?.where((newItem) {
            return !searchs
                .any((existingItem) => existingItem.matriID == newItem.matriID);
          }).toList();
          if (currentPage.value == 1) {
            searchs.value = newSearchData ?? []; // Load initial data
          } else {
            searchs.addAll(newSearchData ?? []); // Append new page data
          }
          currentPage.value = searchData.currentPage ?? 1;
          lastPage.value = searchData.lastPage ?? 1;
          hasMore.value = searchData.currentPage < searchData.lastPage;
        }
      }
    } catch (e) {
      // Handle exceptions
      print("Error fetching matches: $e");
      if (!connectivityService.isConnected.value) {
        Dialogs.showSnackbar(context, "No internet connection!");
      } else {
        Dialogs.showSnackbar(context,
            "Something went wrong while fetching data. Please try again later!");
      }
    } finally {
      isLoading.value = false;
    }
  }

  // Function to load the next page
  void loadNextPage(
      BuildContext context,
      String name,
      String profession,
      String ageFrom,
      String ageTo,
      String heightFrom,
      String heightTo,
      String maritalStatus,
      String religion,
      String caste,
      String country,
      String state,
      String city,
      String education,
      String profilePer,
      String sortby) {
    if (hasMore.value) {
      currentPage.value++;
      search(
          context,
          name,
          profession,
          ageFrom,
          ageTo,
          heightFrom,
          heightTo,
          maritalStatus,
          religion,
          caste,
          country,
          state,
          city,
          education,
          profilePer,
          sortby);
    }
  }

  // Function to reset pagination and data
  void reset(
      BuildContext context,
      String name,
      String profession,
      String ageFrom,
      String ageTo,
      String heightFrom,
      String heightTo,
      String maritalStatus,
      String religion,
      String caste,
      String country,
      String state,
      String city,
      String education,
      String profilePer,
      String sortby) {
    searchs.clear();
    currentPage.value = 1;
    lastPage.value = 1;
    hasMore.value = true;
    search(
        context,
        name,
        profession,
        ageFrom,
        ageTo,
        heightFrom,
        heightTo,
        maritalStatus,
        religion,
        caste,
        country,
        state,
        city,
        education,
        profilePer,
        sortby);
  }
}
