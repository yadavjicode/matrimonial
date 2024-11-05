import 'package:devotee/model/about_groombride_model.dart';
import 'package:devotee/model/accepted_model.dart';
import 'package:devotee/model/account_setting_model.dart';
import 'package:devotee/model/basic_details_model.dart';
import 'package:devotee/model/buy_package_model.dart';
import 'package:devotee/model/collaborate_model.dart';
import 'package:devotee/model/complaint_model.dart';
import 'package:devotee/model/contact_details_model.dart';
import 'package:devotee/model/coupons_model.dart';
import 'package:devotee/model/dashboard_model.dart';
import 'package:devotee/model/declined_model.dart';
import 'package:devotee/model/devotion_details_model.dart';
import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/family_details_model.dart';
import 'package:devotee/model/feedback_model.dart';
import 'package:devotee/model/horoscope_details_model.dart';
import 'package:devotee/model/inbox_received_model.dart';
import 'package:devotee/model/inbox_sent_model.dart';
import 'package:devotee/model/location_details_model.dart';
import 'package:devotee/model/login_model.dart';
import 'package:devotee/model/matches_model.dart';
import 'package:devotee/model/otp_model.dart';
import 'package:devotee/model/package_model.dart';
import 'package:devotee/model/partner_preference_model.dart';
import 'package:devotee/model/photo_delete_model.dart';
import 'package:devotee/model/professional_details_model.dart';
import 'package:devotee/model/profile_a_model.dart';
import 'package:devotee/model/profile_details_model.dart';
import 'package:devotee/model/search_model.dart';
import 'package:devotee/model/sent_invitation_model.dart';
import 'package:devotee/model/shortlist_model.dart';
import 'package:devotee/model/shortlisted_list_model.dart';
import 'package:devotee/model/spiritual_model.dart';
import 'package:devotee/model/suggestion_model.dart';
import 'package:devotee/model/testimonial_model.dart';
import 'package:devotee/model/user_model.dart';
import 'package:devotee/model/withdrawal_model.dart';
import 'package:devotee/utils/constants.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/add_testimonial_model.dart';
import '../model/apply_coupon_model.dart';
import '../model/block_model.dart';
import '../model/block_profile_model.dart';
import '../model/html_content_model.dart';
import '../model/music_model.dart';
import '../model/recommended_model.dart';
import '../model/skip_model.dart';

class ApiService {
//== Start Api Login ====================================================================================================
  Future<LoginModel> login(String mobileNo) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginUrl}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'Mobile': mobileNo, 'step_0': "1"}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return LoginModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//== End Api Login ====================================================================================================

//== Start Api Otp ====================================================================================================

  Future<OtpModel> otp(String mobileNo, String otp) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginUrl}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'Mobile': mobileNo, 'otp': otp, 'step_0': "1"}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return OtpModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//== End Api Otp ====================================================================================================

