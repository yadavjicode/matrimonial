import 'package:devotee/chat/helper/dialogs.dart';
import 'package:devotee/model/about_groombride_model.dart';
import 'package:devotee/model/education_details_model.dart';
import 'package:devotee/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/api_service/api_service.dart';

class EditProfileController with ChangeNotifier {
  final ApiService apiService = ApiService();
  UserModel? _member;
  var isLoading = false.obs;
  String? _error;
  UserModel? get member => _member;
  String? get error => _error;
  String? tittle;
  String? name;
  String? postedby;
  String? surname;
  String? dob;

  String? nationality;
  String? residenceType;
  String? permanentHouseType;

  String? highestQualification;
  String? professionalQualification;

  String? professionTittle;
  String? empolyment;
  String? workingState;
  String? workingCity;
  String? workingpincode;
  String? annualSalary;

  String? aboutDevotional;
  String? iskonKnow;
  String? whichTemple;
  String? devotionalHabit;

  String? connectedWithSince;
  String? connectTemple;
  String? counselorState;
  String? counselorCity;
  String? aboutCounselor;

  String? religion;
  String? caste;
  String? subcaste;
  String? gotra;
  String? languageKnown;

  String? timeBirth;
  String? birthState;
  String? birthCity;

  Future<void> userDetails(BuildContext context) async {
    isLoading.value = true;
    _error = null;
    notifyListeners();

    try {
      _member = await apiService.userDetails();

      postedby = _member?.member?.profileFor ?? "";
      tittle = _member?.member?.nameTitle ?? "";
      name = _member?.member?.name ?? "";
      surname = _member?.member?.surename ?? "";
      dob = _member?.member?.dOB ?? "";

      nationality = _member?.member?.country ?? "";
      residenceType = _member?.member?.addressType ?? "";
      permanentHouseType = _member?.member?.permanentHouseType ?? "";

      highestQualification = _member?.member?.education ?? "";
      professionalQualification =
          _member?.member?.professionalQualification ?? "";

      professionTittle = _member?.member?.occupation ?? "";
      empolyment = _member?.member?.employedin ?? "";
      workingState = _member?.member?.workState ?? "";
      workingCity = _member?.member?.workCity ?? "";
      workingpincode = _member?.member?.workPincode ?? "";
      annualSalary = _member?.member?.annualincome ?? "";

      aboutDevotional = _member?.member?.somethingAboutYourDevotionalLife ?? "";
      iskonKnow = _member?.member?.iskonType ?? "";
      whichTemple = _member?.member?.nameOfTemple ?? "";
      devotionalHabit = _member?.member?.devotionalHobbies ?? "";

      connectedWithSince = _member?.member?.connectedWithMyCounselerSince ?? "";
      connectTemple =
          _member?.member?.withWhichTempleYourCounselorIsConnectedTo ?? "";
      counselorState = _member?.member?.counselorResidingInState ?? "";
      counselorCity = _member?.member?.counselorResidingInCity ?? "";
      aboutCounselor = _member?.member?.somethingAboutMoreCounselor ?? "";

      religion = _member?.member?.religion ?? "";
      caste = _member?.member?.caste ?? "";
      subcaste = _member?.member?.subcaste ?? "";
      gotra = _member?.member?.gothram ?? "";
      languageKnown = _member?.member?.language ?? "";

      timeBirth = _member?.member?.timeOfBirth ?? "";
      birthState = _member?.member?.stateOfBirth ?? "";
      birthCity = _member?.member?.cityOfBirth ?? "";
    } catch (e) {
      _error = e.toString();
      print(_error);

      // Show error message using ScaffoldMessenger
      Dialogs.showSnackbar(context, '${_error}');
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
