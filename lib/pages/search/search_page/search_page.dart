import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/age_list.dart';
import 'package:devotee/constants/lists/catagory.dart';
import 'package:devotee/constants/lists/education_list.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/controller/list_controller.dart';
import 'package:devotee/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:get/get.dart';

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

  bool selectprofileA = false;
  bool selectprofileB = false;
  bool selectprofileC = false;

  SearchsController searchController = Get.put(SearchsController());
  HeightController heightController = Get.put(HeightController());
  NumberController numberController = Get.put(NumberController());
  AgeController ageController = Get.put(AgeController());
  MaritalController maritalController = Get.put(MaritalController());
  ReligionsController religionsController = Get.put(ReligionsController());
  CastController castController = Get.put(CastController());
  CountryController countryController = Get.put(CountryController());
  StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  EducationController educationController = Get.put(EducationController());

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

  String getLookingFor() {
    if (_selectedIndex == 0) {
      return "Male";
    } else if (_selectedIndex == 1) {
      return "Female";
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                  padding: const EdgeInsets.only(left: 22,right: 22,top: 30,bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CustomTextField(
                      //   labelText: "Search Keywords",
                      //   hintText: "e.g. by name, by ID etc.",
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Text(
                      //   'Looking For',
                      //   style: FontConstant.styleRegular(
                      //       fontSize: 16, color: Colors.black),
                      // ),
                      // const SizedBox(height: 10),
                      // SizedBox(
                      //   height: 50,
                      //   width: double.infinity,
                      //   child: GridView.builder(
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     scrollDirection: Axis.vertical,
                      //     gridDelegate:
                      //         const SliverGridDelegateWithFixedCrossAxisCount(
                      //       crossAxisCount: 2,
                      //       crossAxisSpacing: 10,
                      //       mainAxisSpacing: 1,
                      //       childAspectRatio: 3.5,
                      //     ),
                      //     itemCount: looking.length,
                      //     itemBuilder: (context, index) {
                      //       return GestureDetector(
                      //         onTap: () {
                      //           setState(() {
                      //             _selectedIndex = index;
                      //           });
                      //         },
                      //         child: Card(
                      //           color: _selectedIndex == index
                      //               ? AppColors.constColor
                      //               : AppColors.background,
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(10),
                      //               border: _selectedIndex == index
                      //                   ? Border.all(
                      //                       color: AppColors.primaryColor,
                      //                       width: 2)
                      //                   : null,
                      //             ),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 CircleAvatar(
                      //                   backgroundColor: Colors.transparent,
                      //                   radius: 20,
                      //                   child: looking[index].image,
                      //                 ),
                      //                 const SizedBox(height: 8),
                      //                 Text(
                      //                   looking[index].gender,
                      //                   style: FontConstant.styleMedium(
                      //                       fontSize: 14,
                      //                       color: AppColors.primaryColor),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Age",
                        style: FontConstant.styleRegular(
                            fontSize: 16, color: Colors.black),
                      ),
                      Row(children: [
                        Expanded(
                          child: buildDropdownWithSearch(
                            '',
                            AgeController.AgeTypes(),
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: buildDropdownWithSearch(
                            '',
                            AgeController.AgeTypes(),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Height',
                      //         style: FontConstant.styleRegular(
                      //             fontSize: 16, color: Colors.black),
                      //       ),
                      //       RangeSlider(
                      //         activeColor: AppColors.purple,
                      //         values: _currentRangeValues,
                      //         min: 3.0,
                      //         max: 7.0,
                      //         divisions:
                      //             40, // 40 divisions for steps of 0.1 (e.g., (7-3)/0.1)
                      //         labels: RangeLabels(
                      //           _currentRangeValues.start.toStringAsFixed(1),
                      //           _currentRangeValues.end.toStringAsFixed(1),
                      //         ),
                      //         onChanged: (RangeValues values) {
                      //           setState(() {
                      //             _currentRangeValues = values;
                      //             _heightFrom = _currentRangeValues.start
                      //                 .toStringAsFixed(1);
                      //             _heightTo = _currentRangeValues.end
                      //                 .toStringAsFixed(1);
                      //           });
                      //         },
                      //       ),
                      //       Row(
                      //         children: [
                      //           Text(
                      //             "3 feet",
                      //             style: FontConstant.styleRegular(
                      //                 fontSize: 15, color: AppColors.black),
                      //           ),
                      //           Spacer(),
                      //           Text(
                      //             "7 feet",
                      //             style: FontConstant.styleRegular(
                      //                 fontSize: 15, color: AppColors.black),
                      //           )
                      //         ],
                      //       )
                      //     ],
                      //   ),
                      // ),
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
                                    heightController.HeightLists,
                                    (value) {
                                      setState(() {
                                        selectHeightFromKey = heightController
                                            .getHeightList()
                                            .indexOf(value!)
                                            .toString();
                                      });
                                      heightController.selectItem(value);
                                    },
                                    hintText: 'Select',
                                  );
                                }
                              }),
                            ),
                            SizedBox(
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
                                    heightController.HeightLists,
                                    (value) {
                                      setState(() {
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
                              maritalController.maritalLists,
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
                              religionsController.getReligionNames(),
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
                              countryController.getCountryList(),
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
                                stateControllerPermanent.stateLists,
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
                                cityControllerPermanent.cityLists,
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
                            if (educationController.isLoading.value) {
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
                                educationController.EducationLists,
                                (value) {
                                  setState(() {
                                    selectEducation = value; // Update the state
                                  });
                                  educationController.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'Select Education',
                              );
                            }
                          })),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         'Show Profile',
                      //         style: FontConstant.styleRegular(
                      //             fontSize: 16, color: Colors.black),
                      //       ),
                      //       Row(
                      //         children: [
                      //           CustomCheckbox(
                      //             value: selectprofileA!,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 selectprofileA = value;
                      //               });
                      //             },
                      //           ),
                      //           Text("With Photo"),
                      //           Spacer(),
                      //           CustomCheckbox(
                      //             value: selectprofileB!,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 selectprofileB = value;
                      //               });
                      //             },
                      //           ),
                      //           Text("Online Right Now"),
                      //           SizedBox(
                      //             width: 10,
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         children: [
                      //           CustomCheckbox(
                      //             value: selectprofileC!,
                      //             onChanged: (value) {
                      //               setState(() {
                      //                 selectprofileC = value;
                      //               });
                      //             },
                      //           ),
                      //           Text("Premium Members"),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'Search',
                        onPressed: () {
                          print(
                              "height index==========================${selectHeightFromKey}");
                          Get.toNamed('/searchresult', arguments: {
                            "ageFrom":
                                searchController.getAge(selectAgeFrom ?? ""),
                            "ageTo": searchController.getAge(selectAgeTo ?? ""),
                            // "heightFrom":
                            //     searchController.convertToFeetAndInches(
                            //         double.parse(_heightFrom ?? "3.0")),
                            // "heightTo": searchController.convertToFeetAndInches(
                            //     double.parse(_heightTo ?? "7.0")),
                            "heightFrom": selectHeightFromKey ?? "",
                            "heightTo": selectHeightToKey ?? "",
                            "maritalStatus": selectMaritalStatus ?? "",
                            "religion": selectReligion ?? "",
                            "caste": selectCaste ?? "",
                            "country": selectCountry ?? "",
                            "state": selectState ?? "",
                            "city": selectCity ?? "",
                            "education": selectEducation ?? ""
                          });

                          // Get.toNamed('/searchresult');
                        },
                        color: AppColors.primaryColor,
                        textStyle: FontConstant.styleMedium(
                            fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (searchController.isLoading.value)
            Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
        ]);
      }),
    );
  }
}