//== Start Api ProfileA ====================================================================================================

  Future<ProfileAModel> profileA(String profileFor, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(
          {'step_1': "1", 'profile_for': profileFor, 'Gender': gender}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProfileAModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//== End Api ProfileA====================================================================================================

//=======Start Api Basic Details ==================================================================== ==========================
  Future<BasicDetailsModel> basicDetails(
      String tittle,
      String name,
      String surname,
      String spiritual,
      String maritalStatus,
      String height,
      String weight,
      String dob,
      String hobbies,
      String diet,
      String about) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'step_2': "1",
        "name_title": tittle,
        "Name": name,
        "surename": surname,
        "spiritual_name": spiritual,
        "Maritalstatus": maritalStatus,
        "Height": height,
        "Weight": weight,
        "DOB": dob,
        "Hobbies": hobbies,
        "Diet": diet,
        "about": about
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return BasicDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Basic Details ==========================================================================================

//==== Start Api Contact Details ==========================================================================================

  Future<ContactDetailsModel> contactDetails(
      String mobileno, String email, String instaid) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'step_3': "1",
        "Mobile": mobileno,
        "ConfirmEmail": email,
        "instagram_id": instaid,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ContactDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Contact Details ==========================================================================================

//==== Start Api Location Details ==========================================================================================

  Future<LocationDetailsModel> LocationDetails(
      String country,
      String residence,
      String permanentHouse,
      String permanentState,
      String permanentcity,
      String permanentPincode,
      String temporaryState,
      String temporaryCity,
      String temporaryPincode,
      String referARelation,
      String referAName,
      String referAEmail,
      String referAMobileno,
      String referBRelation,
      String referBName,
      String referBEmail,
      String referBMobileno) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_4": "1",
        "Country": country,
        "address_type": residence,
        "permanent_house_type": permanentHouse,
        "permanent_state": permanentState,
        "permanent_city": permanentcity,
        "permanent_pincode": permanentPincode,
        "temp_state": temporaryState,
        "temp_city": temporaryCity,
        "temp_pincode": temporaryPincode,
        "reference1_reletion": referARelation,
        "reference1_name": referAName,
        "reference1_email": referAEmail,
        "reference1_mobile": referAMobileno,
        "reference2_reletion": referBRelation,
        "reference2_name": referBName,
        "reference2_email": referBEmail,
        "reference2_mobile": referBMobileno,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);

      return LocationDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Location Details ==========================================================================================

//==== Start Api Education Details ==========================================================================================

  Future<EducationDetailsModel> educationDetails(
      String education, String qualification, String describe) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_5": "1",
        "Education": education,
        'professional_qualification': qualification,
        "other_qualification": describe
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return EducationDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Education Details ==========================================================================================

//==== Start Api Professional Details ==========================================================================================

  Future<ProfessionalDetailsModel> professionalDetails(
      String profesion,
      String working,
      String empolyment,
      String workingState,
      String workingCity,
      String pincode,
      String annualSalary) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_6": "1",
        "Occupation": profesion,
        'working_anywhere': working,
        "Employedin": empolyment,
        "work_state": workingState,
        "work_city": workingCity,
        "work_pincode": pincode,
        "Annualincome": annualSalary
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProfessionalDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Professional Details ==========================================================================================

//==== Start Api Devotional Details ==========================================================================================

  Future<DevotionalDetailsModel> devotionalDetails(
      String somethingAbout,
      String iskontype,
      String templeName,
      String templeCity,
      String whichSampraya,
      String devotionalHobbies,
      String dikshaGuru) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_7": "1",
        "something_about_your_devotional_life": somethingAbout,
        'iskon_type': iskontype,
        "name_of_temple": templeName,
        "city_of_the_temple": templeCity,
        "which_sampradaya_you_belogn_to": whichSampraya,
        "devotional_hobbies": devotionalHobbies,
        "name_of_spiritual_master_diksha_guru": dikshaGuru
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return DevotionalDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Devotional Details ==========================================================================================

//==== Start Api Spiritual Details ==========================================================================================

  Future<SpiritualDetailsModel> spiritualDetails(
      String spiritualConnected,
      String nameCounselor,
      String connectCounselor,
      String templeCounselor,
      String stateCounselor,
      String cityCounselor,
      String somethingCounselor) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_8": "1",
        "spiritual_counseler_connected": spiritualConnected,
        "name_of_the_counselor_of_my_spiritual_path": nameCounselor,
        'connected_with_my_counseler_since': connectCounselor,
        "with_which_temple_your_counselor_is_connected_to": templeCounselor,
        "counselor_residing_in_state": stateCounselor,
        "counselor_residing_in_city": cityCounselor,
        "something_about_more_counselor": somethingCounselor
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SpiritualDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Spiritual Details ==========================================================================================

//==== Start Api About GroomBride==========================================================================================

  Future<AboutGroomBrideModel> aboutGroomBride(
      String characteristics, String hobbies) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_13": "1",
        "groom_bride": characteristics,
        'GB_Hobbies': hobbies,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return AboutGroomBrideModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api About GroomBride==========================================================================================

//==== Start Api Horoscope Details==========================================================================================

  Future<HoroscopeDetailsModel> horoscopeDetails(String timeHoroscope,
      String country, String stateHoroscope, String cityHoroscope) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_10": "1",
        "time_of_birth": timeHoroscope,
        "country_of_birth": country,
        'state_of_birth': stateHoroscope,
        "city_of_birth": cityHoroscope
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return HoroscopeDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Horoscope Details==========================================================================================

//==== Start Api Family Details==========================================================================================

  Future<FamilyDetailsModel> familyDetails(
      String religion,
      String caste,
      String subcaste,
      String gothram,
      String language,
      String motherTongue,
      String fatherlivingstatus,
      String fathername,
      String fathersoccupation,
      String fatherBussness,
      String fatherAnnualIncome,
      String motherlivingstatus,
      String mothersname,
      String mothersoccupation,
      String motherAnnualIncome,
      String sister,
      String noofsisters,
      String brother,
      String noofbrothers,
      String familyType,
      String familyvalues,
      String familyStatus) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_9": "1",
        "Religion": religion,
        'Caste': caste,
        "Subcaste": subcaste,
        "Gothram": gothram,
        "Language": language,
        "mother_tongue": motherTongue,
        "Fatherlivingstatus": fatherlivingstatus,
        "Fathername": fathername,
        "Fathersoccupation": fathersoccupation,
        "father_bussness": fatherBussness,
        "father_annual_income": fatherAnnualIncome,
        "Motherlivingstatus": motherlivingstatus,
        "Mothersname": mothersname,
        "Mothersoccupation": mothersoccupation,
        "mother_annual_income": motherAnnualIncome,
        "sister": sister,
        "noofsisters": noofsisters,
        "brother": brother,
        "noofbrothers": noofbrothers,
        "FamilyType": familyType,
        "Familyvalues": familyvalues,
        "FamilyStatus": familyStatus
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return FamilyDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }

