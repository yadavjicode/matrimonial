import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/age_list.dart';
import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';
import '../../../constants/CustomTextFeild.dart';
import '../../../constants/lists/highest_qualification_list.dart';
import '../../../constants/lists/title_profession_list.dart';
import '../../../constants/widget/Snackbar.dart';
import '../../../constants/widget/dialog.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = -1;
  RangeValues _currentRangeValues = RangeValues(3, 7);
  String? _heightFrom;
  String? _heightTo;

  final SearchsController searchController = Get.put(SearchsController());
  final HeightController heightController = Get.put(HeightController());
  final NumberController numberController = Get.put(NumberController());
  final AgeController ageController = Get.put(AgeController());
  final MaritalController maritalController = Get.put(MaritalController());
  final ReligionsController religionsController =
      Get.put(ReligionsController());
  final CastController castController = Get.put(CastController());
  final CountryController countryController = Get.put(CountryController());
  final StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  final CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  final HighestQualController highestQualController =
      Get.put(HighestQualController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());
  final TextEditingController nameController = TextEditingController();
  ProfessionController professionController = Get.put(ProfessionController());

  String? selectAgeFrom;
  String? selectAgeTo;
  String? selectHeightFromKey;
  String? selectHeightToKey;
  String? selectMaritalStatus;
  String? selectReligion;
  String? selectCaste;
  String? selectCountry;
  String? selectState;
  String? selectCity;
  String? selectEducation;
  int? profileFilter = 0;
  String? selectedProfession;

  String getLookingFor() {
    if (_selectedIndex == 0) {
      return "Male";
    } else if (_selectedIndex == 1) {
      return "Female";
    } else {
      return "";
    }
  }

  String checkString(String? data) {
    if (data != null) {
      if (data == 'Prefer Not To Say') {
        return "";
      } else {
        return data;
      }
    } else {
      return "";
    }
  }

  String getProfilePercentage() {
    if (profileFilter == 1) {
      return "50-80";
    } else if (profileFilter == 2) {
      return "80-100";
    } else {
      return "";
    }
  }

  bool valodation() {
    if (selectAgeFrom != null && selectAgeFrom != 'Prefer Not To Say' ||
        nameController.text.isNotEmpty ||
        selectAgeTo != null && selectAgeTo != 'Prefer Not To Say' ||
        selectHeightFromKey != null &&
            selectHeightFromKey != 'Prefer Not To Say' ||
        selectHeightToKey != null && selectHeightToKey != 'Prefer Not To Say' ||
        selectMaritalStatus != null &&
            selectMaritalStatus != 'Prefer Not To Say' ||
        selectReligion != null && selectReligion != 'Prefer Not To Say' ||
        selectCaste != null && selectCaste != 'Prefer Not To Say' ||
        selectCountry != null && selectCountry != 'Prefer Not To Say' ||
        selectState != null && selectState != 'Prefer Not To Say' ||
        selectCity != null && selectCity != 'Prefer Not To Say' ||
        selectEducation != null && selectEducation != 'Prefer Not To Say' ||
        selectedProfession != null &&
            selectedProfession != 'Prefer Not To Say' ||
        getProfilePercentage().isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Search',
          style: FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 20, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: nameController,
                        labelText: "Name",
                        hintText: "By Name",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Age",
                        style: FontConstant.styleRegular(
                            fontSize: 16, color: Colors.black),
                      ),
                      Row(children: [
                        Expanded(
                          child: buildDropdownWithSearch(
                            '',
                            ['Prefer Not To Say', ...AgeController.AgeTypes()],
                            (value) {
                              setState(() {
                                selectAgeFrom = value; // Update the state
                              });
                              ageController.selectItem(
                                  value); // Call the controller method
                            },
                            hintText: 'select',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: buildDropdownWithSearch(
                            '',
                            ['Prefer Not To Say', ...AgeController.AgeTypes()],
                            (value) {
                              setState(() {
                                selectAgeTo = value; // Update the state
                              });
                              ageController.selectItem(
                                  value); // Call the controller method
                            },
                            hintText: 'select',
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(() {
                                if (heightController.isLoading.value) {
                                  return buildDropdownWithSearch(
                                    'Height',
                                    ['Loading...'],
                                    (value) {
                                      setState(() {
                                        selectHeightFromKey = null;
                                      });
                                    },
                                    selectedItem: 'Loading...',
                                    hintText: 'Select',
                                  );
                                } else {
                                  return buildDropdownWithSearch(
                                    'Height',
                                    [
                                      'Prefer Not To Say',
                                      ...heightController.HeightLists
                                    ],
                                    (value) {
                                      setState(() {
                                        selectHeightFromKey = value;
                                        // .getHeightList()
                                        // .indexOf(value!)
                                        // .toString();
                                      });
                                      heightController.selectItem(value);
                                    },
                                    hintText: 'Select',
                                  );
                                }
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Obx(() {
                                if (heightController.isLoading.value) {
                                  return buildDropdownWithSearch(
                                    ' ',
                                    ['Loading...'],
                                    (value) {
                                      setState(() {
                                        selectHeightToKey = null;
                                      });
                                    },
                                    selectedItem: 'Loading...',
                                    hintText: 'Select',
                                  );
                                } else {
                                  return buildDropdownWithSearch(
                                    ' ',
                                    [
                                      'Prefer Not To Say',
                                      ...heightController.HeightLists
                                    ],
                                    (value) {
                                      setState(() {
                                        selectHeightToKey = value;
                                        // .getHeightList()
                                        // .indexOf(value!)
                                        // .toString();
                                      });
                                      heightController.selectItem(
                                          value); // Call the controller method
                                    },

                                    // professionController.selectedItem.call,
                                    hintText: 'Select',
                                  );
                                }
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
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
                              'Martial Status',
                              [
                                'Prefer Not To Say',
                                ...maritalController.maritalLists
                              ],
                              (value) {
                                setState(() {
                                  selectMaritalStatus =
                                      value; // Update the state
                                });
                                maritalController.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'select Martial Status',
                            );
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
                          if (religionsController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Religion',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectReligion = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'select Religion',
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
                                  selectReligion = value; // Update the state
                                  selectCaste = null;
                                });
                                religionsController.selectItem(
                                    value); // Call the controller method
                              },
                              hintText: 'select Religion',
                            );
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
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
                              hintText: 'Select Caste',
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
                                  // selectCast = castController.castLists
                                  //     .firstWhere((cast) =>
                                  //         cast['name'] == value)['id'];
                                  selectCaste = value;
                                });
                                castController.selectItem(value);
                              },
                              hintText: 'Select Caste',
                            );
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
                          if (countryController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Country',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectCountry = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'select Country',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Country',
                              [
                                'Prefer Not To Say',
                                ...countryController.getCountryList()
                              ],
                              (value) {
                                setState(() {
                                  selectCountry = value; // Update the state
                                  selectCity = null;
                                  selectState = null;
                                });
                                countryController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectCountry,
                              hintText: 'select Country',
                            );
                          }
                        }),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Obx(() {
                            if (stateControllerPermanent.isLoading.value) {
                              return buildDropdownWithSearch(
                                'State',
                                ['Loading...'],
                                (value) {
                                  setState(() {
                                    selectState = null;
                                  });
                                },
                                selectedItem: 'Loading...',
                                hintText: 'select State',
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'State',
                                [
                                  'Prefer Not To Say',
                                  ...stateControllerPermanent.stateLists
                                ],
                                (value) {
                                  setState(() {
                                    selectState = value; // Update the state
                                    selectCity = null;
                                  });
                                  stateControllerPermanent.selectItem(
                                      value); // Call the controller method
                                },
                                selectedItem: selectState,
                                hintText: 'select State',
                              );
                            }
                          })),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Obx(() {
                            if (cityControllerPermanent.isLoading.value) {
                              return buildDropdownWithSearch(
                                'District/City',
                                ['Loading...'],
                                (value) {
                                  setState(() {
                                    selectCity = null;
                                  });
                                },
                                selectedItem: 'Loading...',
                                hintText: 'select District/City',
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'District/City',
                                [
                                  'Prefer Not To Say',
                                  ...cityControllerPermanent.cityLists
                                ],
                                (value) {
                                  setState(() {
                                    selectCity = value; // Update the state
                                  });
                                  cityControllerPermanent.selectItem(
                                      value); // Call the controller method
                                },
                                selectedItem: selectCity,
                                hintText: 'select District/City',
                              );
                            }
                          })),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Obx(() {
                            if (highestQualController.isLoading.value) {
                              return buildDropdownWithSearch(
                                'Education',
                                ['Loading...'],
                                (value) {
                                  setState(() {
                                    selectEducation = null;
                                  });
                                },
                                selectedItem: 'Loading...',
                                hintText: 'Select Education',
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'Education',
                                highestQualController.HighestLists,
                                (value) {
                                  setState(() {
                                    selectEducation = value; // Update the state
                                  });
                                  highestQualController.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'Select Education',
                              );
                            }
                          })),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
                          if (professionController.isLoading.value) {
                            return buildDropdownWithSearch(
                              'Title of the Profession *',
                              ['Loading...'],
                              (value) {
                                setState(() {
                                  selectedProfession = null;
                                });
                              },
                              selectedItem: 'Loading...',
                              hintText: 'Select Profession',
                            );
                          } else {
                            return buildDropdownWithSearch(
                              'Profession',
                              professionController.getProfessionList(),
                              (value) {
                                setState(() {
                                  selectedProfession =
                                      value; // Update the state
                                });
                                professionController.selectItem(
                                    value); // Call the controller method
                              },
                              selectedItem: selectedProfession,
                              hintText: 'Select Profession',
                            );
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Profile percentage',
                                style: FontConstant.styleRegular(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                            RadioListTile<int>(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('All'),
                              activeColor: AppColors.primaryColor,
                              value: 0,
                              groupValue: profileFilter,
                              onChanged: (int? value) {
                                setState(() {
                                  profileFilter = value;
                                });
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RadioListTile<int>(
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text('50-80%'),
                                    activeColor: AppColors.primaryColor,
                                    value: 1,
                                    groupValue: profileFilter,
                                    onChanged: (int? value) {
                                      setState(
                                        () {
                                          profileFilter = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: RadioListTile<int>(
                                    contentPadding: EdgeInsets.zero,
                                    title: const Text('80-100%'),
                                    activeColor: AppColors.primaryColor,
                                    value: 2,
                                    groupValue: profileFilter,
                                    onChanged: (int? value) {
                                      setState(() {
                                        profileFilter = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: 'Search',
                        onPressed: () {
                          if (userProfileController
                                  .member?.member?.accountType ==
                              1) {
                            if (valodation()) {
                              Get.toNamed('/searchresult', arguments: {
                                "name": nameController.text.toString().trim(),
                                "profession": checkString(selectedProfession),
                                "ageFrom": searchController
                                    .getAge(checkString(selectAgeFrom)),
                                "ageTo": searchController
                                    .getAge(checkString(selectAgeTo)),
                                // "heightFrom":
                                //     searchController.convertToFeetAndInches(
                                //         double.parse(_heightFrom ?? "3.0")),
                                // "heightTo": searchController.convertToFeetAndInches(
                                //     double.parse(_heightTo ?? "7.0")),
                                "heightFrom": checkString(selectHeightFromKey),
                                "heightTo": checkString(selectHeightToKey),
                                "maritalStatus":
                                    checkString(selectMaritalStatus),
                                "religion": checkString(selectReligion),
                                "caste": checkString(selectCaste),
                                "country": checkString(selectCountry),
                                "state": checkString(selectState),
                                "city": checkString(selectCity),
                                "education": checkString(selectEducation),
                                "profilePer":
                                    checkString(getProfilePercentage())
                              });
                            } else {
                              Dialogs.showSnackbar(context,
                                  "Please choose a filter option to proceed with your search!");
                            }
                          } else {
                            DialogConstant.packageDialog(
                                context, 'search feature');
                          }

                          // Get.toNamed('/searchresult');
                        },
                        color: AppColors.primaryColor,
                        textStyle: FontConstant.styleMedium(
                            fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (searchController.isLoading.value)
            const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
        ]);
      }),
    );
  }
}
