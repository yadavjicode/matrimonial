import 'package:devotee/constants/custom_checkbox.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/date_list.dart';
import 'package:devotee/constants/lists/diet_list.dart';
import 'package:devotee/constants/lists/heights_list.dart';
import 'package:devotee/constants/lists/marital_list.dart';
import 'package:devotee/constants/lists/weight_list.dart';
import 'package:devotee/controller/basic_details_controller.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';

class EditBasicDetails extends StatefulWidget {
  const EditBasicDetails({Key? key}) : super(key: key);

  @override
  State<EditBasicDetails> createState() => _EditBasicDetailsState();
}

class _EditBasicDetailsState extends State<EditBasicDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController aboutController = TextEditingController();
  final BasicDetailsController _basicDetailController =
      Get.put(BasicDetailsController());
  DietController dietController = Get.put(DietController());
  MaritalController maritalController = Get.put(MaritalController());
  HeightController heightController = Get.put(HeightController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  WeightConsController weightConsController = Get.put(WeightConsController());

  String? selectedTitle;
  String? selectedMaritalStatus;
  String? selectedHeight;
  String? selectedHeightkey;
  String? selectedWeight;
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
  String? selectedDiet;

  String? year;
  String? month;
  String? day;

  bool isTitleValidated = false;
  bool isHeightValidated = false;
  bool isWeightValidated = false;
  bool isDayValidated = false;
  bool isMonthValidated = false;
  bool isYearValidated = false;

  int? selectedIndex;

  bool show = false;

  bool validateDropDown() {
    if (selectedMaritalStatus != null &&
        selectedHeight != null &&
        selectedWeight != null &&
        selectedDay != null &&
        selectedMonth != null &&
        selectedYear != null &&
        selectedDiet != null &&
        getSelectedHobbies().isNotEmpty) {
      return true;
    } else {
      return false;
    }
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

  void selectHobbies(String selectedHobbies) {
    List<String> selectedList = selectedHobbies.split(', ');

    hobbies.forEach((key, value) {
      hobbies[key] = selectedList.contains(key);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          aboutController.text =
              _editProfileController.member?.member?.about ?? "";

          if (_editProfileController.member?.member?.dOB != null) {
            String dob = _editProfileController.member?.member?.dOB ?? "";
            List<String> dateParts = dob.split('-');
            selectedYear = dateParts[0]; // "2005"
            month = dateParts[1]; // "03"
            selectedDay = dateParts[2];
            selectedMonth =
                _basicDetailController.getMonthString(month.toString());
          }
          selectedHeight = _editProfileController.member?.member?.height;
          selectedWeight = _editProfileController.member?.member?.weight != null
              ? "${_editProfileController.member?.member?.weight} KG"
              : "";
          selectedMaritalStatus =
              _editProfileController.member?.member?.maritalstatus;
          selectedDiet = _editProfileController.member?.member?.diet;
          selectedHeightkey =
              _editProfileController.member?.member?.heightKey ?? "";
          selectHobbies(_editProfileController.member?.member?.hobbies ?? "");
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: Obx(() {
          return Stack(children: [
            basicContent(),
            if (_basicDetailController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget basicContent() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
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
            padding: const EdgeInsets.only(
                left: 22, right: 22, top: 150, bottom: 30),
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
                  const SizedBox(height: 10),
                  Column(
                    children: [
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
                              borderColor:
                                  show == true && selectedMaritalStatus == null
                                      ? Colors.red
                                      : Colors.black.withOpacity(0.5),
                              errorMessage: "Select Marital Status",
                              errorshow:
                                  show == true && selectedMaritalStatus == null
                                      ? true
                                      : false,
                              selectedItem: selectedMaritalStatus,
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
                                      selectedHeightkey = null;
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
                                    setState(() {
                                      selectedHeight = value;
                                      selectedHeightkey = heightController
                                          .getHeightList()
                                          .indexOf(value!)
                                          .toString();
                                      print(
                                          'Selected Height Index: $selectedIndex');
                                    }),
                                    isHeightValidated = true
                                  },
                                  search: true,
                                  borderColor:
                                      show == true && selectedHeight == null
                                          ? Colors.red
                                          : Colors.black.withOpacity(0.5),
                                  errorMessage: "Select Height",
                                  errorshow:
                                      show == true && selectedHeight == null
                                          ? true
                                          : false,
                                  selectedItem: selectedHeight,
                                  hintText: 'Select',
                                );
                              }
                            }),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                              child: buildDropdownWithSearch(
                            'Weight *',
                            weightConsController.getWeight(),
                            (value) => {
                              setState(() => selectedWeight = value),
                              isWeightValidated = true
                            },
                            search: true,
                            borderColor: show == true && selectedWeight == null
                                ? Colors.red
                                : Colors.black.withOpacity(0.5),
                            errorMessage: "Select Weight",
                            errorshow: show == true && selectedWeight == null
                                ? true
                                : false,
                            selectedItem: selectedWeight,
                            hintText: 'Select',
                          )),
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
                          trackBorderColor:
                              MaterialStateProperty.all(AppColors.primaryLight),
                          radius: Radius.circular(
                              10) // Change track border color here
                          ),
                      child: Scrollbar(
                        isAlwaysShown: true,
                        trackVisibility: true,
                        interactive: true,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                            style: FontConstant.styleRegular(
                                                fontSize: 15,
                                                color: AppColors.black),
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
                                selectedDiet = value; // Update the state
                              });
                              dietController.selectItem(
                                  value); // Call the controller method
                            },
                            search: true,
                            borderColor: show == true && selectedDiet == null
                                ? Colors.red
                                : Colors.black.withOpacity(0.5),
                            errorMessage: "Select Diet",
                            selectedItem: selectedDiet,
                            errorshow: show == true && selectedDiet == null
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
                        hintText: "Enter About",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter About';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
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
                              _editProfileController
                                      .member?.member?.nameTitle ??
                                  "",
                              _editProfileController.member?.member?.name ?? "",
                              _editProfileController.member?.member?.surename ??
                                  "",
                              _editProfileController
                                      .member?.member?.spiritualName ??
                                  "",
                              selectedMaritalStatus ?? "",
                              selectedHeightkey ?? "",
                              selectedWeight != null
                                  ? weightConsController
                                      .weightInt(selectedWeight!)
                                      .toString()
                                  : "",
                              "${selectedYear ?? year ?? "0000"}-${mon.isEmpty ? month : mon}-${selectedDay ?? day ?? "00"}",
                              getSelectedHobbies().isEmpty
                                  ? _editProfileController
                                          .member?.member?.hobbies ??
                                      ""
                                  : getSelectedHobbies(),
                              selectedDiet ?? "",
                              aboutController.text.toString().trim(),
                              true); // print(

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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateOfBirthFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Of Birth*',
          style: FontConstant.styleRegular(fontSize: 16, color: Colors.black),
        ),
        Row(
          children: [
            Expanded(
              child: buildDropdownWithSearch(
                '',
                DayController.DayList(),
                (value) => {
                  setState(() => selectedDay = value),
                  isDayValidated = true
                },
                borderColor: show == true && selectedDay == null && day == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                search: false,
                errorMessage: "Select Day",
                errorshow: show == true && selectedDay == null ? true : false,
                selectedItem: selectedDay,
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
                borderColor:
                    show == true && selectedMonth == null && month == null
                        ? Colors.red
                        : Colors.black.withOpacity(0.5),
                search: false,
                errorMessage: "Select Month",
                errorshow: show == true && selectedMonth == null ? true : false,
                selectedItem: selectedMonth,
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
                borderColor:
                    show == true && selectedYear == null && year == null
                        ? Colors.red
                        : Colors.black.withOpacity(0.5),
                search: false,
                errorMessage: "Select Month",
                errorshow: show == true && selectedYear == null ? true : false,
                selectedItem: selectedYear,
                hintText: 'Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