//==== End Api Family Details==========================================================================================

//==== Start Api user Details==========================================================================================

  Future<UserModel> userDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.userUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return UserModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }

//==== End Api User Details==========================================================================================

//==== Start Api Partner Preferences==========================================================================================

  Future<PartnerModel> partnerPreference(
      String ageFrom,
      String ageto,
      String weightFrom,
      String weightTo,
      String heightFrom,
      String heightTo,
      String language,
      String maritalStatus,
      String familyType,
      String familyValue,
      String country,
      String state,
      String highQual,
      String profQual,
      String occupation,
      String income,
      String religion,
      String Caste,
      String diet,
      String drink,
      String smoke) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.partnerpreferenceUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "step_14": "1",
        "PE_FromAge": ageFrom,
        "PE_ToAge": ageto,
        'PE_FromWeight': weightFrom,
        "PE_ToWeight": weightTo,
        "PE_Height": heightFrom,
        "PE_Height2": heightTo,
        "PE_Language": language,
        "PE_Marital_Status": maritalStatus,
        "PE_family_type": familyType,
        "PE_family_value": familyValue,
        "PE_Countrylivingin": country,
        "PE_State": state,
        "PE_Education": highQual,
        "PE_Professional": profQual,
        "PE_Occupation": occupation,
        "PE_Annualincome": income,
        "PE_Religion": religion,
        "PE_Caste": Caste,
        "PE_Diet": diet,
        "PE_Drink": drink,
        "PE_Smoking": smoke
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return PartnerModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Partner Preferences==========================================================================================

