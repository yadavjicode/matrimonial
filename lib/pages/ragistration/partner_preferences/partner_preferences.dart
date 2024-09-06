import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/age_list.dart';
import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/diet_list.dart';
import 'package:devotee/constants/lists/drink_habit_list.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/highest_qualification_list.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/language_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/constants/lists/professional_qualification.dart';
import 'package:devotee/constants/lists/smoke_habit_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/constants/lists/weight_list.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/partner_preference_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartnerPreferences extends StatefulWidget {
  const PartnerPreferences({super.key});

  @override
  State<PartnerPreferences> createState() => _PartnerPreferencesState();
}

class _PartnerPreferencesState extends State<PartnerPreferences> {
  PartnerPreferenceController _partnerPreferenceController =
      Get.put(PartnerPreferenceController());
  AgeController ageController = Get.put(AgeController());
  WeightConsController weightConsController = Get.put(WeightConsController());
  HeightController heightController = Get.put(HeightController());
  MaritalController maritalController = Get.put(MaritalController());
  CountryController countryController = Get.put(CountryController());
  StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  HighestQualController highestQualController =
      Get.put(HighestQualController());
  ProfessionQualController professionQualController =
      Get.put(ProfessionQualController());
  ProfessionController professionsController = Get.put(ProfessionController());
  IncomeController incomeController = Get.put(IncomeController());
  ReligionsController religionsController = Get.put(ReligionsController());
  CastController castController = Get.put(CastController());
  DietController dietController = Get.put(DietController());
  DrinkHabitController drinkHabitController = Get.put(DrinkHabitController());
  SmokeHabitController smokeHabitController = Get.put(SmokeHabitController());
  final LanguageController languageController = Get.put(LanguageController());

  bool selectBasicDetails = false;
  bool selectFamilyDetails = false;
  bool selectNationality = false;
  bool selectEducation = false;
  bool selectReligion = false;
  bool selectOtherDetails = false;

  int? familytype;
  int? familyValue;

  String? selectAgeFrom;
  String? selectAgeTo;

  String? selectWeightFrom;
  String? selectWeightTo;

  String? selectHeightFrom;
  String? selectHeightTo;

  String? selectMaritalStatus;

  String? selectCountry;
  String? selectState;

  String? selectHighestQualification;
  String? selectProfessionalQualification;
  String? selectOccupation;
  String? selectIncome;

  String? selectReligions;
  String? selectCaste;

  String? selectDiet;
  String? selectDrinkHabit;
  String? selectSmokeHabit;

  
  String getFamilyType() {
    if (familytype == 1) {
      return "Joint";
    } else if (familytype == 2) {
      return "Nuclear";
    } else {
      return "";
    }
  }

List<String>? selectedLanguage;

String getLanguageKnown(List<String> language) {
    return language.join(', ');
  }

  String getFamilyValue() {
    if (familyValue == 1) {
      return "Traditional";
    } else if (familyValue == 2) {
      return "Moderate";
    } else if (familyValue == 3) {
      return "Liberal";
    } else {
      return "";
    }
  }
  


