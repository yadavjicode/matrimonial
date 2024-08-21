import 'package:devotee/pages/dashboard/dashboard_page/dashboard.dart';
import 'package:devotee/pages/ragistration/about_groom_bride/about_groom_bride.dart';
import 'package:devotee/pages/ragistration/basic_details/basic_details.dart';
import 'package:devotee/pages/ragistration/contact_page/contact_page.dart';
import 'package:devotee/pages/ragistration/devotion_details/devotion_details.dart';
import 'package:devotee/pages/ragistration/education_page/education_page.dart';
import 'package:devotee/pages/ragistration/family_page/family_page.dart';
import 'package:devotee/pages/ragistration/horoscope_details/horoscope_details.dart';
import 'package:devotee/pages/ragistration/location_details/location_details.dart';
import 'package:devotee/pages/ragistration/professional_details_page/professional_details_page.dart';
import 'package:devotee/pages/ragistration/profile1_page/profile1_page.dart';// Import Profile2Page
import 'package:devotee/pages/ragistration/spiritual_counsellor_details/spiritual_counsellor_details.dart';
import 'package:devotee/pages/ragistration/upload_your_profile/upload_your_profile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Flows {
  // Method to navigate to the next step based on the status
  static void navigateToNextStep(BuildContext context, List<int> steps,int start) {
    for (int i = start; i < steps.length; i++) {
      if (steps[i] == 0) {
        Get.to(() => getStepPage(i + 1));
        return;
      }
    }
    // If all steps are filled, navigate to the Dashboard
    Get.to(() => Dashboard());
  }

  // Method to return the appropriate page widget based on the step number
  static Widget getStepPage(int stepNumber) {
    switch (stepNumber) {
      case 1:
        return Profile1Page();
      case 2:
        return BasicDetail(); // Navigate to Profile2Page if step 2
      case 3:
        return ContactDetails(); // Navigate to EducationPage if step 3
      case 4:
          return LocationDetails();
      case 5:
          return EducationDetails();
      case 6:
          return ProfessionalDetailsPage();
      case 7:
          return DevotionDetails();  
      case 8:
          return SpiritualDetails();  
      case 9:
          return FamilyDetails();
      case 10:
          return AboutGroomBride();
      case 11:
         return HoroscopeDetails();
      case 12:
        return UploadYourProfile();
      default:
        return Dashboard(); // Default to dashboard if no step matches
    }
  }
}
