import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  late PageController pageController;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 4); // Initialize here
  }

  void navigateToPage(int pageIndex) {
    selectedIndex.value = pageIndex;
    pageController.jumpToPage(pageIndex);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
