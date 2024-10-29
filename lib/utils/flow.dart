import 'package:devotee/pages/dashboard/dashboard_page/dashboard.dart';
import 'package:devotee/pages/ragistration/about_groom_bride/about_groom_bride.dart';
import 'package:devotee/pages/ragistration/basic_details/basic_details.dart';
import 'package:devotee/pages/ragistration/contact_page/contact_page.dart';
import 'package:devotee/pages/ragistration/devotion_details/devotion_details.dart';
import 'package:devotee/pages/ragistration/education_page/education_page.dart';
import 'package:devotee/pages/ragistration/family_page/family_page.dart';
import 'package:devotee/pages/ragistration/horoscope_details/horoscope_details.dart';
import 'package:devotee/pages/ragistration/location_details/location_details.dart';
import 'package:devotee/pages/ragistration/package_information/package_information.dart';
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
    Get.off(() => const Dashboard());
  }

  static Widget getStepPage(int stepNumber) {
    switch (stepNumber) {
      case 1:
        return const Profile1Page();
      case 2:
        return const BasicDetail();
      case 3:
        return const ContactDetails();
      case 4:
        return const LocationDetails();
      case 5:
        return const EducationDetails();
      case 6:
        return const ProfessionalDetailsPage();
      case 7:
        return const DevotionDetails();
      case 8:
        return const SpiritualDetails();
      case 9:
        return const FamilyDetails();
      case 10:
        return const HoroscopeDetails();
      case 11:
        return const UploadYourProfile();
      case 12:
        return const PackageInformation();
      case 13:
        return const AboutGroomBride();
      case 14:
        return const PartnerPreferences();
      default:
        return const Dashboard(); // Default to dashboard if no step matches
    }
  }
}