  ProfessionsController professionController = Get.put(ProfessionsController());
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Partner Preferences",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/aboutgroom');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/background.png")),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 22, right: 22, top: 15, bottom: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectBasicDetails = !selectBasicDetails;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Basic Details",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectBasicDetails
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectBasicDetails)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            buildDropdownWithSearch(
                                              'Age Range From',
                                              AgeController.AgeTypes(),
                                              (value) {
                                                setState(() {
                                                  selectAgeFrom =
                                                      value; // Update the state
                                                });
                                                ageController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            buildDropdownWithSearch(
                                              'Body Weight From',
                                              WeightConsController.getWeight(),
                                              (value) {
                                                setState(() {
                                                  selectWeightFrom =
                                                      value; // Update the state
                                                });
                                                weightConsController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            buildDropdownWithSearch(
                                              'Height Range From',
                                              heightController.HeightLists,
                                              (value) {
                                                setState(() {
                                                  selectHeightFrom =
                                                      value; // Update the state
                                                });
                                                heightController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            buildDropdownWithSearch(
                                              'Age Range To',
                                              AgeController.AgeTypes(),
                                              (value) {
                                                setState(() {
                                                  //  selectedFatherOccupation = value; // Update the state
                                                });
                                                ageController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            buildDropdownWithSearch(
                                              'Body Weight To',
                                              WeightConsController.getWeight(),
                                              (value) {
                                                setState(() {
                                                  selectWeightTo =
                                                      value; // Update the state
                                                });
                                                weightConsController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            buildDropdownWithSearch(
                                              'Height Range To',
                                              heightController.HeightLists,
                                              (value) {
                                                setState(() {
                                                  selectHeightTo =
                                                      value; // Update the state
                                                });
                                                heightController.selectItem(
                                                    value); // Call the controller method
                                              },
                                              // professionController.selectedItem.call,
                                              hintText: 'Select',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                     buildDropdownWithSearchMulti(
                              'Languages Known',
                              languageController.getlanguageList(),
                              //  languageController.selectedItem.call,
                              (value) {
                                setState(() {
                                  selectedLanguage = value; // Update the state
                                });
                                // motherTongueController.selectItem(
                                //     value); // Call the controller method
                                print(
                                    "language===============${getLanguageKnown(selectedLanguage ?? [])}");
                              },
                              hintText: 'Select Languages Known',
                            ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdown(
                                    'Marital Status',
                                    maritalController.maritalLists,
                                    (value) {
                                      setState(() {
                                        selectMaritalStatus =
                                            value; // Update the state
                                      });
                                      maritalController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Marital Status',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectFamilyDetails = !selectFamilyDetails;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Family Details",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectFamilyDetails
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectFamilyDetails)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Family type',
                                      style: FontConstant.styleRegular(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: RadioListTile<int>(
                                          contentPadding: EdgeInsets.zero,
                                          title: const Text('Joint'),
                                          activeColor: AppColors.primaryColor,
                                          value: 1,
                                          groupValue: familytype,
                                          onChanged: (int? value) {
                                            setState(
                                              () {
                                                familytype = value;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: RadioListTile<int>(
                                          contentPadding: EdgeInsets.zero,
                                          title: const Text('Nuclear'),
                                          activeColor: AppColors.primaryColor,
                                          value: 2,
                                          groupValue: familytype,
                                          onChanged: (int? value) {
                                            setState(() {
                                              familytype = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Family value',
                                          style: FontConstant.styleRegular(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: RadioListTile<int>(
                                                contentPadding: EdgeInsets.zero,
                                                title:
                                                    const Text('Traditional'),
                                                activeColor:
                                                    AppColors.primaryColor,
                                                value: 1,
                                                groupValue: familyValue,
                                                onChanged: (int? value) {
                                                  setState(
                                                    () {
                                                      familyValue = value;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: RadioListTile<int>(
                                                contentPadding: EdgeInsets.zero,
                                                title: const Text('Moderate'),
                                                activeColor:
                                                    AppColors.primaryColor,
                                                value: 2,
                                                groupValue: familyValue,
                                                onChanged: (int? value) {
                                                  setState(
                                                    () {
                                                      familyValue = value;
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          flex: 0,
                                          child: RadioListTile<int>(
                                            contentPadding: EdgeInsets.zero,
                                            title: const Text('Liberal'),
                                            activeColor: AppColors.primaryColor,
                                            value: 3,
                                            groupValue: familyValue,
                                            onChanged: (int? value) {
                                              setState(
                                                () {
                                                  familyValue = value;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectNationality = !selectNationality;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Nationality & State",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectNationality
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectNationality)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  Obx(() {
                                    if (countryController.isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'Nationality',
                                        countryController.getCountryList(),
                                        (value) {
                                          setState(() {
                                            selectCountry =
                                                value; // Update the state
                                          });
                                          countryController.selectItem(
                                              value); // Call the controller method
                                        },
                                        hintText: 'Select Nationality',
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    if (stateControllerPermanent
                                        .isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'State',
                                        stateControllerPermanent.stateLists,
                                        //  stateControllerPermanent.selectedItem,
                                        (value) {
                                          setState(() {
                                            selectState =
                                                value; // Update the state
                                          });
                                          stateControllerPermanent.selectItem(
                                              value); // Call the controller method
                                        },
                                        hintText: 'Select State',
                                      );
                                    }
                                  }),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectEducation = !selectEducation;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Education And Business",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectEducation
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectEducation)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  buildDropdownWithSearch(
                                    'Highest Qualification *',
                                    highestQualController.HighestLists,
                                    (value) {
                                      setState(() {
                                        selectHighestQualification =
                                            value; // Update the state
                                      });
                                      highestQualController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Highest Qualification',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdownWithSearch(
                                    'Professional Qualification',
                                    professionQualController
                                        .professionQualLists,
                                    (value) {
                                      setState(() {
                                        selectProfessionalQualification =
                                            value; // Update the state
                                      });
                                      professionQualController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText:
                                        'Select Professional Qualification',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdownWithSearch(
                                    'Occupation',
                                    professionsController.professionLists,
                                    (value) {
                                      setState(() {
                                        selectOccupation =
                                            value; // Update the state
                                      });
                                      professionsController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Occupation',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdownWithSearch(
                                    'Annual Income Range',
                                    incomeController.IncomeLists,
                                    (value) {
                                      setState(() {
                                        selectIncome =
                                            value; // Update the state
                                      });
                                      incomeController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Annual Income Range',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectReligion = !selectReligion;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Religion And Caste",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectReligion
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectReligion)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  Obx(() {
                                    if (religionsController.isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'Religion',
                                        religionsController.getReligionNames(),
                                        (value) {
                                          setState(() {
                                            // selectedReligion = religionsController
                                            //     .religionsLists
                                            //     .firstWhere((religion) =>
                                            //         religion['name'] == value)['id'];
                                            selectReligions = value;
                                          });

                                          religionsController.selectItem(value);
                                        },
                                        hintText: 'Select Religion',
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() {
                                    if (castController.isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'Caste',
                                        castController.getCastNames(),
                                        (value) {
                                          setState(() {
                                            // selectCast = castController.castLists
                                            //     .firstWhere((cast) =>
                                            //         cast['name'] == value)['id'];
                                            selectCaste = value;
                                          });
                                          castController.selectItem(value);
                                        },
                                        hintText: 'Select Cast',
                                      );
                                    }
                                  }),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 15),
                        child: GestureDetector(
                          onTap: () => {
                            setState(() {
                              selectOtherDetails = !selectOtherDetails;
                            })
                          },
                          child: Row(
                            children: [
                              Text(
                                "Other Details",
                                style: FontConstant.styleMedium(
                                    fontSize: 18,
                                    color: AppColors.primaryColor),
                              ),
                              Spacer(),
                              Image.asset(
                                selectOtherDetails
                                    ? "assets/images/arrow_up.png"
                                    : "assets/images/arrow_down.png",
                                height: 30,
                                width: 30,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      if (selectOtherDetails)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 15),
                              child: Column(
                                children: [
                                  buildDropdown(
                                    'Diet Preference',
                                    dietController.dietLists,
                                    (value) {
                                      setState(() {
                                        selectDiet = value; // Update the state
                                      });
                                      dietController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Diet',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdown(
                                    'Drinking Habit',
                                    drinkHabitController.DrinkHabitLists,
                                    (value) {
                                      setState(() {
                                        selectDrinkHabit =
                                            value; // Update the state
                                      });
                                      drinkHabitController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Drinking Habit',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  buildDropdown(
                                    'Smoking Habit',
                                    smokeHabitController.SmokeHabitLists,
                                    (value) {
                                      setState(() {
                                        selectSmokeHabit =
                                            value; // Update the state
                                      });
                                      smokeHabitController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // professionController.selectedItem.call,
                                    hintText: 'Select Smoking Habit',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 25),
                        child: CustomButton(
                          text: "Save Changes",
                          onPressed: () => {
                            _partnerPreferenceController.partnerPreference(
                                context,
                                selectAgeFrom ?? "",
                                selectAgeTo ?? "",
                                selectWeightFrom ?? "",
                                selectWeightTo ?? "",
                                selectHeightFrom ?? "",
                                selectHeightTo ?? "",
                               getLanguageKnown(selectedLanguage ?? []),
                                selectMaritalStatus ?? "",
                                getFamilyType(),
                                getFamilyValue(),
                                selectCountry ?? "",
                                selectState ?? "",
                                selectHighestQualification ?? "",
                                selectProfessionalQualification ?? "",
                                selectOccupation ?? "",
                                selectIncome ?? "",
                                selectReligions ?? "",
                                selectCaste ?? "",
                                selectDiet ?? "",
                                selectDrinkHabit ?? "",
                                selectSmokeHabit ?? "")
                            //  Get.toNamed("/dashboard")
                          },
                          color: AppColors.primaryColor,
                          textStyle: FontConstant.styleMedium(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_partnerPreferenceController.isLoading.value)
              Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }
}
