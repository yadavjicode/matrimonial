import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/income_list.dart';
import 'package:devotee/constants/lists/language_list.dart';
import 'package:devotee/constants/lists/mother_tongue_list.dart';
import 'package:devotee/constants/lists/title_profession_list.dart';
import 'package:devotee/controller/family_details_controller.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';

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
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final String formattedTime = picked.format(context);
      setState(() {
        time.text = formattedTime;
      });
    }
  }

  String getFatherAlive() {
    if (fatherAlive == 1) {
      return "Yes";
    } else if (fatherAlive == 2) {
      return "NO";
    } else {
      return "";
    }
  }

  String getMotherAlive() {
    if (motherAlive == 1) {
      return "Yes";
    } else if (motherAlive == 2) {
      return "NO";
    } else {
      return "";
    }
  }

  String getSister() {
    if (sister == 1) {
      return "Yes";
    } else if (sister == 2) {
      return "NO";
    } else {
      return "";
    }
  }

  String getBrother() {
    if (brother == 1) {
      return "Yes";
    } else if (brother == 2) {
      return "NO";
    } else {
      return "";
    }
  }

  String getFamilyType() {
    if (familytype == 1) {
      return "Joint";
    } else if (familytype == 2) {
      return "Nuclear";
    } else {
      return "";
    }
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

  String getAffluenceLevel() {
    if (affluenceLevel == 1) {
      return "Affluent";
    } else if (affluenceLevel == 2) {
      return "Lower middle";
    } else if (affluenceLevel == 3) {
      return "Middle class";
    } else if (affluenceLevel == 4) {
      return "Upper class";
    } else {
      return "l";
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                SingleChildScrollView(
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
                                child: Image.asset(
                                    'assets/images/familyicon.png')),
                            buildDropdownWithSearch(
                              'Religion',
                              religionController.getReligionNames(),
                              (value) {
                                setState(() {
                                  selectedReligion = religionController
                                      .religionsLists
                                      .firstWhere((religion) =>
                                          religion['name'] == value)['id'];
                                  selectedReligionName = value;
                                });

                                religionController.selectItem(value);
                              },
                              hintText: 'Select Religion',
                            ),

                            const SizedBox(height: 15),
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
                                      selectedCast = castController.castLists
                                          .firstWhere((cast) =>
                                              cast['name'] == value)['id'];
                                      selectedCastName = value;
                                    });
                                    castController.selectItem(value);
                                  },
                                  hintText: 'Select Cast',
                                );
                              }
                            }),
                            const SizedBox(height: 15),
                            Obx(() {
                              if (subCastController.isLoading.value) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
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
                                  hintText: 'Select SubCast',
                                );
                              }
                            }),

                            const SizedBox(height: 15),
                            CustomTextField(
                                controller: gotraController,
                                labelText: 'Gotra'),
                            // const SizedBox(height: 15),
                            // Text(
                            //   'Languages known',
                            //   style: FontConstant.styleRegular(
                            //       fontSize: 16, color: Colors.black),
                            // ),
                            // const SizedBox(height: 15),
                            // SizedBox(
                            //   height: 130,
                            //   child: GridView.builder(
                            //     scrollDirection: Axis.vertical,
                            //     gridDelegate:
                            //         const SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: 2,
                            //       crossAxisSpacing: 10,
                            //       mainAxisSpacing: 10,
                            //       childAspectRatio: 29 / 6,
                            //     ),
                            //     itemCount: showAll ? languages.length : 6,
                            //     itemBuilder: (context, index) {
                            //       String language = languages[index];
                            //       bool isSelected =
                            //           selectedLanguages.contains(language);
                            //       if (!showAll && index == 5) {
                            //         return GestureDetector(
                            //           onTap: () {
                            //             setState(() {
                            //               showAll = true;
                            //             });
                            //           },
                            //           child: Container(
                            //             decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.grey, width: 1.0),
                            //               borderRadius:
                            //                   BorderRadius.circular(20),
                            //             ),
                            //             alignment: Alignment.center,
                            //             child: const Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.center,
                            //               children: [
                            //                 Icon(
                            //                   CupertinoIcons.plus,
                            //                   size: 15,
                            //                 ),
                            //                 SizedBox(
                            //                   width: 2,
                            //                 ),
                            //                 Text('More'),
                            //               ],
                            //             ),
                            //           ),
                            //         );
                            //       } else {
                            //         String language = languages[index];
                            //         bool isSelected =
                            //             selectedLanguages.contains(language);
                            //         return GestureDetector(
                            //           onTap: () {
                            //             setState(
                            //               () {
                            //                 if (isSelected) {
                            //                   selectedLanguages
                            //                       .remove(language);
                            //                   selectedLanguagesList
                            //                       .remove(language);
                            //                 } else {
                            //                   selectedLanguages.add(language);
                            //                   selectedLanguagesList
                            //                       .add(language); // Add to list
                            //                 }
                            //               },
                            //             );
                            //           },
                            //           child: Container(
                            //             alignment: Alignment.center,
                            //             decoration: BoxDecoration(
                            //               color: isSelected
                            //                   ? Colors.white
                            //                   : Colors.transparent,
                            //               border: Border.all(
                            //                   color: isSelected
                            //                       ? Colors.white
                            //                       : Colors.grey,
                            //                   width: 1.0),
                            //               borderRadius:
                            //                   BorderRadius.circular(20),
                            //             ),
                            //             child: Container(
                            //               decoration: BoxDecoration(
                            //                 border: Border.all(
                            //                     color: Colors.grey, width: 0.2),
                            //                 borderRadius:
                            //                     BorderRadius.circular(20),
                            //               ),
                            //               alignment: Alignment.center,
                            //               child: Row(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.center,
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.center,
                            //                 children: [
                            //                   if (isSelected)
                            //                     const Icon(
                            //                       CupertinoIcons.checkmark_alt,
                            //                       size: 20,
                            //                       color: AppColors.primaryColor,
                            //                     ),
                            //                   if (isSelected) const SizedBox(),
                            //                   const SizedBox(
                            //                     width: 4,
                            //                   ),
                            //                   // const SizedBox(
                            //                   //   width: 40,
                            //                   // ),
                            //                   Text(
                            //                     language,
                            //                     style:
                            //                         FontConstant.styleRegular(
                            //                             fontSize: 16,
                            //                             color: isSelected
                            //                                 ? AppColors
                            //                                     .primaryColor
                            //                                 : AppColors.black),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     },
                            //   ),
                            // ),
                            SizedBox(
                              height: 15,
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
                              height: 15,
                            ),
                            buildDropdownWithSearch(
                              'Mother tongue',
                              motherTongueController.getMotherTongueList(),
                              //  languageController.selectedItem.call,
                              (value) {
                                setState(() {
                                  selectedMothertongue =
                                      value; // Update the state
                                });
                                motherTongueController.selectItem(
                                    value); // Call the controller method
                                    print(
                                    "selectedMothertongue===============$selectedMothertongue");
                              },
                              hintText: 'Select Mother tongue',
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Father alive',
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
                            if (getFatherAlive() == "Yes")
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller: fathernameController,
                                    labelText: 'Full Name of Father',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(() {
                                    if (professionController.isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'Occupation',
                                        professionController
                                            .getProfessionList(),
                                        (value) {
                                          setState(() {
                                            selectedFatherOccupation =
                                                value; // Update the state
                                          });
                                          professionController.selectItem(
                                              value); // Call the controller method
                                        },
                                        hintText: 'Select Occupation',
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CustomTextField(
                                    controller: fatherbusinessController,
                                    labelText: 'What kind of business',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildDropdownWithSearch(
                                    'Annual income range',
                                    incomeController.getIncomeList(),
                                    (value) {
                                      setState(() {
                                        selectedFatherAnnualIncomeRange =
                                            value; // Update the state
                                      });
                                      incomeController.selectItem(
                                          value); // Call the controller method
                                    },
                                    // incomeController.selectedItem.call,
                                    hintText: 'Select Annual income range',
                                  ),
                                ],
                              ),

                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Mother alive',
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
                            if (getMotherAlive() == "Yes")
                              Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller: mothernameController,
                                    labelText: 'Full Name of Mother',
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(() {
                                    if (professionController.isLoading.value) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primaryColor,
                                        ),
                                      );
                                    } else {
                                      return buildDropdownWithSearch(
                                        'Occupation',
                                        professionController
                                            .getProfessionList(),
                                        (value) {
                                          setState(() {
                                            selectedMotherOccupation =
                                                value; // Update the state
                                          });
                                          professionController.selectItem(
                                              value); // Call the controller method
                                        },
                                        hintText: 'Select Occupation',
                                      );
                                    }
                                  }),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildDropdownWithSearch(
                                    'Annual income range',
                                    incomeController.getIncomeList(),
                                    (value) {
                                      setState(() {
                                        selectedMotherAnnualIncomeRange =
                                            value; // Update the state
                                      });
                                      incomeController.selectItem(
                                          value); // Call the controller method
                                    },
                                    hintText: 'Select Annual income range',
                                  ),
                                ],
                              ),

                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1,
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Sister',
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
                            if (getSister() == "Yes")
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildDropdownWithSearch(
                                    'Number of Sisters',
                                    NumberController.NumberList(),
                                    (value) {
                                      setState(() {
                                        selectedNoSister =
                                            value; // Update the state
                                      });
                                      numberController.selectItem(
                                          value); // Call the controller method
                                    },
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
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Brother',
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

                            if (getBrother() == "Yes")
                              Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  buildDropdownWithSearch(
                                    'Number of Brothers',
                                    NumberController.NumberList(),
                                    (value) {
                                      setState(() {
                                        selectedNoBrother =
                                            value; // Update the state
                                      });
                                      numberController.selectItem(
                                          value); // Call the controller method
                                    },
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
                              decoration:
                                  const BoxDecoration(color: Colors.grey),
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
                                  String gotra =
                                      gotraController.text.toString().trim();
                                  String fathername = fathernameController.text
                                      .toString()
                                      .trim();
                                  String fatherbusines =
                                      fatherbusinessController.text
                                          .toString()
                                          .trim();
                                  String mothername = mothernameController.text
                                      .toString()
                                      .trim();
                                  _familyDetailsController.familyDetails(
                                      context,
                                      selectedReligionName ?? "",
                                      selectedCastName ?? "",
                                      selectedSubCastName ?? "",
                                      gotra,
                                      getLanguageKnown(selectedLanguage ?? [])
                                          .toString(),
                                      selectedMothertongue ?? "",
                                      getFatherAlive(),
                                      fathername,
                                      selectedFatherOccupation ?? "",
                                      fatherbusines,
                                      selectedFatherAnnualIncomeRange ?? "",
                                      getMotherAlive(),
                                      mothername,
                                      selectedMotherOccupation ?? "",
                                      selectedMotherAnnualIncomeRange ?? "",
                                      getSister(),
                                      selectedNoSister ?? "",
                                      getBrother(),
                                      selectedNoBrother ?? "",
                                      getFamilyType(),
                                      getFamilyValue(),
                                      getAffluenceLevel());

                                  //  Get.toNamed('/aboutgroom');
                                },
                                color: AppColors.primaryColor,
                                textStyle: FontConstant.styleMedium(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: CustomButton(
                                text: 'Skip',
                                onPressed: () {
                                  Get.offAndToNamed('/horoscope');
                                },
                                color: Colors.transparent,
                                textStyle: FontConstant.styleRegular(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_familyDetailsController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
