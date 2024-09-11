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
  WeightController weightController = Get.put(WeightController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
    String mon =
        _basicDetailController.getMonthString(selectedMonth.toString());
    aboutController.text = _editProfileController.member!.member!.about?? "";
    selectHobbies(_editProfileController.member!.member!.hobbies ?? "");
    String dob = _editProfileController.member!.member!.dOB ?? "";
    List<String> dateParts = dob.split('-');

    year = dateParts[0]; // "2005"
    month = dateParts[1]; // "03"
    day = dateParts[2]; // "01"
    selectedHeight=_editProfileController.member!.member!.height?? "";
    selectedWeight=_editProfileController.member!.member!.weight ?? "";
    selectedMaritalStatus=_editProfileController.member!.member!.maritalstatus ?? "";
    selectedDiet=_editProfileController.member!.member!.diet?? "";
  }


  String? selectedTitle;
  String? selectedMaritalStatus;
  String? selectedHeight;
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

  bool validateDropDown() {
    if (isDayValidated == true ||
        day != null &&
            isHeightValidated == true &&
            isWeightValidated == true &&
            isMonthValidated == true &&
            isYearValidated == true) {
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
        ),
        body: Obx(() {
          return Stack(children: [
            basicContent(),
            if (_basicDetailController.isLoading.value ||
                _editProfileController.isLoading.value)
              Center(
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
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 150),
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
                          child: buildDropdownWithSearch(
                            'Marital Status',
                            maritalController.getMaritalList(),
                            (value) {
                              setState(() {
                                selectedMaritalStatus =
                                    value; // Update the state
                              });
                              maritalController.selectItem(
                                  value); // Call the controller method
                            },
                            selectedItem:selectedMaritalStatus,
                            search: false,
                            hintText: 'Select Marital Status',
                          )),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: buildDropdownWithSearch(
                              'Height*',
                              heightController.getHeightList(),
                              (value) => {
                                setState(() => selectedHeight = value),
                                isHeightValidated = true
                              },
                              borderColor: isHeightValidated == false &&
                                      _editProfileController
                                              .member!.member!.height ==
                                          null &&
                                      selectedHeight == null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
                              search: false,
                              selectedItem:selectedHeight,
                              hintText: 'Select Height',
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: buildDropdownWithSearch(
                              'Weight*',
                              weightController.getWeightList(),
                              (value) => {
                                setState(() => selectedWeight = value),
                                isWeightValidated = true
                              },
                              borderColor: isWeightValidated == false &&
                                      selectedWeight == null &&
                                      _editProfileController
                                              .member!.member!.weight ==
                                          null
                                  ? Colors.red
                                  : Colors.black.withOpacity(0.5),
                              search: false,
                              selectedItem:
                                  selectedWeight,
                              hintText: 'Select Weight',
                            ),
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
                      "Hobbies",
                      style: FontConstant.styleRegular(
                          fontSize: 16, color: AppColors.black),
                    ),
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
                      buildDropdownWithSearch(
                          'Diet', dietController.getDietList(), (value) {
                        setState(() {
                          selectedDiet = value; // Update the state
                        });
                        dietController
                            .selectItem(value); // Call the controller method
                      },
                          hintText: 'Select Diet',
                          selectedItem:
                              selectedDiet,
                          search: false),
                      const SizedBox(height: 15),
                      CustomTextField(
                        labelText: "About",
                        maxline: 8,
                        controller: aboutController,
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: CustomButton(
                      text: 'CONTINUE',
                      onPressed: () {
                        if (_formKey.currentState!.validate()||
                            validateDropDown()) {
                          String mon = _basicDetailController.getMonth(
                              selectedMonth.toString() );

                          _basicDetailController.basicDetails(
                              context,
                              _editProfileController
                                      .member!.member!.nameTitle ??
                                  "",
                              _editProfileController.member!.member!.name ?? "",
                              _editProfileController.member!.member!.surename ??
                                  "",
                              _editProfileController
                                      .member!.member!.spiritualName ??
                                  "",
                              selectedMaritalStatus ??
                                  _editProfileController
                                      .member!.member!.maritalstatus ??
                                  "",
                              selectedHeight ??
                                  _editProfileController
                                      .member!.member!.height ??
                                  "",
                              selectedWeight ??
                                  _editProfileController
                                      .member!.member!.weight ??
                                  "",
                              "${selectedYear ?? year ?? "0000"}-${mon.isEmpty?month:mon}-${selectedDay ?? day ?? "00"}",
                              getSelectedHobbies().isEmpty
                                  ? _editProfileController
                                          .member!.member!.hobbies ??
                                      ""
                                  : getSelectedHobbies(),
                              selectedDiet ??
                                  _editProfileController.member!.member!.diet ??
                                  "",
                              aboutController.text.toString().trim(),
                              true
                                  );                       // print(
                         
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
                borderColor: isDayValidated == false &&
                        selectedDay == null &&
                        day == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                search: false,
                selectedItem: day,
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
                borderColor: isMonthValidated == false &&
                        selectedMonth == null &&
                        month == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                search: false,
                selectedItem:
                    _basicDetailController.getMonthString(month.toString()),
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
                borderColor: isYearValidated == false &&
                        selectedYear == null &&
                        year == null
                    ? Colors.red
                    : Colors.black.withOpacity(0.5),
                search: false,
                selectedItem: year,
                hintText: 'Year',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
