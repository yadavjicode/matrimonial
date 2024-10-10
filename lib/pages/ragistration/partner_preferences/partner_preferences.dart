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
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/partner_preference_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/comman_class_method.dart';

class PartnerPreferences extends StatefulWidget {
  const PartnerPreferences({super.key});

  @override
  State<PartnerPreferences> createState() => _PartnerPreferencesState();
}

class _PartnerPreferencesState extends State<PartnerPreferences> {
  final PartnerPreferenceController _partnerPreferenceController =
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
  final FlowController flowController = Get.put(FlowController());

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
            icon: const Icon(Icons.arrow_back),
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
                partnerPreferenceContent()
              ],
            ),
            if (_partnerPreferenceController.isLoading.value ||
                flowController.isLoading.value)
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
                const EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
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
                  const Spacer(),
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
                                      selectWeightFrom = value;
                                    });
                                    weightConsController.selectItem(
                                        value); // Call the controller method
                                  },

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
                                          selectHeightFrom = value;
                                          selectHeightFromKey = heightController
                                              .getHeightList()
                                              .indexOf(value!)
                                              .toString();
                                        });
                                        heightController.selectItem(
                                            value); // Call the controller method
                                      },
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

                                  // professionController.selectedItem.call,
                                  hintText: 'Select',
                                ),
                                SizedBox(
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
                                          selectHeightTo = value;
                                          selectHeightToKey = heightController
                                              .getHeightList()
                                              .indexOf(value!)
                                              .toString();
                                        });
                                        heightController.selectItem(
                                            value); // Call the controller method
                                      },

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
                      const SizedBox(
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
                  const Spacer(),
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
                  const Spacer(),
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
                            hintText: 'Select Nationality',
                          );
                        }
                      }),
                      const SizedBox(
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
                            //  stateControllerPermanent.selectedItem,
                            (value) {
                              setState(() {
                                selectedState = value; // Update the state
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
                                selectedProfessionalQualification =
                                    value; // Update the state
                              });
                            },

                            // professionController.selectedItem.call,
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
                                selectedOccupation = null;
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
                            hintText: 'Select Diet',
                          );
                        }
                      }),
                      SizedBox(
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
                            hintText: 'Select Drinking Habit',
                          );
                        }
                      }),
                      SizedBox(
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
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
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
                    false)
                //  Get.toNamed("/dashboard")
              },
              color: AppColors.primaryColor,
              textStyle:
                  FontConstant.styleMedium(fontSize: 18, color: Colors.white),
            ),
          ),
          _buildSkipButton(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'SKIP',
        onPressed: () {
          _partnerPreferenceController.partnerPreference(
              context,
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              false);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
