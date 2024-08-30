import 'package:devotee/chat/screens/home_screen.dart';
import 'package:devotee/pages/dashboard/home/see_all/see_all.dart';
import 'package:devotee/pages/dashboard/inbox/inbox.dart';
import 'package:devotee/pages/dashboard/profile/my_shortlist_profile/my_shortlist_profile.dart';
import 'package:devotee/pages/drawer_page/collaborate_with_us/collaborate_with_us.dart';
import 'package:devotee/pages/drawer_page/complaint/complaint.dart';
import 'package:devotee/pages/drawer_page/disclaimer/disclaimer.dart';
import 'package:devotee/pages/drawer_page/feedback/feedback.dart';
import 'package:devotee/pages/drawer_page/matches/based_matches/based_matches.dart';
import 'package:devotee/pages/drawer_page/matches/matches.dart';
import 'package:devotee/pages/drawer_page/membership_packages/membership_packages.dart';
import 'package:devotee/pages/drawer_page/offering_your_gratitude/offering_gratitude.dart';
import 'package:devotee/pages/drawer_page/our_mission/our_mission.dart';
import 'package:devotee/pages/drawer_page/our_social_handles/Our_social_handles.dart';
import 'package:devotee/pages/drawer_page/our_vision/our_vision.dart';
import 'package:devotee/pages/drawer_page/our_website/our_wesite.dart';
import 'package:devotee/pages/drawer_page/package_details/package_details.dart';
import 'package:devotee/pages/drawer_page/privacy_policy/privacy_policy.dart';
import 'package:devotee/pages/drawer_page/recommended_by_senior_devotees/recommended_devotees.dart';
import 'package:devotee/pages/drawer_page/request_from_our_side/request_from_our_side.dart';
import 'package:devotee/pages/drawer_page/spiritual_wisdom/spiritual_wisdom.dart';
import 'package:devotee/pages/drawer_page/suggestion/suggestion.dart';
import 'package:devotee/pages/drawer_page/suggestion_from_our_side/suggestion_from_our_side.dart';
import 'package:devotee/pages/drawer_page/testimonials/testimonials.dart';
import 'package:devotee/pages/drawer_page/warning/warning.dart';
import 'package:devotee/pages/drawer_page/who_are_you/who_are_you.dart';
import 'package:devotee/pages/edit/edit_basic_details/edit_basic_details.dart';
import 'package:devotee/pages/edit/edit_contact_details/edit_contact_details.dart';
import 'package:devotee/pages/edit/edit_education_details/edit_education_details.dart';
import 'package:devotee/pages/edit/edit_location_details.dart/edit_location_details.dart';
import 'package:devotee/pages/edit/edit_profession_details/edit_profession_details.dart';
import 'package:devotee/pages/edit/edit_your_profile/edit_your_profile.dart';
import 'package:devotee/pages/ragistration/about_groom_bride/about_groom_bride.dart';
import 'package:devotee/pages/ragistration/upload_your_profile/show_image.dart';
import 'package:devotee/pages/ragistration/upload_your_profile/upload_your_profile.dart';
import 'package:devotee/pages/ragistration/contact_page/contact_page.dart';
import 'package:devotee/pages/dashboard/dashboard_page/dashboard.dart';
import 'package:devotee/pages/ragistration/devotion_details/devotion_details.dart';
import 'package:devotee/pages/ragistration/horoscope_details/horoscope_details.dart';
import 'package:devotee/pages/ragistration/location_details/location_details.dart';
import 'package:devotee/pages/login/login_page/login_page.dart';
import 'package:devotee/pages/login/mobile_page/mobile_page.dart';
import 'package:devotee/pages/ragistration/partner_preferences/partner_preferences.dart';
import 'package:devotee/pages/ragistration/professional_details_page/professional_details_page.dart';
import 'package:devotee/pages/dashboard/profile/edit_profile/edit_profile.dart';
import 'package:devotee/pages/search/search_result/search_result.dart';
import 'package:devotee/pages/extra/show_profile/show_profile.dart';
import 'package:devotee/pages/ragistration/spiritual_counsellor_details/spiritual_counsellor_details.dart';
import 'package:get/get.dart';
import '../pages/splash_Screen/splash_screen.dart';
import 'package:devotee/pages/ragistration/education_page/education_page.dart';
import 'package:devotee/pages/ragistration/family_page/family_page.dart';
import 'package:devotee/pages/ragistration/profile1_page/profile1_page.dart';
import 'package:devotee/pages/ragistration/basic_details/basic_details.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/profile_details.dart';
import 'package:devotee/pages/search/search_page/search_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String mobile = '/mobile';
  static const String otp = '/otp';

  static const String profile = '/profile';
  static const String dashboard = '/dashboard';
  static const String searchresult = '/searchresult';
  static const String profile1 = '/profile1';
  static const String profile2 = '/profile2';
  static const String education = '/education';
  static const String family = '/family';
  static const String search = '/search';
  static const String profileDtls = '/profiledtls';
  static const String contact = '/contact';
  static const String professional = '/prof';
  static const String devotion = '/devotion';
  static const String profileedit = '/profileedit';
  static const String profileshow = '/profileshow';
  static const String spiritual = '/spiritual';
  static const String horoscope = '/horoscope';
  static const String aboutgroom = '/aboutgroom';
  static const String location = '/location';
  static const String partner = '/partner';
  static const String editProfile = '/editProfile';
  static const String inbox = '/inbox';
  static const String shortlistProfile = '/shortlistProfile';
   static const String chatHome = '/chatHome';

  static const String whoAreYou = '/whoAreYou';
  static const String ourMission = '/ourMission';
  static const String ourVision = '/ourVision';
  static const String requestSide = '/requestSide';
  static const String suggestionSide = '/suggestionSide';
  static const String socialMedia = '/socialMedia';

  static const String feedback = '/feedback';
  static const String suggestion = '/suggestion';
  static const String complaint = '/complaint';

  static const String spiritualWisdom = '/spiritualWisdom';
  static const String recommended = '/recommended';
  static const String offering = '/offering';
  static const String warning = '/warning';
  static const String disclaimer = '/disclaimer';
  static const String website = '/website';
  static const String privacy = '/privacy';
  static const String testimonials = '/testimonials';
  static const String collaborate = '/collaborate';

  static const String membership = '/membership';
  static const String package = '/package';

  static const String matches = '/matches';
  static const String basedMatches = '/basedMatches';
  static const String showImage = '/showImage';
  
