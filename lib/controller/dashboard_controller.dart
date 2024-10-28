import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  PageController pageController = PageController(initialPage: 4);
  var selectedIndex = 0.obs;

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
