import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/HoroscopeDetailsController.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/edit_profile_controller.dart';
import '../../../controller/skip_controller.dart';

class HoroscopeDetails extends StatefulWidget {
  const HoroscopeDetails({super.key});

  @override
  State<HoroscopeDetails> createState() => _HoroscopeDetailsState();
}

class _HoroscopeDetailsState extends State<HoroscopeDetails> {
  final CountryController countryController = Get.put(CountryController());

  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());
  final FlowController flowController = Get.put(FlowController());
  final SkipController skipController = Get.put(SkipController());
  final HoroscopeDetailsController horoscopeDetailsController =
      Get.put(HoroscopeDetailsController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  final TextEditingController time = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

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
      _editProfileController.userDetails(context).then((_) {
        setState(() {
          time.text = _editProfileController.member?.member?.timeOfBirth ?? "";
          selectedCountry =
              _editProfileController.member?.member?.countryOfBirth;
          selectedState = _editProfileController.member?.member?.stateOfBirth;
          selectedCity = _editProfileController.member?.member?.cityOfBirth;
          countryController.selectItem(selectedCountry);
          stateController.selectItem(selectedState);
        });
      });
    });
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/family');
            },
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

  Widget horoscopeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 35, left: 22, right: 22, bottom: 20),
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
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                labelText: "Time Of Birth *",
                suffixIcon: const Icon(
                  Icons.av_timer,
                  color: AppColors.black,
                ),
                controller: time,
                hintText: "Select Time",
                onTap: () => _selectTime(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Obx(() {
                  if (countryController.isLoading.value) {
                    return buildDropdownWithSearch(
                      'Country *',
                      ['Loading...'],
                      (value) {
                        setState(() {
                          selectedCountry = null;
                          selectedState = null;
                          selectedCity = null;
                        });
                      },
                      selectedItem: 'Loading...',
                      hintText: 'Select Nationality',
                    );
                  } else {
                    return buildDropdownWithSearch(
                      'Country *',
                      [
                        'Prefer Not To Say',
                        ...countryController.getCountryList()
                      ],
                      (String? value) {
                        setState(() {
                          selectedCountry = value;
                          selectedState = null;
                          selectedCity = null;
                          // Update the state
                        });
                        countryController.selectItem(value);
                      },
                      selectedItem: selectedCountry,
                      hintText: 'Select Nationality',
                    );
                  }
                }),
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
                    ['Prefer Not To Say', ...stateController.stateLists],
                    (value) {
                      setState(() {
                        selectedState = value;
                        // Reset city when state changes
                        selectedCity = null; // Update the state
                      });
                      stateController
                          .selectItem(value); // Call the controller method
                    },
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
                      ['Prefer Not To Say', ...cityController.cityLists],
                      (value) {
                        setState(() {
                          selectedCity = value; // Update the state
                        });
                        cityController
                            .selectItem(value); // Call the controller method
                      },
                      hintText: 'Select City',
                      selectedItem: selectedCity,
                    );
                  }
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: CustomButton(
                    text: "CONTINUE",
                    onPressed: () {
                      horoscopeDetailsController.horoscopeDetails(
                          context,
                          time.text.toString().trim(),
                          selectedCountry ?? "",
                          selectedState ?? "",
                          selectedCity ?? "",
                          false);

                      //    Get.toNamed('/profile')
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                        fontSize: 20, color: AppColors.constColor)),
              ),
              _buildSkipButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'SKIP',
        onPressed: () {
          // Get.offAndToNamed('/profile')
          // flowController.Flow(context, 10)

          skipController.skip(context, "step_10", 10);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
