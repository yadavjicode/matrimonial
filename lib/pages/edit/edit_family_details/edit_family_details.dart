import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/language_list.dart';
import 'package:devotee/constants/lists/mother_tongue_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
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

class EditFamilyDetails extends StatefulWidget {
  const EditFamilyDetails({super.key});

  @override
  State<EditFamilyDetails> createState() => _EditFamilyDetailsState();
}

class _EditFamilyDetailsState extends State<EditFamilyDetails> {
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
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final GlobalKey<FormState> _formKeyFather = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyMother = GlobalKey<FormState>();
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

  String getLanguageKnown(List<String> language) {
    return language.join(', ');
  }

  TextEditingController time = TextEditingController();

  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (picked != null) {
  //     final String formattedTime = picked.format(context);
  //     setState(() {
  //       time.text = formattedTime;
  //     });
  //   }
  // }

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

  bool fatherValidation() {
    if (getFatherAlive() == "Yes") {
      if ( _formKeyFather.currentState!.validate()&&selectedFatherOccupation != null &&
          selectedFatherAnnualIncomeRange != null ) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool motherValidation() {
    if (getMotherAlive() == "Yes") {
      if ( _formKeyMother.currentState!.validate()&&selectedMotherOccupation != null &&
          selectedMotherAnnualIncomeRange != null ) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool brotherValidation() {
    if (getBrother() == "Yes") {
      if (selectedNoBrother != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool sisterValidation() {
    if (getSister() == "Yes") {
      if (selectedNoSister != null) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  bool validation() {
    if (selectedReligionName != null &&
        selectedCastName != null &&
        getLanguageKnown(selectedLanguage ?? []) != "" &&
        selectedMothertongue != null &&
        getFatherAlive() != null &&
        getMotherAlive() != null &&
        getSister() != null &&
        getBrother() != null) {
      if (fatherValidation() &&
          motherValidation() &&
          sisterValidation() &&
          brotherValidation()) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
    selectedReligionName = _editProfileController.member!.member!.religion;
    selectedCastName = _editProfileController.member!.member!.caste;
    selectedSubCastName = _editProfileController.member!.member!.subcaste;
    gotraController.text = _editProfileController.member!.member!.gothram ?? "";

    List<String> languages =
        _editProfileController.member!.member!.language.split(',');

    // Step 2: Add to the selectedLanguage list
    selectedLanguage ??= []; // Initialize if null
    selectedLanguage!.addAll(languages);

    selectedMothertongue = _editProfileController.member!.member!.motherTongue;
    fathernameController.text =
        _editProfileController.member!.member!.fathername ?? "";
    selectedFatherOccupation =
        _editProfileController.member!.member!.fathersoccupation;
    fatherbusinessController.text =
        _editProfileController.member!.member!.fatherBussness ?? "";
    selectedFatherAnnualIncomeRange =
        _editProfileController.member!.member!.fatherAnnualIncome;
    mothernameController.text =
        _editProfileController.member!.member!.mothersname ?? "";
    selectedMotherOccupation =
        _editProfileController.member!.member!.mothersoccupation;
    selectedMotherAnnualIncomeRange =
        _editProfileController.member!.member!.motherAnnualIncome;
    selectedNoSister =
        _editProfileController.member!.member!.noofsisters;
    selectedNoBrother =
        _editProfileController.member!.member!.noofbrothers;

    if (_editProfileController.member!.member!.fatherlivingstatus == "Yes") {
      fatherAlive = 1;
    } else if (_editProfileController.member!.member!.fatherlivingstatus ==
        "No") {
      fatherAlive = 2;
    }

    if (_editProfileController.member!.member!.motherlivingstatus == "Yes") {
      motherAlive = 1;
    } else if (_editProfileController.member!.member!.motherlivingstatus ==
        "No") {
      motherAlive = 2;
    }

    if (_editProfileController.member!.member!.sister == "Yes") {
      sister = 1;
    } else if (_editProfileController.member!.member!.sister == "No") {
      sister = 2;
    }

    if (_editProfileController.member!.member!.brother == "Yes") {
      brother = 1;
    } else if (_editProfileController.member!.member!.brother == "No") {
      brother = 2;
    }

    if (_editProfileController.member!.member!.familyType == "Joint") {
      familytype = 1;
    } else if (_editProfileController.member!.member!.familyType == "Nuclear") {
      familytype = 2;
    }

    if (_editProfileController.member!.member!.familyvalues == "Traditional") {
      familyValue = 1;
    } else if (_editProfileController.member!.member!.familyvalues ==
        "Moderate") {
      familyValue = 2;
    } else if (_editProfileController.member!.member!.familyvalues ==
        "Liberal") {
      familyValue = 3;
    }

    if (_editProfileController.member!.member!.familyStatus == "Affluent") {
      affluenceLevel = 1;
    } else if (_editProfileController.member!.member!.familyStatus ==
        "Lower middle") {
      affluenceLevel = 2;
    } else if (_editProfileController.member!.member!.familyStatus ==
        "Middle class") {
      affluenceLevel = 3;
    } else if (_editProfileController.member!.member!.familyStatus ==
        "upper class") {
      affluenceLevel = 4;
    }
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
                _editProfileController.isLoading.value 
                )
              Center(
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
      castController..selectItem(_editProfileController.member!.member!.caste);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 22.0, right: 22, top: 35, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 30),
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
                      religionController.getReligionNames(),
                      (value) {
                        setState(() {
                          selectedReligion = religionController.religionsLists
                              .firstWhere((religion) =>
                                  religion['name'] == value)['id'];
                          selectedReligionName = value;
                          selectedCastName = null;
                        });

                        religionController.selectItem(value);
                        //  religionController.selectItem(value);
                      },
                      selectedItem: selectedReligionName,
                      borderColor: selectedReligionName == null
                          ? Colors.red
                          : Colors.black.withOpacity(0.5),
                      errorMessage: "Please select religion",
                      errorshow: selectedReligionName == null ? true : false,
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
                      castController.getCastNames(),
                      (value) {
                        setState(() {
                          selectedCast = castController.castLists.firstWhere(
                              (cast) => cast['name'] == value)['id'];
                          selectedCastName = value;
                          selectedSubCastName = null;
                        });
                        castController.selectItem(value);
                      },
                      selectedItem: selectedCastName,
                      borderColor: selectedCastName == null
                          ? Colors.red
                          : Colors.black.withOpacity(0.5),
                      errorMessage: "Please select Cast",
                      errorshow: selectedCastName == null ? true : false,
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
                      subCastController.getSubCastList(),
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
                    controller: gotraController, labelText: 'Gotra'),
                SizedBox(
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
                      borderColor:
                          getLanguageKnown(selectedLanguage ?? []) == ""
                              ? Colors.red
                              : Colors.black.withOpacity(0.5),
                      errorMessage: "Please select languages",
                      errorshow: getLanguageKnown(selectedLanguage ?? []) == ""
                          ? true
                          : false,
                      selectedItems: selectedLanguage,
                      hintText: 'Select Languages Known',
                    );
                  }
                }),
                SizedBox(
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
                      borderColor: selectedMothertongue == null
                          ? Colors.red
                          : Colors.black.withOpacity(0.5),
                      errorMessage: "Please select mother tongue",
                      errorshow: selectedMothertongue == null ? true : false,
                      hintText: 'Select Mother tongue',
                    );
                  }
                }),
                SizedBox(
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
                    SizedBox(
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
                if (getFatherAlive() == null)
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
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          controller: fathernameController,
                          labelText: 'Full Name of Father *',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name of father';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
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
                              borderColor: selectedFatherOccupation == null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
                              errorMessage: "Please select occupation",
                              errorshow: selectedFatherOccupation == null
                                  ? true
                                  : false,
                              hintText: 'Select Occupation',
                            );
                          }
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(
                          controller: fatherbusinessController,
                          labelText: 'What kind of business *',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter kind of business';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
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
                              hintText: 'Select Annual income range',
                              borderColor:
                                  selectedFatherAnnualIncomeRange == null
                                      ? Colors.red
                                      : Colors.black.withOpacity(0.5),
                              errorMessage: "Please select income range",
                              errorshow: selectedFatherAnnualIncomeRange == null
                                  ? true
                                  : false,
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                SizedBox(
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
                if (getMotherAlive() == null)
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name of mother';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
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
                              borderColor: selectedMotherOccupation == null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
                              errorMessage: "Please select Occupation",
                              errorshow: selectedMotherOccupation == null
                                  ? true
                                  : false,
                            );
                          }
                        }),
                        SizedBox(
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
                              hintText: 'Select Annual income range',
                              borderColor:
                                  selectedMotherAnnualIncomeRange == null
                                      ? Colors.red
                                      : Colors.black.withOpacity(0.5),
                              errorMessage: "Please select Annual income",
                              errorshow: selectedMotherAnnualIncomeRange == null
                                  ? true
                                  : false,
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                SizedBox(
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
                    SizedBox(
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
                if (getSister() == null)
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
                      SizedBox(
                        height: 15,
                      ),
                      buildDropdownWithSearch(
                        'Number of Sisters *',
                        NumberController.NumberList(),
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
                SizedBox(
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
                    SizedBox(
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
                if (getBrother() == null)
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
                      SizedBox(
                        height: 15,
                      ),
                      buildDropdownWithSearch(
                        'Number of Brothers *',
                        NumberController.NumberList(),
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
                SizedBox(
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
                  'Family type',
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: Colors.black),
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
                      flex: 1,
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
                        Flexible(
                          flex: 1,
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
                    Text(
                      'Affluence level',
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
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
                        Flexible(
                          flex: 1,
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
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
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
                        Flexible(
                          flex: 1,
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
                      if (validation()) {
                        String gotra = gotraController.text.toString().trim();
                        String fathername =
                            fathernameController.text.toString().trim();
                        String fatherbusines =
                            fatherbusinessController.text.toString().trim();
                        String mothername =
                            mothernameController.text.toString().trim();
                        print(
                            "language============${getLanguageKnown(selectedLanguage ?? [])}");
                        _familyDetailsController.familyDetails(
                            context,
                            selectedReligionName ?? "",
                            selectedCastName ?? "",
                            selectedSubCastName ?? "",
                            gotra,
                            getLanguageKnown(selectedLanguage ?? []),
                            selectedMothertongue!,
                            getFatherAlive()!,
                            getFatherAlive() == "Yes" ? fathername : "",
                            getFatherAlive() == "Yes"
                                ? selectedFatherOccupation ?? ""
                                : "",
                            getFatherAlive() == "Yes" ? fatherbusines : "",
                            getFatherAlive() == "Yes"
                                ? selectedFatherAnnualIncomeRange ?? ""
                                : "",
                            getMotherAlive()!,
                            getMotherAlive() == "Yes" ? mothername : "",
                            getMotherAlive() == "Yes"
                                ? selectedMotherOccupation ?? ""
                                : "",
                            getMotherAlive() == "Yes"
                                ? selectedMotherAnnualIncomeRange ?? ""
                                : "",
                            getSister()!,
                            getSister() == "Yes" ? selectedNoSister ?? "" : "",
                            getBrother()!,
                            getBrother() == "Yes"
                                ? selectedNoBrother ?? ""
                                : "",
                            getFamilyType()!,
                            getFamilyValue()!,
                            getAffluenceLevel()!,
                            true);
                      }

                      //  Get.toNamed('/aboutgroom');
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleMedium(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}