//==== Start Api Search ==========================================================================================

  Future<SearchsModel> search(
      int page,
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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final Map<String, dynamic> body = {};

    // Conditionally add parameters if they are not null
    if (name != null) body['search_name'] = name;
    if (profession != null) body['search_profession'] = profession;
    if (ageFrom != null) body['From_Age'] = ageFrom;
    if (ageTo != null) body['To_Age'] = ageTo;
    if (heightFrom != null) body['From_Height'] = heightFrom;
    if (heightTo != null) body['To_Height'] = heightTo;
    if (maritalStatus != null) body['Maritalstatus'] = maritalStatus;
    if (religion != null) body['Religion'] = religion;
    if (caste != null) body['Caste'] = caste;
    if (country != null) body['Country'] = country;
    if (state != null) body['State'] = state;
    if (city != null) body['City'] = city;
    if (education != null) body['Education'] = education;
    if (profilePer != null) body['profile_percentage'] = profilePer;
    if (sortby != null) body['sort_by'] = sortby;

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
        Uri.parse(
            '${ApiConstants.baseUrl}${ApiConstants.searchUrl}?page=$page'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SearchsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Search==========================================================================================

//==== Start Api Profile Details==========================================================================================

  Future<ProfileDetailsModel> ProfileDetails(String id, String type) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.proileDetailsUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"MatriID": id, "list_for": type}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ProfileDetailsModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Profile Details==========================================================================================

//==== Start Api Sent Invitation==========================================================================================

  Future<SentInvitationModel> SentInvitation(
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.sentInvitationUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "Receiced_MatriID": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SentInvitationModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Sent Invitation==========================================================================================

//==== Start Api inbox Sent==========================================================================================

  Future<InboxSentModel> InboxSent(
    String status,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.inboxSentUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "status": status,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return InboxSentModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Sent==========================================================================================

//==== Start Api inbox Receive==========================================================================================

  Future<InboxReceivedModel> InboxReceived(
    String status,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.inboxReceivedUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "received_status": status,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return InboxReceivedModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Receive==========================================================================================

//==== Start Api Accepted==========================================================================================

  Future<AcceptedModel> Accepted(
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.acceptedUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "P_MatriID": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return AcceptedModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Accepted==========================================================================================

//==== Start Api Declined==========================================================================================

  Future<DeclinedModel> Declined(
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.declinedUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "P_MatriID": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return DeclinedModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Declined==========================================================================================

//==== Start Api feedback==========================================================================================

  Future<FeedbackModel> Feedback(
    String feedback,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.feedbackUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "feedback": feedback,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return FeedbackModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox feedback==========================================================================================

//==== Start Api Complaint==========================================================================================

  Future<ComplaintModel> Complaint(
      String name, String phoneno, String email, String complaint) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.complaintUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "name": name,
        "mobile": phoneno,
        "email": email,
        "complaint": complaint,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ComplaintModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Complaint==========================================================================================

//==== Start Api Dashboard==========================================================================================

  Future<DashboardModel> Dashboard() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.dashboardUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return DashboardModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Dashboard==========================================================================================

//==== Start Api Testimonial==========================================================================================

  Future<TestimonialModel> Testimonial() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.testimonialUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return TestimonialModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Testimonial==========================================================================================

//==== Start Api Suggestion==========================================================================================

  Future<SuggestionModel> Suggestion(String email, String suggestion) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.suggestionUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "email": email,
        "suggestion": suggestion,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SuggestionModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Suggestion==========================================================================================

//==== Start Api Collaborate==========================================================================================

  Future<CollaborateModel> Collaborate(String name, String phoneno,
      String email, String city, String state) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.collaborateUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "name": name,
        "mobile": phoneno,
        "email": email,
        "state": state,
        "city": city
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return CollaborateModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Collaborate==========================================================================================

//==== Start Api inbox Matches==========================================================================================

  Future<MatchesModel> fetchMatches(int page, String type) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.matchesUrl}?page=$page'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "type": type,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return MatchesModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api inbox Matches==========================================================================================

//==== Start Api Shortlist==========================================================================================

  Future<ShortlistModel> Shortlist(
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.shortlistUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "member_id": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ShortlistModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Shortlist==========================================================================================

//==== Start Api Shortlisted list==========================================================================================

  Future<ShortlistedListModel> Shortlisted() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.shortlistedUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ShortlistedListModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Shortlisted list==========================================================================================

//==== Start Api Withdrawal==========================================================================================

  Future<WithDrawalModel> Withdrawal(
    String id,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.withdrawalUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "P_MatriID": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return WithDrawalModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Shortlisted list==========================================================================================

//==== Start Api Coupons==========================================================================================

  Future<CouponModel> Coupons() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.couponsUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return CouponModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Coupons==========================================================================================

//==== Start Api Package==========================================================================================

  Future<PackageModel> Package() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.packageUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return PackageModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Package================================================================================================

//==== Start Api Buy Package==========================================================================================

  Future<BuyPackageModel> BuyPackage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.buyPackageUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return BuyPackageModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Buy Package==========================================================================================

//==== Start Api AccountSetting==========================================================================================

  Future<AccountSettingModel> accountSetting(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.accountSettingUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        key: value,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return AccountSettingModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api AccountSetting==========================================================================================

//==== Start Api Photo Delete==========================================================================================

  Future<PhotoDeleteModel> photoDelete(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.deletePhotoUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        key: value,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return PhotoDeleteModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Photo Delete==========================================================================================

//==== Start Api Recommended ==========================================================================================

  Future<RecommendedModel> recommended() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.recommendedUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return RecommendedModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api Recommended ==========================================================================================
//==== Start Api skip ==========================================================================================

  Future<SkipModel> skip(String step) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.ragisUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        step: "1",
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return SkipModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api skip ==========================================================================================

//==== Start Api music==========================================================================================

  Future<MusicModel> music() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.musicUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return MusicModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api music==========================================================================================

//==== Start Api drawer content==========================================================================================
  Future<HtmlContentModel> htmlContent() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.htmlContentUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return HtmlContentModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api drawer content==========================================================================================

//==== Start Api block==========================================================================================

  Future<BlockModel> block(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.blockUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "blocked_id": id,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return BlockModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api block==========================================================================================

//==== Start Api add testimonials==========================================================================================

  Future<AddTestimonialModel> addTestimonial(double rating, String desc) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.addTestimonialUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"rating": rating, "description": desc}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return AddTestimonialModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api add testimonials==========================================================================================

//==== Start Api block profile==========================================================================================

  Future<BlockProfileModel> blockProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.blockProfileUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return BlockProfileModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api block profile==========================================================================================

//==== Start Api apply coupon==========================================================================================

  Future<ApplyCouponModel> applyCoupon(String coupon) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token is not available');
    }

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.applyCouponUrl}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"couponCode": coupon}),
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      print(responseJson);
      return ApplyCouponModel.fromJson(responseJson);
    } else {
      final responseJson = json.decode(response.body);
      throw Exception('Failed: ${responseJson['message']}');
    }
  }
//==== End Api apply coupon===========================================================================================
}
