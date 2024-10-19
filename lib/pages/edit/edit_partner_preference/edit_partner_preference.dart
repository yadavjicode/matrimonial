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
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/partner_preference_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/comman_class_method.dart';

class EditPartnerPreferences extends StatefulWidget {
  const EditPartnerPreferences({super.key});

  @override
  State<EditPartnerPreferences> createState() => _EditPartnerPreferencesState();
}

class _EditPartnerPreferencesState extends State<EditPartnerPreferences> {
  final PartnerPreferenceController _partnerPreferenceController =
      Get.put(PartnerPreferenceController());
  final AgeController ageController = Get.put(AgeController());
  final WeightConsController weightConsController =
      Get.put(WeightConsController());
  final HeightController heightController = Get.put(HeightController());
  final MaritalController maritalController = Get.put(MaritalController());
  final CountryController countryController = Get.put(CountryController());
  final StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  final HighestQualController highestQualController =
      Get.put(HighestQualController());
  final ProfessionQualController professionQualController =
      Get.put(ProfessionQualController());
  final ProfessionController professionsController =
      Get.put(ProfessionController());
  final IncomeController incomeController = Get.put(IncomeController());
  final ReligionsController religionsController =
      Get.put(ReligionsController());
  final CastController castController = Get.put(CastController());
  final DietController dietController = Get.put(DietController());
  final DrinkHabitController drinkHabitController =
      Get.put(DrinkHabitController());
  final SmokeHabitController smokeHabitController =
      Get.put(SmokeHabitController());
  final LanguageController languageController = Get.put(LanguageController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

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
  String? selectHeightFromKey;

  String? selectHeightTo;
  String? selectHeightToKey;

  String? selectMaritalStatus;

  String? selectCountry;

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
  List<String>? selectedHighestQualification;
  List<String>? selectedProfessionalQualification;
  List<String>? selectedOccupation;
  List<String>? selectedState;

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          selectAgeFrom =
              _editProfileController.member?.member?.pEFromAge != null
                  ? "${_editProfileController.member?.member?.pEFromAge} Yrs"
                  : null;
          selectAgeTo = _editProfileController.member?.member?.pEToAge != null
              ? "${_editProfileController.member?.member?.pEToAge} Yrs"
              : null;
          selectWeightFrom =
              _editProfileController.member?.member?.pEFromWeight != null
                  ? "${_editProfileController.member?.member?.pEFromWeight} KG"
                  : null;
          selectWeightTo =
              _editProfileController.member?.member?.pEToWeight != null
                  ? "${_editProfileController.member?.member?.pEToWeight} KG"
                  : null;
          selectHeightFrom = _editProfileController.member?.member?.pEHeight;
          selectHeightFromKey =
              _editProfileController.member?.member?.peHeightKey;
          selectHeightTo = _editProfileController.member?.member?.pEHeight2;
          selectHeightToKey =
              _editProfileController.member?.member?.peHeight2Key;

          selectedLanguage = CommanClass.addCommaSeparatedValuesToList(
              _editProfileController.member?.member?.pELanguage);
          selectedState = CommanClass.addCommaSeparatedValuesToList(
              _editProfileController.member?.member?.pEState);
          selectedHighestQualification =
              CommanClass.addCommaSeparatedValuesToList(
                  _editProfileController.member?.member?.pEEducation);
          selectedProfessionalQualification =
              CommanClass.addCommaSeparatedValuesToList(
                  _editProfileController.member?.member?.pEProfessional);
          selectedOccupation = CommanClass.addCommaSeparatedValuesToList(
              _editProfileController.member?.member?.pEOccupation);

          selectMaritalStatus =
              _editProfileController.member?.member?.pEMaritalStatus;
          selectCountry =
              _editProfileController.member?.member?.pECountrylivingin;
          selectIncome = _editProfileController.member?.member?.pEAnnualincome;
          selectReligions = _editProfileController.member?.member?.pEReligion;
          selectCaste = _editProfileController.member?.member?.pECaste;
          selectDiet = _editProfileController.member?.member?.pEDiet;
          selectDrinkHabit = _editProfileController.member?.member?.pEDrink;
          selectSmokeHabit = _editProfileController.member?.member?.pESmoking;

          if (_editProfileController.member?.member?.familyType == "Joint") {
            familytype = 1;
          } else if (_editProfileController.member?.member?.familyType ==
              "Nuclear") {
            familytype = 2;
          }
          if (_editProfileController.member?.member?.familyvalues ==
              "Traditional") {
            familyValue = 1;
          } else if (_editProfileController.member?.member?.familyvalues ==
              "Moderate") {
            familyValue = 2;
          } else if (_editProfileController.member?.member?.familyvalues ==
              "Liberal") {
            familyValue = 3;
          }
          countryController.selectItem(
              _editProfileController.member?.member?.pECountrylivingin);
        });
      });
    });
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
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    alignment: Alignment.topRight,
                    child: Image.asset("assets/images/background.png")),
                partnerPreferenceContent()
              ],
            ),
            if (_partnerPreferenceController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }

  Widget partnerPreferenceContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 10),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                                  [
                                    'Prefer Not To Say',
                                    ...AgeController.AgeTypes()
                                  ],
                                  (value) {
                                    setState(() {
                                      selectAgeFrom = value; // Update the state
                                    });
                                    ageController.selectItem(
                                        value); // Call the controller method
                                  },
                                  // professionController.selectedItem.call,
                                  selectedItem: selectAgeFrom,
                                  hintText: 'Select',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                buildDropdownWithSearch(
                                  'Body Weight From',
                                  [
                                    'Prefer Not To Say',
                                    ...weightConsController.getWeight()
                                  ],
                                  (value) {
                                    setState(() {
                                      selectWeightFrom =
                                          value; // Update the state
                                    });
                                    weightConsController.selectItem(
                                        value); // Call the controller method
                                  },
                                  selectedItem: selectWeightFrom,
                                  // professionController.selectedItem.call,
                                  hintText: 'Select',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() {
                                  if (heightController.isLoading.value) {
                                    return buildDropdownWithSearch(
                                      'Height Range From',
                                      ['Loading...'],
                                      (value) {
                                        setState(() {
                                          selectHeightFrom = null;
                                          selectHeightFromKey = null;
                                        });
                                      },
                                      selectedItem: 'Loading...',
                                      hintText: 'Select',
                                    );
                                  } else {
                                    return buildDropdownWithSearch(
                                      'Height Range From',
                                      [
                                        'Prefer Not To Say',
                                        ...heightController.HeightLists
                                      ],
                                      (value) {
                                        setState(() {
                                          selectHeightFrom =
                                              value; // Update the state
                                          selectHeightFromKey = heightController
                                              .getHeightList()
                                              .indexOf(value!)
                                              .toString();
                                        });
                                        heightController.selectItem(
                                            value); // Call the controller method
                                      },
                                      selectedItem: selectHeightFrom,
                                      // professionController.selectedItem.call,
                                      hintText: 'Select',
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                buildDropdownWithSearch(
                                  'Age Range To',
                                  [
                                    'Prefer Not To Say',
                                    ...AgeController.AgeTypes()
                                  ],
                                  (value) {
                                    setState(() {
                                      selectAgeTo = value; // Update the state
                                    });
                                    ageController.selectItem(
                                        value); // Call the controller method
                                  },
                                  // professionController.selectedItem.call,
                                  selectedItem: selectAgeTo,
                                  hintText: 'Select',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                buildDropdownWithSearch(
                                  'Body Weight To',
                                  [
                                    'Prefer Not To Say',
                                    ...weightConsController.getWeight()
                                  ],
                                  (value) {
                                    setState(() {
                                      selectWeightTo =
                                          value; // Update the state
                                    });
                                    weightConsController.selectItem(
                                        value); // Call the controller method
                                  },
                                  selectedItem: selectWeightTo,
                                  // professionController.selectedItem.call,
                                  hintText: 'Select',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() {
                                  if (heightController.isLoading.value) {
                                    return buildDropdownWithSearch(
                                      'Height Range To',
                                      ['Loading...'],
                                      (value) {
                                        setState(() {
                                          selectHeightTo = null;
                                          selectHeightToKey = null;
                                        });
                                      },
                                      selectedItem: 'Loading...',
                                      hintText: 'Select',
                                    );
                                  } else {
                                    return buildDropdownWithSearch(
                                      'Height Range To',
                                      [
                                        'Prefer Not To Say',
                                        ...heightController.HeightLists
                                      ],
                                      (value) {
                                        setState(() {
                                          selectHeightTo =
                                              value; // Update the state
                                          selectHeightToKey = heightController
                                              .getHeightList()
                                              .indexOf(value!)
                                              .toString();
                                        });
                                        heightController.selectItem(
                                            value); // Call the controller method
                                      },
                                      selectedItem: selectHeightTo,
                                      // professionController.selectedItem.call,
                                      hintText: 'Select',
                                    );
                                  }
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (languageController.isLoading.value) {
                          return buildDropdownWithSearchMulti(
                            'Languages Known',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedLanguage = null;
                              });
                            },
                            selectedItems: ["Loading"],
                            hintText: 'Select Languages Known',
                          );
                        } else {
                          return buildDropdownWithSearchMulti(
                            'Languages Known',
                            languageController.getlanguageList(),
                            (value) {
                              setState(() {
                                selectedLanguage = value;
                              });
                            },
                            selectedItems: selectedLanguage,
                            hintText: 'Select Languages Known',
                          );
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (maritalController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Marital Status',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectMaritalStatus = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Marital Status',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Marital Status',
                            [
                              'Prefer Not To Say',
                              ...maritalController.maritalLists
                            ],
                            (value) {
                              setState(() {
                                selectMaritalStatus = value; // Update the state
                              });
                              maritalController.selectItem(
                                  value); // Call the controller method
                            },
                            search: false,
                            selectedItem: selectMaritalStatus,
                            // professionController.selectedItem.call,
                            hintText: 'Select Marital Status',
                          );
                        }
                      }),
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                            child: GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  if (familytype == 1) {
                                    familytype = 0;
                                  } else {
                                    familytype = 1;
                                  }
                                });
                              },
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
                          ),
                          Flexible(
                            flex: 2,
                            child: GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  if (familytype == 2) {
                                    familytype = 0;
                                  } else {
                                    familytype = 2;
                                  }
                                });
                              },
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
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Family value',
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        if (familyValue == 1) {
                                          familyValue = 0;
                                        } else {
                                          familyValue = 1;
                                        }
                                      });
                                    },
                                    child: RadioListTile<int>(
                                      contentPadding: EdgeInsets.zero,
                                      title: const Text('Traditional'),
                                      activeColor: AppColors.primaryColor,
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
                                ),
                                Flexible(
                                  flex: 1,
                                  child: GestureDetector(
                                    onDoubleTap: () {
                                      setState(() {
                                        if (familyValue == 2) {
                                          familyValue = 0;
                                        } else {
                                          familyValue = 2;
                                        }
                                      });
                                    },
                                    child: RadioListTile<int>(
                                      contentPadding: EdgeInsets.zero,
                                      title: const Text('Moderate'),
                                      activeColor: AppColors.primaryColor,
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
                                ),
                              ],
                            ),
                            Flexible(
                              flex: 0,
                              child: GestureDetector(
                                onDoubleTap: () {
                                  setState(() {
                                    if (familyValue == 3) {
                                      familyValue = 0;
                                    } else {
                                      familyValue = 3;
                                    }
                                  });
                                },
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  child: Column(
                    children: [
                      Obx(() {
                        if (countryController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Nationality',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectCountry = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Nationality',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Nationality',
                            [
                              'Prefer Not To Say',
                              ...countryController.getCountryList()
                            ],
                            (value) {
                              setState(() {
                                selectCountry = value; // Update the state
                                selectedState = [];
                              });
                              countryController.selectItem(
                                  value); // Call the controller method
                            },
                            selectedItem: selectCountry,
                            hintText: 'Select Nationality',
                          );
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (stateControllerPermanent.isLoading.value) {
                          return buildDropdownWithSearchMulti(
                            'State',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedState = [];
                              });
                            },
                            selectedItems: [],
                            hintText: 'Loading...',
                          );
                        } else {
                          return buildDropdownWithSearchMulti(
                            'State',
                            [
                              'Prefer Not To Say',
                              ...stateControllerPermanent.stateLists
                            ],
                            (value) {
                              setState(() {
                                selectedState = value;
                              });
                            },
                            selectedItems: selectedState,
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  child: Column(
                    children: [
                      Obx(() {
                        if (highestQualController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Highest Qualification',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedHighestQualification = [];
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Highest Qualification',
                          );
                        } else {
                          return buildDropdownWithSearchMulti(
                            'Highest Qualification',
                            highestQualController.HighestLists,
                            (value) {
                              setState(() {
                                selectedHighestQualification =
                                    value; // Update the state
                              });
                            },
                            selectedItems: selectedHighestQualification,
                            // professionController.selectedItem.call,
                            hintText: 'Select Highest Qualification',
                          );
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (professionQualController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Professional Qualification',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedProfessionalQualification = [];
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Professional Qualification',
                          );
                        } else {
                          return buildDropdownWithSearchMulti(
                            'Professional Qualification',
                            professionQualController.professionQualLists,
                            (value) {
                              setState(() {
                                selectedProfessionalQualification = value;
                              });
                            },
                            selectedItems: selectedProfessionalQualification,
                            hintText: 'Select Professional Qualification',
                          );
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (professionsController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Occupation',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectedOccupation = [];
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Occupation',
                          );
                        } else {
                          return buildDropdownWithSearchMulti(
                            'Occupation',
                            professionsController.professionLists,
                            (value) {
                              setState(() {
                                selectedOccupation = value; // Update the state
                              });
                            },
                            selectedItems: selectedOccupation,
                            // professionController.selectedItem.call,
                            hintText: 'Select Occupation',
                          );
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (incomeController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Annual Income Range',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectIncome = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Annual Income Range',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Annual Income Range',
                            incomeController.IncomeLists,
                            (value) {
                              setState(() {
                                selectIncome = value; // Update the state
                              });
                              incomeController.selectItem(
                                  value); // Call the controller method
                            },
                            selectedItem: selectIncome,
                            // professionController.selectedItem.call,
                            hintText: 'Select Annual Income Range',
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  child: Column(
                    children: [
                      Obx(() {
                        if (religionsController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Religion',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectReligions = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Religion',
                          );
                        } else {
                          religionsController.selectItem(selectReligions);
                          return buildDropdownWithSearch(
                            'Religion',
                            [
                              'Prefer Not To Say',
                              ...religionsController.getReligionNames()
                            ],
                            (value) {
                              setState(() {
                                selectReligions = value;
                                selectCaste = null;
                              });

                              religionsController.selectItem(value);
                            },
                            selectedItem: selectReligions,
                            hintText: 'Select Religion',
                          );
                        }
                      }),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (castController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Caste',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectCaste = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Cast',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Caste',
                            [
                              'Prefer Not To Say',
                              ...castController.getCastNames()
                            ],
                            (value) {
                              setState(() {
                                selectCaste = value;
                              });
                              castController.selectItem(value);
                            },
                            selectedItem: selectCaste,
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                        fontSize: 18, color: AppColors.primaryColor),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                  child: Column(
                    children: [
                      Obx(() {
                        if (dietController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Diet Preference',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectDiet = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Diet',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Diet Preference',
                            ['Prefer Not To Say', ...dietController.dietLists],
                            (value) {
                              setState(() {
                                selectDiet = value; // Update the state
                              });
                              dietController.selectItem(
                                  value); // Call the controller method
                            },
                            search: false,
                            selectedItem: selectDiet,
                            hintText: 'Select Diet',
                          );
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (drinkHabitController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Drinking Habit',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectDrinkHabit = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Drinking Habit',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Drinking Habit',
                            drinkHabitController.DrinkHabitLists,
                            (value) {
                              setState(() {
                                selectDrinkHabit = value; // Update the state
                              });
                              drinkHabitController.selectItem(
                                  value); // Call the controller method
                            },
                            search: false,
                            selectedItem: selectDrinkHabit,
                            hintText: 'Select Drinking Habit',
                          );
                        }
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        if (smokeHabitController.isLoading.value) {
                          return buildDropdownWithSearch(
                            'Smoking Habit',
                            ['Loading...'],
                            (value) {
                              setState(() {
                                selectSmokeHabit = null;
                              });
                            },
                            selectedItem: 'Loading...',
                            hintText: 'Select Smoking Habit',
                          );
                        } else {
                          return buildDropdownWithSearch(
                            'Smoking Habit',
                            smokeHabitController.SmokeHabitLists,
                            (value) {
                              setState(() {
                                selectSmokeHabit = value; // Update the state
                              });
                              smokeHabitController.selectItem(
                                  value); // Call the controller method
                            },
                            search: false,
                            selectedItem: selectSmokeHabit,
                            hintText: 'Select Smoking Habit',
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
            child: CustomButton(
              text: "Save Changes",
              onPressed: () => {
                _partnerPreferenceController.partnerPreference(
                    context,
                    selectAgeFrom ?? "",
                    selectAgeTo ?? "",
                    selectWeightFrom != null
                        ? weightConsController
                            .weightInt(selectWeightFrom!)
                            .toString()
                        : "",
                    selectWeightTo != null
                        ? weightConsController
                            .weightInt(selectWeightTo!)
                            .toString()
                        : "",
                    selectHeightFromKey ?? "",
                    selectHeightToKey ?? "",
                    CommanClass.listtoString(selectedLanguage ?? []),
                    selectMaritalStatus ?? "",
                    getFamilyType(),
                    getFamilyValue(),
                    selectCountry ?? "",
                    CommanClass.listtoString(selectedState ?? []),
                    CommanClass.listtoString(
                        selectedHighestQualification ?? []),
                    CommanClass.listtoString(
                        selectedProfessionalQualification ?? []),
                    CommanClass.listtoString(selectedOccupation ?? []),
                    selectIncome ?? "",
                    selectReligions ?? "",
                    selectCaste ?? "",
                    selectDiet ?? "",
                    selectDrinkHabit ?? "",
                    selectSmokeHabit ?? "",
                    true)
                //  Get.toNamed("/dashboard")
              },
              color: AppColors.primaryColor,
              textStyle:
                  FontConstant.styleMedium(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
