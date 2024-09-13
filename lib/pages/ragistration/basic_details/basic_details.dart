import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/date_list.dart';
import 'package:devotee/constants/lists/diet_list.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/constants/lists/title_list.dart';
import 'package:devotee/constants/lists/weight_list.dart';
import 'package:devotee/controller/basic_details_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({Key? key}) : super(key: key);

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController initiatedNameController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final FlowController flowController = Get.put(FlowController());

  final BasicDetailsController _basicDetailController =
      Get.put(BasicDetailsController());
  DietController dietController = Get.put(DietController());
  MaritalController maritalController = Get.put(MaritalController());
  HeightController heightController = Get.put(HeightController());
  WeightController weightController = Get.put(WeightController());

  bool show = false;

  String? selectedTitle;
  String? selectedMaritalStatus;
  String? selectedHeight;
  String? selectedWeight;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedDiet;

  bool isTitleValidated = false;
  bool isHeightValidated = false;
  bool isWeightValidated = false;
  bool isDayValidated = false;
  bool isMonthValidated = false;
  bool isYearValidated = false;

  bool validateDropDown() {
    if (selectedTitle != null &&
        selectedMaritalStatus != null &&
        selectedHeight != null &&
        selectedWeight != null &&
        selectedDay != null &&
        selectedMonth!=null&&
        selectedYear!=null&&
        getSelectedHobbies().isNotEmpty&&
        selectedDiet != null
        ) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.clear();
    surnameController.clear();
    initiatedNameController.clear();
    aboutController.clear();
  }

  Map<String, bool> hobbies = {
    "Art / Handicraft": false,
    "Yoga": false,
    "Cooking": false,
    "Dancing": false,
    "Gardening / Landscaping": false,
    "Painting": false,
    "Gym": false,
    "Travelling": false,
    "Serving Animals": false,
    "Politics": false,
    "Writing": false,
    "Spending Time With Nature": false,
    "Reading Newspaper": false,
  };
  String getSelectedHobbies() {
    return hobbies.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .join(", ");
  }

  //bool ismaritalValidated = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Basic Details",
            style:
                FontConstant.styleSemiBold(fontSize: 18, color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/profile1');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.4,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bg3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.35,
                    right: screenWidth * 0.35,
                    child: Image.asset('assets/images/profile.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 150),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "(*) Fields are mandatory",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100,
                                    child: buildDropdownWithSearch(
                                      'Title *',
                                      TittleController.TittleList(),
                                      (value) => {
                                        setState(() => selectedTitle = value),
                                        isTitleValidated = true
                                      },
                                      borderColor: (selectedTitle == null &&
                                              show == true)
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      search: false,
                                      errorMessage: "Select Title",
                                      errorshow:
                                          show == true && selectedTitle == null
                                              ? true
                                              : false,
                                      hintText: 'Mr',
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: "Name *",
                                      controller: nameController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText: "Surname *",
                                  controller: surnameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter surname';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: CustomTextField(
                                  labelText: "Initiated Name (Spiritual Name)",
                                  controller: initiatedNameController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Obx(() {
                                  if (maritalController.isLoading.value) {
                                    return buildDropdownWithSearch(
                                      'Marital Status *',
                                      ['Loading...'],
                                      (value) {
                                        setState(() {
                                          selectedMaritalStatus = null;
                                        });
                                      },
                                      selectedItem: 'Loading...',
                                      hintText: 'Select Marital Status',
                                    );
                                  } else {
                                    return buildDropdownWithSearch(
                                      'Marital Status *',
                                      maritalController.getMaritalList(),
                                      (value) {
                                        setState(() {
                                          selectedMaritalStatus =
                                              value; // Update the state
                                        });
                                        maritalController.selectItem(
                                            value); // Call the controller method
                                      },
                                      search: true,
                                      borderColor: show == true &&
                                              selectedMaritalStatus == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                      errorMessage: "Select Marital Status",
                                      errorshow: show == true &&
                                              selectedMaritalStatus == null
                                          ? true
                                          : false,
                                      hintText: 'Select Marital Status',
                                    );
                                  }
                                }),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Obx(() {
                                      if (heightController.isLoading.value) {
                                        return buildDropdownWithSearch(
                                          'Height *',
                                          ['Loading...'],
                                          (value) {
                                            setState(() {
                                              selectedHeight = null;
                                            });
                                          },
                                          selectedItem: 'Loading...',
                                          hintText: 'Select',
                                        );
                                      } else {
                                        return buildDropdownWithSearch(
                                          'Height *',
                                          heightController.getHeightList(),
                                          (value) => {
                                            setState(
                                                () => selectedHeight = value),
                                            isHeightValidated = true
                                          },
                                          search: true,
                                          borderColor: show == true &&
                                                  selectedHeight == null
                                              ? Colors.red
                                              : Colors.black.withOpacity(0.5),
                                          errorMessage: "Select Height",
                                          errorshow: show == true &&
                                                  selectedHeight == null
                                              ? true
                                              : false,
                                          hintText: 'Select',
                                        );
                                      }
                                    }),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Obx(() {
                                      if (weightController.isLoading.value) {
                                        return buildDropdownWithSearch(
                                          'Weight *',
                                          ['Loading...'],
                                          (value) {
                                            setState(() {
                                              selectedWeight = null;
                                            });
                                          },
                                          selectedItem: 'Loading...',
                                          hintText: 'Select',
                                        );
                                      } else {
                                        return buildDropdownWithSearch(
                                          'Weight *',
                                          weightController.getWeightList(),
                                          (value) => {
                                            setState(
                                                () => selectedWeight = value),
                                            isWeightValidated = true
                                          },
                                          search: true,
                                          borderColor: show == true &&
                                                  selectedWeight == null
                                              ? Colors.red
                                              : Colors.black.withOpacity(0.5),
                                          errorMessage: "Select Weight",
                                          errorshow: show == true &&
                                                  selectedWeight == null
                                              ? true
                                              : false,
                                          hintText: 'Select',
                                        );
                                      }
                                    }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          _buildDateOfBirthFields(),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text(
                              "Hobbies *",
                              style: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.black),
                            ),
                          ),
                          if (show == true && getSelectedHobbies().isEmpty)
                            Text(
                              "Select Hobbies",
                              style: FontConstant.styleRegular(
                                  fontSize: 11, color: AppColors.red),
                            ),
                          Container(
                            height: 250,
                            child: ScrollbarTheme(
                              data: ScrollbarThemeData(
                                  thumbColor: MaterialStateProperty.all(AppColors
                                      .primaryColor), // Change thumb color here
                                  trackColor: MaterialStateProperty.all(AppColors
                                      .primaryLight), // Change track color here
                                  trackBorderColor: MaterialStateProperty.all(
                                      AppColors.primaryLight),
                                  radius: Radius.circular(
                                      10) // Change track border color here
                                  ),
                              child: Scrollbar(
                                isAlwaysShown: true,
                                trackVisibility: true,
                                interactive: true,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: hobbies.keys
                                        .take(hobbies.length)
                                        .map((key) => Row(
                                              children: [
                                                CustomCheckbox(
                                                  value: hobbies[key]!,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      hobbies[key] = value;
                                                    });
                                                  },
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    key,
                                                    style: FontConstant
                                                        .styleRegular(
                                                            fontSize: 15,
                                                            color: AppColors
                                                                .black),
                                                  ),
                                                )
                                              ],
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() {
                                if (dietController.isLoading.value) {
                                  return buildDropdownWithSearch(
                                    'Diet *',
                                    ['Loading...'],
                                    (value) {
                                      setState(() {
                                        selectedDiet = null;
                                      });
                                    },
                                    selectedItem: 'Loading...',
                                    hintText: 'Select Diet',
                                  );
                                } else {
                                  return buildDropdownWithSearch(
                                    'Diet *',
                                    dietController.getDietList(),
                                    (value) {
                                      setState(() {
                                        selectedDiet =
                                            value; // Update the state
                                      });
                                      dietController.selectItem(
                                          value); // Call the controller method
                                    },
                                    search: true,
                                    borderColor:
                                        show == true && selectedDiet == null
                                            ? Colors.red
                                            : Colors.black.withOpacity(0.5),
                                    errorMessage: "Select Diet",
                                    errorshow:
                                        show == true && selectedDiet == null
                                            ? true
                                            : false,
                                    hintText: 'Select Diet',
                                  );
                                }
                              }),
                              const SizedBox(height: 15),
                              CustomTextField(
                                labelText: "About *",
                                maxline: 8,
                                controller: aboutController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter About';
                                  }
                                  return null;
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: CustomButton(
                              text: 'CONTINUE',
                              onPressed: () {
                                setState(() {
                                  show = true;
                                });
                                if (_formKey.currentState!.validate() &&
                                    validateDropDown()) {
                                  String mon = _basicDetailController
                                      .getMonth(selectedMonth.toString());
                                  _basicDetailController.basicDetails(
                                      context,
                                      selectedTitle ?? "",
                                      nameController.text.toString().trim(),
                                      surnameController.text.toString().trim(),
                                      initiatedNameController.text
                                          .toString()
                                          .trim(),
                                      selectedMaritalStatus ?? "",
                                      selectedHeight ?? "",
                                      selectedWeight ?? "",
                                      "$selectedYear-$mon-$selectedDay",
                                      getSelectedHobbies(),
                                      selectedDiet ?? "",
                                      aboutController.text.toString().trim(),
                                      false);

                                  //   Get.toNamed('/contact');
                                }
                              },
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          //   const SizedBox(height: 15),
                          // _buildSkipButton()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_basicDetailController.isLoading.value ||
                flowController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget _buildDateOfBirthFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth *',
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildDropdownWithSearch(
                '',
                DayController.DayList(),
                (value) => {
                  setState(() => selectedDay = value),
                  isDayValidated = true
                },
                search: true,
                borderColor: show == true && selectedDay == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                errorMessage: "Select Day",
                errorshow: show == true && selectedDay == null ? true : false,
                hintText: 'Day',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildDropdownWithSearch(
                '',
                MonthController.MonthList(),
                (value) => {
                  setState(() => selectedMonth = value),
                  isMonthValidated = true
                },
                search: true,
                borderColor: show == true && selectedMonth == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                errorMessage: "Select Monthy",
                errorshow: show == true && selectedMonth == null ? true : false,
                hintText: 'Month',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: buildDropdownWithSearch(
                '',
                YearController.yearList(),
                (value) => {
                  setState(() => selectedYear = value),
                  isYearValidated = true
                },
                search: true,
                borderColor: show == true && selectedYear == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                errorMessage: "Select Year",
                errorshow: show == true && selectedYear == null ? true : false,
                hintText: 'Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// Widget _buildSkipButton() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 5.0),
//     child: CustomButton(
//       text: 'Skip',
//       onPressed: () {
//         Get.offAndToNamed('/dashboard');
//       },
//       color: Colors.transparent,
//       textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
//     ),
//   );
// }