// Edit pages
   static const String profileEdit = '/profileEdit';
   static const String editBasicDetails = '/editBasicDetails';
   static const String editContactDetails = '/editContactDetails';
   static const String editLocationDetails = '/editLocationDetails';
   static const String editEducationDetails = '/editEducationDetails';
   static const String editProfessionDetails = '/editProfessionDetails';

   static const String seeAll = '/seeAll';

  static final List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  
    GetPage(
      name: profile,
      page: () => const UploadYourProfile(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profileedit,
      page: () => const ProfileEdit(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: dashboard,
      page: () => const Dashboard(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: searchresult,
      page: () => const SearchResult(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: mobile,
      page: () => const MobilePage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profile1,
      page: () => const Profile1Page(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profile2,
      page: () => const BasicDetail(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: education,
      page: () => const EducationDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: family,
      page: () => const FamilyDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: search,
      page: () => const SearchPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profileDtls,
      page: () => ProfileDetailsScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profileshow,
      page: () => const ShowProfile(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: spiritual,
      page: () => const SpiritualDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),   
    GetPage(
      name: horoscope,
      page: () => const HoroscopeDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: devotion,
      page: () => const DevotionDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: contact,
      page: () => const ContactDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: professional,
      page: () => const ProfessionalDetailsPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: aboutgroom,
      page: () => const AboutGroomBride(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: location,
      page: () => const LocationDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: partner,
      page: () => const PartnerPreferences(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: whoAreYou,
      page: () => const WhoAreYou(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: ourMission,
      page: () => const OurMission(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: ourVision,
      page: () => const OurVision(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: requestSide,
      page: () => const RequestFromOurSide(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: suggestionSide,
      page: () => const SuggestionFromOurSide(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: socialMedia,
      page: () => const OurSocialHandles(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: feedback,
      page: () => const FeedbackPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: suggestion,
      page: () => const Suggestion(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: complaint,
      page: () => const Complaint(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: editProfile,
      page: () => const ProfileEdit(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: inbox,
      page: () => const Inbox(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: shortlistProfile,
      page: () => const MyShorlistProfile(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: spiritualWisdom,
      page: () => const SpiritualWisdom(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: recommended,
      page: () => const RecommendedDevotees(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: offering,
      page: () => const OfferingGratitude(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: warning,
      page: () => const Warning(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: disclaimer,
      page: () => const Disclaimer(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: website,
      page: () => const OurWebsite(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: privacy,
      page: () => const PrivacyPolicy(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: testimonials,
      page: () => const Testimonial(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: collaborate,
      page: () => const CollaborateWithUs(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: membership,
      page: () => const MembershipPackages(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: package,
      page: () => const PackageDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    GetPage(
      name: matches,
      page: () => const Matches(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: showImage,
      page: () => const ShowImage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: profileEdit,
      page: () => const EditYourProfile(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: editBasicDetails,
      page: () => const EditBasicDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: editContactDetails,
      page: () => const EditContactDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: editLocationDetails,
      page: () => const EditLocationDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
     GetPage(
      name: editEducationDetails,
      page: () => const EditEducationdetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
     GetPage(
      name: editProfessionDetails,
      page: () => const EditProfessionalDetails(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: chatHome,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: basedMatches,
      page: () => const BasedMatches(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

     GetPage(
      name: seeAll,
      page: () => const SeeAll(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
