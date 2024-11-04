import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/permanent_type.dart';
import 'package:devotee/constants/lists/relation_list.dart';
import 'package:devotee/constants/lists/residence_type_list.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/controller/location_details_controller.dart';
import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/edit_profile_controller.dart';
import '../../../controller/skip_controller.dart';
import '/constants/CustomTextFeild.dart';
import '/constants/button_constant.dart';
import '/constants/color_constant.dart';
import '/constants/font_constant.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  final LocationDetailsController _locationDetailsController =
      Get.put(LocationDetailsController());
  final CountryController countryController = Get.put(CountryController());
  final StateControllerTemporary stateControllerTemporary =
      Get.put(StateControllerTemporary());
  final StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  final CityControllerTemporary cityControllerTemporary =
      Get.put(CityControllerTemporary());
  final CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  final ResidenceTypeController residenceTypeController =
      Get.put(ResidenceTypeController());
  final PermanentTypeController permanentHouseTypeController =
      Get.put(PermanentTypeController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  final FlowController flowController = Get.put(FlowController());
  final SkipController skipController = Get.put(SkipController());
  RelationController relationController = Get.put(RelationController());
  final TextEditingController permanentPinCode = TextEditingController();
  final TextEditingController temporaryPinCode = TextEditingController();
  final TextEditingController refeAName = TextEditingController();
  final TextEditingController refeAEmail = TextEditingController();
  final TextEditingController refeAPhoneno = TextEditingController();
  final TextEditingController refeBName = TextEditingController();
  final TextEditingController refeBEmail = TextEditingController();
  final TextEditingController refeBPhoneno = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedPermanentState;
  String? selectedTemporaryState;
  String? selectedPermanentCity;
  String? selectedTemporaryCity;
  String? selectedResidence;
  String? selectedPermanentHouse;
  String? selectedRefeARelation;
  String? selectedRefeBRelation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((_) {
        setState(() {
          selectedCountry = _editProfileController.member?.member?.country;
          selectedResidence =
              _editProfileController.member?.member?.addressType;
          selectedPermanentHouse =
              _editProfileController.member?.member?.permanentHouseType;
          selectedPermanentState =
              _editProfileController.member?.member?.permanentState;
          selectedPermanentCity =
              _editProfileController.member?.member?.permanentCity;
          selectedTemporaryState =
              _editProfileController.member?.member?.tempState;
          selectedTemporaryCity =
              _editProfileController.member?.member?.tempCity;
          selectedRefeARelation =
              _editProfileController.member?.member?.reference1Reletion;
          selectedRefeBRelation =
              _editProfileController.member?.member?.reference2Reletion;
          permanentPinCode.text =
              _editProfileController.member?.member?.permanentPincode ?? "";
          temporaryPinCode.text =
              _editProfileController.member?.member?.tempPincode ?? "";
          refeAName.text =
              _editProfileController.member?.member?.reference1Name ?? "";
          refeAEmail.text =
              _editProfileController.member?.member?.reference1Email ?? "";
          refeAPhoneno.text =
              _editProfileController.member?.member?.reference1Mobile ?? "";
          refeBName.text =
              _editProfileController.member?.member?.reference2Name ?? "";
          refeBEmail.text =
              _editProfileController.member?.member?.reference2Email ?? "";
          refeBPhoneno.text =
              _editProfileController.member?.member?.reference2Mobile ?? "";
          countryController
              .selectItem(_editProfileController.member?.member?.country ?? "");
          stateControllerPermanent.selectItem(
              _editProfileController.member?.member?.permanentState ?? "");
          stateControllerTemporary.selectItem(
              _editProfileController.member?.member?.tempState ?? "");
        });
      });
    });
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
            "Location details",
            style: FontConstant.styleSemiBold(
                fontSize: 18, color: AppColors.constColor),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAndToNamed('/contact');
            },
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            loactionContent(),
            if (_locationDetailsController.isLoading.value ||
                _editProfileController.isLoading.value ||
                flowController.isLoading.value ||
                skipController.isLoading.value)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CustomButton(
        text: 'SKIP',
        onPressed: () {
          //flowController.Flow(context, 4)
          skipController.skip(context, "step_4", 4);
        },
        color: Colors.transparent,
        textStyle: FontConstant.styleRegular(fontSize: 20, color: Colors.black),
      ),
    );
  }

  Widget loactionContent() {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/bg3.png")),
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 22, right: 22, bottom: 20, top: 35),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/location.png",
                      height: 92,
                      width: 92,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Obx(() {
                    if (countryController.isLoading.value) {
                      return buildDropdownWithSearch(
                        'Nationality *',
                        ['Loading...'],
                        (value) {
                          setState(() {
                            selectedCountry = null;
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select Nationality',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'Nationality *',
                        [
                          'Prefer Not To Say',
                          ...countryController.getCountryList()
                        ],
                        (String? value) {
                          setState(() {
                            selectedCountry = value;
                            selectedPermanentState = null;
                            selectedPermanentCity = null;
                            selectedTemporaryState = null;
                            selectedTemporaryCity = null;
                            // Update the state
                          });
                          countryController.selectItem(value);
                        },
                        selectedItem: selectedCountry,
                        hintText: 'Select Nationality',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (residenceTypeController.isLoading.value) {
                      return buildDropdownWithSearch(
                        'Residence Type *',
                        ['Loading...'],
                        (value) {
                          setState(() {
                            selectedResidence = null;
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select Residence Type',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'Residence Type *',
                        residenceTypeController.getResidenceList(),
                        (value) {
                          setState(() {
                            selectedResidence = value; // Update the state
                          });
                          residenceTypeController
                              .selectItem(value); // Call the controller method
                        },
                        search: false,
                        selectedItem: selectedResidence,
                        hintText: 'Select Residence Type',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (residenceTypeController.isLoading.value) {
                      return buildDropdownWithSearch(
                        'Permanent House Type',
                        ['Loading...'],
                        (value) {
                          setState(() {
                            selectedPermanentHouse = null;
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select Permanent House Type',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'Permanent House Type',
                        permanentHouseTypeController.getPermanentList(),
                        (value) {
                          setState(() {
                            selectedPermanentHouse = value; // Update the state
                          });
                          permanentHouseTypeController
                              .selectItem(value); // Call the controller method
                        },
                        search: false,
                        selectedItem: selectedPermanentHouse,
                        hintText: 'Select Permanent House Type',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Permanent Address Location',
                    style: FontConstant.styleMedium(
                        fontSize: 18, color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (stateControllerPermanent.isLoading.value) {
                      return buildDropdownWithSearch(
                        'State *',
                        ['Loading...'], // Dummy dropdown options during loading
                        (value) {
                          // Prevent selection of dummy value while loading
                          setState(() {
                            selectedPermanentState =
                                null; // Prevent updates while loading
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select State',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'State *',
                        [
                          'Prefer Not To Say',
                          ...stateControllerPermanent.stateLists
                        ],
                        //  stateControllerPermanent.selectedItem,
                        (value) {
                          setState(() {
                            selectedPermanentState = value; // Update the state
                            selectedPermanentCity = null;
                          });
                          stateControllerPermanent
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedPermanentState,

                        hintText: 'Select State',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (cityControllerPermanent.isLoading.value) {
                      return buildDropdownWithSearch(
                        'City *',
                        ['Loading...'], // Dummy dropdown options during loading
                        (value) {
                          // Prevent selection of dummy value while loading
                          setState(() {
                            selectedPermanentCity =
                                null; // Prevent updates while loading
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select City',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'City *',
                        [
                          'Prefer Not To Say',
                          ...cityControllerPermanent.cityLists
                        ],
                        // cityControllerPermanent.selectedItem,
                        (value) {
                          setState(() {
                            selectedPermanentCity = value; // Update the state
                          });
                          cityControllerPermanent
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedPermanentCity,

                        hintText: 'Select City',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: permanentPinCode,
                    labelText: 'Pin Code/ ZIP Code *',
                    maxlength: 6,
                    keyboardType: TextInputType.number,
                    hintText: "Enter Pin Code/ ZIP Code",
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Temporary Address Location',
                    style: FontConstant.styleMedium(
                        fontSize: 18, color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (stateControllerTemporary.isLoading.value) {
                      return buildDropdownWithSearch(
                        'State',
                        ['Loading...'], // Dummy dropdown options during loading
                        (value) {
                          // Prevent selection of dummy value while loading
                          setState(() {
                            selectedTemporaryState =
                                null; // Prevent updates while loading
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select State',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'State',
                        [
                          'Prefer Not To Say',
                          ...stateControllerTemporary.stateLists
                        ],
                        // stateControllerTemporary.selectedItem,
                        (value) {
                          setState(() {
                            selectedTemporaryState = value;
                            selectedTemporaryCity = null; // Update the state
                          });
                          stateControllerTemporary
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedTemporaryState,
                        hintText: 'Select State',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    if (cityControllerTemporary.isLoading.value) {
                      return buildDropdownWithSearch(
                        'City',
                        ['Loading...'], // Dummy dropdown options during loading
                        (value) {
                          // Prevent selection of dummy value while loading
                          setState(() {
                            selectedTemporaryCity =
                                null; // Prevent updates while loading
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select City',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'City',
                        [
                          'Prefer Not To Say',
                          ...cityControllerTemporary.cityLists
                        ],
                        //  cityControllerTemporary.selectedItem,
                        (value) {
                          setState(() {
                            selectedTemporaryCity = value; // Update the state
                          });
                          cityControllerTemporary
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedTemporaryCity,
                        hintText: 'Select City',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: temporaryPinCode,
                    labelText: 'Pin Code/ ZIP Code',
                    hintText: "Enter Pin Code/ ZIP Code",
                    maxlength: 6,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Reference 1',
                    style: FontConstant.styleMedium(
                        fontSize: 18, color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (residenceTypeController.isLoading.value) {
                      return buildDropdownWithSearch(
                        'Relation *',
                        ['Loading...'],
                        (value) {
                          setState(() {
                            selectedRefeARelation = null;
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select Relation',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'Relation *',
                        relationController.getRelationList(),
                        // residenceTypeController.selectItem,
                        (value) {
                          setState(() {
                            selectedRefeARelation = value; // Update the state
                          });
                          relationController
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedRefeARelation,

                        hintText: 'Select Relation',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeAName,
                    labelText: 'Name *',
                    hintText: "Enter Name",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeAEmail,
                    labelText: 'Email',
                    hintText: "Enter Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      return Validation.validateEmailEmpty(value);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeAPhoneno,
                    labelText: 'Mobile *',
                    hintText: "Enter Mobile No",
                    keyboardType: TextInputType.phone,
                    maxlength: 15,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      return Validation.internationPhoneNo(value);
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Reference 2',
                    style: FontConstant.styleMedium(
                        fontSize: 18, color: AppColors.primaryColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    if (residenceTypeController.isLoading.value) {
                      return buildDropdownWithSearch(
                        'Relation *',
                        ['Loading...'],
                        (value) {
                          setState(() {
                            selectedRefeBRelation = null;
                          });
                        },
                        selectedItem: 'Loading...',
                        hintText: 'Select Relation',
                      );
                    } else {
                      return buildDropdownWithSearch(
                        'Relation *',
                        relationController.getRelationList(),
                        // residenceTypeController.selectItem,
                        (value) {
                          setState(() {
                            selectedRefeBRelation = value; // Update the state
                          });
                          relationController
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedRefeBRelation,

                        hintText: 'Select Relation',
                      );
                    }
                  }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeBName,
                    labelText: 'Name *',
                    hintText: "Enter Name",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeBEmail,
                    labelText: 'Email',
                    hintText: "Enter Email",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      return Validation.validateEmailEmpty(value);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    maxline: 1,
                    controller: refeBPhoneno,
                    labelText: 'Mobile *',
                    hintText: "Enter Mobile No",
                    keyboardType: TextInputType.phone,
                    maxlength: 15,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      }
                      return Validation.internationPhoneNo(value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'CONTINUE',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _locationDetailsController.locationDetails(
                            context,
                            selectedCountry ?? "",
                            selectedResidence ?? "",
                            selectedPermanentHouse ?? "",
                            selectedPermanentState ?? "",
                            selectedPermanentCity ?? "",
                            permanentPinCode.text.toString().trim(),
                            selectedTemporaryState ?? "",
                            selectedTemporaryCity ?? "",
                            temporaryPinCode.text.toString().trim(),
                            selectedRefeARelation ?? "",
                            refeAName.text.toLowerCase().trim(),
                            refeAEmail.text.toString().trim(),
                            refeAPhoneno.text.toString().trim(),
                            selectedRefeBRelation ?? "",
                            refeBName.text.toString().trim(),
                            refeBEmail.text.toString().trim(),
                            refeBPhoneno.text.toString().trim(),
                            false);
                      }

                      //  Get.toNamed('/education');
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  _buildSkipButton()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
