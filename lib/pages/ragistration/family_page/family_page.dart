import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/language_list.dart';
import 'package:devotee/constants/lists/mother_tongue_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/family_details_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';

import '../../../controller/edit_profile_controller.dart';
import '../../../controller/skip_controller.dart';
import '../../../utils/comman_class_method.dart';

class FamilyDetails extends StatefulWidget {
  const FamilyDetails({super.key});

  @override
  State<FamilyDetails> createState() => _FamilyDetailsState();
}

class _FamilyDetailsState extends State<FamilyDetails> {
  final FamilyDetailsController _familyDetailsController =
      Get.put(FamilyDetailsController());
  final ReligionsController religionController = Get.put(ReligionsController());
  final ProfessionController professionController =
      Get.put(ProfessionController());
  final IncomeController incomeController = Get.put(IncomeController());
  final NumberController numberController = Get.put(NumberController());
  final CastController castController = Get.put(CastController());
  final SubCastController subCastController = Get.put(SubCastController());
  final TextEditingController gotraController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController fatherbusinessController =
      TextEditingController();
  final TextEditingController mothernameController = TextEditingController();
  final MotherTongueController motherTongueController =
      Get.put(MotherTongueController());
  final LanguageController languageController = Get.put(LanguageController());
  final FlowController flowController = Get.put(FlowController());
  final GlobalKey<FormState> _formKeyFather = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyMother = GlobalKey<FormState>();
  final SkipController skipController = Get.put(SkipController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  List<String> selectedLanguagesList = []; // List to store selected languages

  String getSelectedLanguagesString() {
    return selectedLanguagesList.join(', ');
  }

  int? selectedValue;
  int? fatherAlive;
  int? motherAlive;
  int? sister;
  int? brother;
  int? familytype;
  int? familyValue;
  int? affluenceLevel;
  int? selectedReligion;
  String? region;
  int? selectedCast;
  String? selectedReligionName;
  String? selectedCastName;
  String? selectedSubCastName;
  String? selectedState;
  String? selectedCity;
  String? selectedMothertongue;
  List<String>? selectedLanguage;
  String? selectedFatherOccupation;
  String? selectedFatherAnnualTurn;
  String? selectedFatherAnnualIncomeRange;
  String? selectedMotherOccupation;
  String? selectedMotherEmployee;
  String? selectedMotherAnnualIncomeRange;
  String? selectedNoSister;
  String? selectedNoYoungerSister;
  String? selectedNoMarriedSister;
  String? selectedNoBrother;
  String? selectedNoYoungerBrother;
  String? selectedNoMarriedBrother;
  String? selectedHowManyMember;

  bool show = false;

  String getLanguageKnown(List<String> language) {
    return language.join(', ');
  }

  String? getFatherAlive() {
    if (fatherAlive == 1) {
      return "Yes";
    } else if (fatherAlive == 2) {
      return "No";
    } else {
      return null;
    }
  }

  String? getMotherAlive() {
    if (motherAlive == 1) {
      return "Yes";
    } else if (motherAlive == 2) {
      return "No";
    } else {
      return null;
    }
  }

  String? getSister() {
    if (sister == 1) {
      return "Yes";
    } else if (sister == 2) {
      return "No";
    } else {
      return null;
    }
  }

  String? getBrother() {
    if (brother == 1) {
      return "Yes";
    } else if (brother == 2) {
      return "No";
    } else {
      return null;
    }
  }

  String? getFamilyType() {
    if (familytype == 1) {
      return "Joint";
    } else if (familytype == 2) {
      return "Nuclear";
    } else {
      return null;
    }
  }

  String? getFamilyValue() {
    if (familyValue == 1) {
      return "Traditional";
    } else if (familyValue == 2) {
      return "Moderate";
    } else if (familyValue == 3) {
      return "Liberal";
    } else {
      return null;
    }
  }

  String? getAffluenceLevel() {
    if (affluenceLevel == 1) {
      return "Affluent";
    } else if (affluenceLevel == 2) {
      return "Lower middle";
    } else if (affluenceLevel == 3) {
      return "Middle class";
    } else if (affluenceLevel == 4) {
      return "Upper class";
    } else {
      return null;
    }
  }

  bool validation() {
    if (getFatherAlive() != null &&
        getMotherAlive() != null &&
        getSister() != null &&
        getBrother() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((_) {
        setState(() {
          selectedReligionName =
              _editProfileController.member?.member?.religion;
          selectedCastName = _editProfileController.member?.member?.caste;
          selectedSubCastName = _editProfileController.member?.member?.subcaste;
          gotraController.text =
              _editProfileController.member?.member?.gothram ?? "";

          List<String> languages = CommanClass.addCommaSeparatedValuesToList(
              _editProfileController.member?.member?.language);

          // Step 2: Add to the selectedLanguage list
          selectedLanguage ??= []; // Initialize if null
          selectedLanguage!.addAll(languages);

          selectedMothertongue =
              _editProfileController.member?.member?.motherTongue;
          fathernameController.text =
              _editProfileController.member?.member?.fathername ?? "";
          selectedFatherOccupation =
              _editProfileController.member?.member?.fathersoccupation;
          fatherbusinessController.text =
              _editProfileController.member?.member?.fatherBussness ?? "";
          selectedFatherAnnualIncomeRange =
              _editProfileController.member?.member?.fatherAnnualIncome;
          mothernameController.text =
              _editProfileController.member?.member?.mothersname ?? "";
          selectedMotherOccupation =
              _editProfileController.member?.member?.mothersoccupation;
          selectedMotherAnnualIncomeRange =
              _editProfileController.member?.member?.motherAnnualIncome;
          selectedNoSister = _editProfileController.member?.member?.noofsisters;
          selectedNoBrother =
              _editProfileController.member?.member?.noofbrothers;

          if (_editProfileController.member?.member?.fatherlivingstatus ==
              "Yes") {
            fatherAlive = 1;
          } else if (_editProfileController
                  .member?.member?.fatherlivingstatus ==
              "No") {
            fatherAlive = 2;
          }

          if (_editProfileController.member?.member?.motherlivingstatus ==
              "Yes") {
            motherAlive = 1;
          } else if (_editProfileController
                  .member?.member?.motherlivingstatus ==
              "No") {
            motherAlive = 2;
          }

          if (_editProfileController.member?.member?.sister == "Yes") {
            sister = 1;
          } else if (_editProfileController.member?.member?.sister == "No") {
            sister = 2;
          }

          if (_editProfileController.member?.member?.brother == "Yes") {
            brother = 1;
          } else if (_editProfileController.member?.member?.brother == "No") {
            brother = 2;
          }

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

          if (_editProfileController.member?.member?.familyStatus ==
              "Affluent") {
            affluenceLevel = 1;
          } else if (_editProfileController.member?.member?.familyStatus ==
              "Lower middle") {
            affluenceLevel = 2;
          } else if (_editProfileController.member?.member?.familyStatus ==
              "Middle class") {
            affluenceLevel = 3;
          } else if (_editProfileController.member?.member?.familyStatus ==
              "upper class") {
            affluenceLevel = 4;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Family & More Details ",
            style: FontConstant.styleMedium(fontSize: 19, color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/spiritual');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.45,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                familyContent()
              ],
            ),
            if (_familyDetailsController.isLoading.value ||
                _editProfileController.isLoading.value ||
                flowController.isLoading.value ||
                skipController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget familyContent() {
    if (_editProfileController.isLoading.value == false) {
      religionController
          .selectItem(_editProfileController.member!.member!.religion);
      castController.selectItem(_editProfileController.member!.member!.caste);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22, top: 35, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/familyicon.png')),
                Obx(() {
                  if (religionController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'Religion *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedReligionName = null;
                        });

                        religionController.selectItem(selectedReligionName);
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select Religion',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'Religion *',
                      [
                        'Prefer Not To Say',
                        ...religionController.getReligionNames()
                      ],
                      (value) {
                        setState(() {
                          selectedReligionName = value;
                          selectedCastName = null;
                        });

                        religionController.selectItem(value);
                        //  religionController.selectItem(value);
                      },
                      selectedItem: selectedReligionName,
                      hintText: 'Select Religion',
                    );
                  }
                }),
                const SizedBox(height: 15),
                Obx(() {
                  if (castController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'Caste *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedCastName = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select Cast',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'Caste *',
                      ['Prefer Not To Say', ...castController.getCastNames()],
                      (value) {
                        setState(() {
                          selectedCastName = value;
                          selectedSubCastName = null;
                        });
                        castController.selectItem(value);
                      },
                      selectedItem: selectedCastName,
                      hintText: 'Select Cast',
                    );
                  }
                }),
                const SizedBox(height: 15),
                Obx(() {
                  if (subCastController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'Subcaste',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedSubCastName = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select SubCast',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'Subcaste',
                      [
                        'Prefer Not To Say',
                        ...subCastController.getSubCastList()
                      ],
                      (value) {
                        setState(() {
                          selectedSubCastName =
                              value; // Store selected subcaste name
                        });
                        subCastController.selectItem(value);
                      },
                      selectedItem: selectedSubCastName,
                      hintText: 'Select SubCast',
                    );
                  }
                }),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: gotraController,
                  labelText: 'Gotra',
                  hintText: "Enter Gotra",
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  if (languageController.isLoading.value) {
                    return buildDropdownWithSearchMulti(
                      'Languages Known *',
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
                      'Languages Known *',
                      languageController.getlanguageList(),
                      //  languageController.selectedItem.call,
                      (value) {
                        setState(() {
                          selectedLanguage = value; // Update the state
                        });
                      },

                      selectedItems: selectedLanguage,
                      hintText: 'Select Languages Known',
                    );
                  }
                }),
                const SizedBox(
                  height: 15,
                ),
                Obx(() {
                  if (motherTongueController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'Mother tongue *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedMothertongue = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select Mother tongue',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'Mother tongue *',
                      motherTongueController.getMotherTongueList(),
                      //  languageController.selectedItem.call,
                      (value) {
                        setState(() {
                          selectedMothertongue = value; // Update the state
                        });
                        motherTongueController
                            .selectItem(value); // Call the controller method
                      },
                      selectedItem: selectedMothertongue,
                      hintText: 'Select Mother tongue',
                    );
                  }
                }),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Father alive *',
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.black),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 1,
                      groupValue: fatherAlive,
                      onChanged: (value) => {
                        setState(() {
                          fatherAlive = value!;
                        })
                      },
                    ),
                    Text(
                      "Yes",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 2,
                      groupValue: fatherAlive,
                      onChanged: (value) => {
                        setState(() {
                          fatherAlive = value!;
                        })
                      },
                    ),
                    Text(
                      "No",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    )
                  ],
                ),
                if (show == true && getFatherAlive() == null)
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select father alive",
                        style: FontConstant.styleRegular(
                            fontSize: 11, color: AppColors.red),
                      )),
                if (getFatherAlive() == "Yes")
                  Form(
                    key: _formKeyFather,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: fathernameController,
                          labelText: 'Full Name of Father *',
                          hintText: "Enter Name of Father",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (professionController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Occupation *',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedFatherOccupation = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Occupation',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Occupation *',
                              professionController.getProfessionList(),
                              (value) {
                                setState(() {
                                  selectedFatherOccupation =
                                      value; // Update the state
                                });
                                professionController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedFatherOccupation,
                              hintText: 'Select Occupation',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: fatherbusinessController,
                          labelText: 'What kind of business *',
                          hintText: "Enter kind of business",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (incomeController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Annual income range *',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedFatherAnnualIncomeRange = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Annual income range',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Annual income range *',
                              incomeController.getIncomeList(),
                              (value) {
                                setState(() {
                                  selectedFatherAnnualIncomeRange =
                                      value; // Update the state
                                });
                                incomeController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedFatherAnnualIncomeRange,
                              hintText: 'Select Annual Income Range',
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Mother alive *',
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.black),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 1,
                      groupValue: motherAlive,
                      onChanged: (value) => {
                        setState(() {
                          motherAlive = value!;
                        })
                      },
                    ),
                    Text(
                      "Yes",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 2,
                      groupValue: motherAlive,
                      onChanged: (value) => {
                        setState(() {
                          motherAlive = value!;
                        })
                      },
                    ),
                    Text(
                      "No",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    )
                  ],
                ),
                if (show == true && getMotherAlive() == null)
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select mother alive",
                        style: FontConstant.styleRegular(
                            fontSize: 11, color: AppColors.red),
                      )),
                if (getMotherAlive() == "Yes")
                  Form(
                    key: _formKeyMother,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: mothernameController,
                          labelText: 'Full Name of Mother *',
                          hintText: "Enter Full Name of Mother",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (professionController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Occupation *',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedMotherOccupation = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Occupation',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Occupation *',
                              professionController.getProfessionList(),
                              (value) {
                                setState(() {
                                  selectedMotherOccupation =
                                      value; // Update the state
                                });
                                professionController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedMotherOccupation,
                              hintText: 'Select Occupation',
                            );
                          }
                        }),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          if (incomeController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Annual income range *',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedMotherAnnualIncomeRange = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Annual income range',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Annual income range *',
                              incomeController.getIncomeList(),
                              (value) {
                                setState(() {
                                  selectedMotherAnnualIncomeRange =
                                      value; // Update the state
                                });
                                incomeController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedMotherAnnualIncomeRange,
                              hintText: 'Select Annual Income Range',
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Sister *',
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.black),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 1,
                      groupValue: sister,
                      onChanged: (value) => {
                        setState(() {
                          sister = value!;
                        })
                      },
                    ),
                    Text(
                      "Yes",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 2,
                      groupValue: sister,
                      onChanged: (value) => {
                        setState(() {
                          sister = value!;
                        })
                      },
                    ),
                    Text(
                      "No",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    )
                  ],
                ),
                if (show == true && getSister() == null)
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select sister",
                        style: FontConstant.styleRegular(
                            fontSize: 11, color: AppColors.red),
                      )),
                if (getSister() == "Yes")
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      buildDropdownWithSearch(
                        'Number of Sisters *',
                        ['Prefer Not To Say', ...NumberController.NumberList()],
                        (value) {
                          setState(() {
                            selectedNoSister = value; // Update the state
                          });
                          numberController
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedNoSister,
                        hintText: '0',
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Brother *',
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.black),
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 1,
                      groupValue: brother,
                      onChanged: (value) => {
                        setState(() {
                          brother = value!;
                        })
                      },
                    ),
                    Text(
                      "Yes",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Radio(
                      activeColor: AppColors.primaryColor,
                      value: 2,
                      groupValue: brother,
                      onChanged: (value) => {
                        setState(() {
                          brother = value!;
                        })
                      },
                    ),
                    Text(
                      "No",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    )
                  ],
                ),
                if (show == true && getBrother() == null)
                  Container(
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select brother",
                        style: FontConstant.styleRegular(
                            fontSize: 11, color: AppColors.red),
                      )),
                if (getBrother() == "Yes")
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      buildDropdownWithSearch(
                        'Number of Brothers *',
                        ['Prefer Not To Say', ...NumberController.NumberList()],
                        (value) {
                          setState(() {
                            selectedNoBrother = value; // Update the state
                          });
                          numberController
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedNoBrother,
                        hintText: '0',
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Colors.grey),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Family type',
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
                      flex: 1,
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
                  height: 15,
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
                    Text(
                      'Affluence level',
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
                                if (affluenceLevel == 1) {
                                  affluenceLevel = 0;
                                } else {
                                  affluenceLevel = 1;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Affluent'),
                              activeColor: AppColors.primaryColor,
                              value: 1,
                              groupValue: affluenceLevel,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    affluenceLevel = value;
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
                                if (affluenceLevel == 2) {
                                  affluenceLevel = 0;
                                } else {
                                  affluenceLevel = 2;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Lower middle'),
                              activeColor: AppColors.primaryColor,
                              value: 2,
                              groupValue: affluenceLevel,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    affluenceLevel = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                if (affluenceLevel == 3) {
                                  affluenceLevel = 0;
                                } else {
                                  affluenceLevel = 3;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Middle class'),
                              activeColor: AppColors.primaryColor,
                              value: 3,
                              groupValue: affluenceLevel,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    affluenceLevel = value;
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
                                if (affluenceLevel == 4) {
                                  affluenceLevel = 0;
                                } else {
                                  affluenceLevel = 4;
                                }
                              });
                            },
                            child: RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Upper class'),
                              activeColor: AppColors.primaryColor,
                              value: 4,
                              groupValue: affluenceLevel,
                              onChanged: (int? value) {
                                setState(
                                  () {
                                    affluenceLevel = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 44,
                  child: CustomButton(
                    text: 'CONTINUE',
                    onPressed: () {
                      setState(() {
                        show = true;
                      });
                      if (validation()) {
                        String gotra = gotraController.text.toString().trim();
                        String fathername =
                            fathernameController.text.toString().trim();
                        String fatherbusines =
                            fatherbusinessController.text.toString().trim();
                        String mothername =
                            mothernameController.text.toString().trim();

                        _familyDetailsController.familyDetails(
                            context,
                            selectedReligionName ?? "",
                            selectedCastName ?? "",
                            selectedSubCastName ?? "",
                            gotra,
                            getLanguageKnown(selectedLanguage ?? []),
                            selectedMothertongue ?? "",
                            getFatherAlive() ?? "",
                            getFatherAlive() == "Yes" ? fathername : "",
                            getFatherAlive() == "Yes"
                                ? selectedFatherOccupation ?? ""
                                : "",
                            getFatherAlive() == "Yes" ? fatherbusines : "",
                            getFatherAlive() == "Yes"
                                ? selectedFatherAnnualIncomeRange ?? ""
                                : "",
                            getMotherAlive() ?? "",
                            getMotherAlive() == "Yes" ? mothername : "",
                            getMotherAlive() == "Yes"
                                ? selectedMotherOccupation ?? ""
                                : "",
                            getMotherAlive() == "Yes"
                                ? selectedMotherAnnualIncomeRange ?? ""
                                : "",
                            getSister() ?? "",
                            getSister() == "Yes" ? selectedNoSister ?? "" : "",
                            getBrother() ?? "",
                            getBrother() == "Yes"
                                ? selectedNoBrother ?? ""
                                : "",
                            getFamilyType() != null ? getFamilyType()! : "",
                            getFamilyValue() != null ? getFamilyValue()! : "",
                            getAffluenceLevel() != null
                                ? getAffluenceLevel()!
                                : "",
                            false);
                      }

                      //  Get.toNamed('/aboutgroom');
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleMedium(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                _buildSkipButton()
              ],
            ),
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
          // flowController.Flow(context, 9)
          skipController.skip(context, "step_9", 9);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
