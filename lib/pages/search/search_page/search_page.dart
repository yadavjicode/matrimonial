import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/custom_checkbox.dart';
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
import '../../../constants/profile_constant.dart';

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
  void dispose() {
    // TODO: implement dispose
    religionsController.noSuchMethod;
    super.dispose();
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
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: screenHeight * 0.5, left: screenWidth * 0.2),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg3.png'),
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Height',
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: Colors.black),
                            ),
                            RangeSlider(
                              activeColor: AppColors.purple,
                              values: _currentRangeValues,
                              min: 3.0,
                              max: 7.0,
                              divisions:
                                  40, // 40 divisions for steps of 0.1 (e.g., (7-3)/0.1)
                              labels: RangeLabels(
                                _currentRangeValues.start.toStringAsFixed(1),
                                _currentRangeValues.end.toStringAsFixed(1),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                  _heightFrom = _currentRangeValues.start
                                      .toStringAsFixed(1);
                                  _heightTo = _currentRangeValues.end
                                      .toStringAsFixed(1);
                                });
                              },
                            ),
                            Row(
                              children: [
                                Text(
                                  "3 feet",
                                  style: FontConstant.styleRegular(
                                      fontSize: 15, color: AppColors.black),
                                ),
                                Spacer(),
                                Text(
                                  "7 feet",
                                  style: FontConstant.styleRegular(
                                      fontSize: 15, color: AppColors.black),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: buildDropdown(
                          'Martial Status',
                          maritalController.maritalLists,
                          (value) {
                            setState(() {
                              selectMaritalStatus = value; // Update the state
                            });
                            maritalController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'select Martial Status',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: buildDropdownWithSearch(
                          'Religion',
                          religionsController.getReligionNames(),
                          (value) {
                            setState(() {
                              selectReligion = value; // Update the state
                            });
                            religionsController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'select Religion',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Obx(() {
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
                              hintText: 'Select Caste',
                            );
                          }
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: buildDropdownWithSearch(
                          'Country',
                          countryController.getCountryList(),
                          (value) {
                            setState(() {
                              selectCountry = value; // Update the state
                            });
                            countryController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'select Country',
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Obx(() {
                            if (stateControllerPermanent.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            } else {
                              return buildDropdownWithSearch(
                                'State',
                                stateControllerPermanent.stateLists,
                                (value) {
                                  setState(() {
                                    selectCaste = value; // Update the state
                                  });
                                  stateControllerPermanent.selectItem(
                                      value); // Call the controller method
                                },
                                hintText: 'select State',
                              );
                            }
                          })),
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Obx(() {
                            if (cityControllerPermanent.isLoading.value) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
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
                                hintText: 'select District/City',
                              );
                            }
                          })),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: buildDropdownWithSearch(
                          'Education',
                          educationController.EducationLists,
                          (value) {
                            setState(() {
                              selectEducation = value; // Update the state
                            });
                            educationController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'select Education',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Show Profile',
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: Colors.black),
                            ),
                            Row(
                              children: [
                                CustomCheckbox(
                                  value: selectprofileA!,
                                  onChanged: (value) {
                                    setState(() {
                                      selectprofileA = value;
                                    });
                                  },
                                ),
                                Text("With Photo"),
                                Spacer(),
                                CustomCheckbox(
                                  value: selectprofileB!,
                                  onChanged: (value) {
                                    setState(() {
                                      selectprofileB = value;
                                    });
                                  },
                                ),
                                Text("Online Right Now"),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CustomCheckbox(
                                  value: selectprofileC!,
                                  onChanged: (value) {
                                    setState(() {
                                      selectprofileC = value;
                                    });
                                  },
                                ),
                                Text("Premium Members"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        text: 'Search',
                        onPressed: () {
                          Get.toNamed('/searchresult', arguments: {
                            "ageFrom":
                                searchController.getAge(selectAgeFrom ?? ""),
                            "ageTo": searchController.getAge(selectAgeTo ?? ""),
                            "heightFrom":
                                searchController.convertToFeetAndInches(
                                    double.parse(_heightFrom ?? "3.0")),
                            "heightTo": searchController.convertToFeetAndInches(
                                double.parse(_heightTo ?? "7.0")),
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
              ],
            ),
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
