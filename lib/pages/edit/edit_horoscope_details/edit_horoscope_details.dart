import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/HoroscopeDetailsController.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditHoroscopeDetails extends StatefulWidget {
  const EditHoroscopeDetails({super.key});

  @override
  State<EditHoroscopeDetails> createState() => _EditHoroscopeDetailsState();
}

class _EditHoroscopeDetailsState extends State<EditHoroscopeDetails> {
  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());
  final FlowController flowController = Get.put(FlowController());

  final HoroscopeDetailsController horoscopeDetailsController =
      Get.put(HoroscopeDetailsController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final TextEditingController time = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedState;
  String? selectedCity;

  bool validateDropDown() {
    if (selectedState != null && selectedCity != null) {
      return true;
    } else {
      return false;
    }
  }

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
    time.text = _editProfileController.member!.member!.timeOfBirth ?? "";
    selectedState = _editProfileController.member!.member!.stateOfBirth;
    selectedCity = _editProfileController.member!.member!.cityOfBirth;
    stateController.selectItem(_editProfileController.member!.member!.stateOfBirth);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryLight,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Horoscope Details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
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
                horoscopeContent()
              ],
            ),
            if (horoscopeDetailsController.isLoading.value ||
                _editProfileController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }

  Widget horoscopeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 35, left: 22, right: 22),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/horoscope.png",
                    height: 117,
                    width: 109,
                  )),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Time Of Birth",
                  style: FontConstant.styleRegular(
                      fontSize: 16, color: AppColors.black),
                ),
              ),
              CustomTextField(
                suffixIcon: Icon(
                  Icons.av_timer,
                  color: AppColors.black,
                ),
                controller: time,
                hintText: "Select Time",
                onTap: () => _selectTime(context),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Time of Birth';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Obx(() {
                  if (stateController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'State of Birth *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedState = null;
                          selectedCity = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select State',
                    );
                  }
                  return buildDropdownWithSearch(
                    'State of Birth *',
                    stateController.getStateList(),
                    (value) {
                      setState(() {
                        selectedState = value;
                        // Reset city when state changes
                        selectedCity = null; // Update the state
                      });
                      stateController
                          .selectItem(value); // Call the controller method
                    },
                    borderColor: selectedState == null
                        ? Colors.red
                        : Colors.black.withOpacity(0.5),
                    errorMessage: "Please Select State of Birth",
                    errorshow: selectedState == null ? true : false,
                    selectedItem: selectedState,
                    hintText: 'Select State',
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Obx(() {
                  if (cityController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'City of Birth *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedCity = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select City',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'City of Birth *',
                      cityController.cityLists,
                      (value) {
                        setState(() {
                          selectedCity = value; // Update the state
                        });
                        cityController
                            .selectItem(value); // Call the controller method
                      },
                      hintText: 'Select City',
                      borderColor: selectedCity == null
                          ? Colors.red
                          : Colors.black.withOpacity(0.5),
                      errorMessage: "Please Select City of Birth",
                      errorshow: selectedCity == null ? true : false,
                      selectedItem: selectedCity,
                    );
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: CustomButton(
                    text: "CONTINUE",
                    onPressed: () => {
                          if (_formKey.currentState!.validate() &&
                              validateDropDown())
                            {
                              horoscopeDetailsController.horoscopeDetails(
                                  context,
                                  time.text.toString().trim(),
                                  selectedState ?? "",
                                  selectedCity ?? "",
                                  true)
                            }

                          //    Get.toNamed('/profile')
                        },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                        fontSize: 20, color: AppColors.constColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}