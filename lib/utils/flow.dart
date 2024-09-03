import 'package:devotee/pages/dashboard/dashboard_page/dashboard.dart';
import 'package:devotee/pages/ragistration/about_groom_bride/about_groom_bride.dart';
import 'package:devotee/pages/ragistration/basic_details/basic_details.dart';
import 'package:devotee/pages/ragistration/contact_page/contact_page.dart';
import 'package:devotee/pages/ragistration/devotion_details/devotion_details.dart';
import 'package:devotee/pages/ragistration/education_page/education_page.dart';
import 'package:devotee/pages/ragistration/family_page/family_page.dart';
import 'package:devotee/pages/ragistration/horoscope_details/horoscope_details.dart';
import 'package:devotee/pages/ragistration/location_details/location_details.dart';
import 'package:devotee/pages/ragistration/partner_preferences/partner_preferences.dart';
import 'package:devotee/pages/ragistration/professional_details_page/professional_details_page.dart';
import 'package:devotee/pages/ragistration/profile1_page/profile1_page.dart'; //Import Profile2Page
import 'package:devotee/pages/ragistration/spiritual_counsellor_details/spiritual_counsellor_details.dart';
import 'package:devotee/pages/ragistration/upload_your_profile/upload_your_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Flows with ChangeNotifier {
  static void navigateToNextStep(
      BuildContext context, List<int> steps, int start) {
    print("Starting navigation from step: $start");
    for (int i = start; i < steps.length; i++) {
      print("Checking step $i with value ${steps[i]}");
      if (steps[i] == 0) {
        print("Navigating to step ${i + 1}");
        Get.off(getStepPage(i + 1));

        // Get.off(() => getStepPage(i + 1));
        return;
      }
    }

    print("Navigating to Dashboard");
    Get.off(() => Dashboard());
  }

  static Widget getStepPage(int stepNumber) {
    switch (stepNumber) {
      case 1:
        return Profile1Page();
      case 2:
        return BasicDetail();
      case 3:
        return ContactDetails();
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
        return HoroscopeDetails();
      case 11:
        return UploadYourProfile();
      case 12:
        return AboutGroomBride();
      case 13:
        return PartnerPreferences();
      default:
        return Dashboard(); // Default to dashboard if no step matches
    }
  }
}
