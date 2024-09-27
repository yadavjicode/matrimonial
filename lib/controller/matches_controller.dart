import 'package:devotee/api_service/api_service.dart';
import 'package:devotee/constants/widget/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/matches_model.dart';

class MatchesController extends GetxController {
  final ApiService apiService = ApiService();
  var matches = <Data>[].obs;
  MatchesModel? _member;
  var currentPage = 1.obs;
  var lastPage = 1.obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  MatchesModel? get member => _member;
  var status = 'all'.obs; 

  // Function to fetch matches
  Future<void> fetchMatches(BuildContext context, String type) async {
    if (isLoading.value || !hasMore.value) return; // Prevent duplicate requests

    isLoading.value = true;
    try {
      final response =
          await apiService.fetchMatches(currentPage.value, type);
      final matchesModel = response;
      _member = response;

      if (matchesModel.status == "true") {
        final searchData = matchesModel.searchData;
        if (searchData != null) {
          if (currentPage.value == 1) {
            matches.value = searchData.data ?? []; // Load initial data
          } else {
            matches.addAll(searchData.data ?? []); // Append new page data
          }
          currentPage.value = searchData.currentPage ?? 1;
          lastPage.value = searchData.lastPage ?? 1;
          hasMore.value = searchData.currentPage < searchData.lastPage;
        }
      }
    } catch (e) {
      Dialogs.showSnackbar(context, "Error fetching matches: $e");
      // Handle exceptions
      print("Error fetching matches: $e");
    } finally {
      isLoading.value = false;
    }
  }
     
  // Function to load the next page
  void loadNextPage(BuildContext context, String type) {
    if (hasMore.value) {
      currentPage.value++;
      fetchMatches(context, type);
    }
  }

  // Function to reset pagination and data
  void reset(BuildContext context,String type) {
    matches.clear();
    currentPage.value = 1;
    lastPage.value = 1;
    hasMore.value = true;
    fetchMatches(context,type);
  }
}