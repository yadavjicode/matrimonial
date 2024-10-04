import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/constants/lists/permanent_type.dart';
import 'package:devotee/constants/lists/relation_list.dart';
import 'package:devotee/constants/lists/residence_type_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/location_details_controller.dart';
import 'package:devotee/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/constants/CustomTextFeild.dart';
import '/constants/button_constant.dart';
import '/constants/color_constant.dart';
import '/constants/font_constant.dart';

class EditLocationDetails extends StatefulWidget {
  const EditLocationDetails({super.key});

  @override
  State<EditLocationDetails> createState() => _EditLocationDetailsState();
  
}

class _EditLocationDetailsState extends State<EditLocationDetails> {
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final LocationDetailsController _locationDetailsController =
      Get.put(LocationDetailsController());
  CountryController countryController = Get.put(CountryController());
  StateControllerTemporary stateControllerTemporary =
      Get.put(StateControllerTemporary());
  StateControllerPermanent stateControllerPermanent =
      Get.put(StateControllerPermanent());
  CityControllerTemporary cityControllerTemporary =
      Get.put(CityControllerTemporary());
  CityControllerPermanent cityControllerPermanent =
      Get.put(CityControllerPermanent());
  ResidenceTypeController residenceTypeController =
      Get.put(ResidenceTypeController());
  PermanentTypeController permanentHouseTypeController =
      Get.put(PermanentTypeController());
  RelationController relationController = Get.put(RelationController());
  String? selectedCountry;
  String? selectedPermanentState;
  String? selectedTemporaryState;
  String? selectedPermanentCity;
  String? selectedTemporaryCity;
  String? selectedResidence;
  String? selectedPermanentHouse;
  String? selectedRefeARelation;
  String? selectedRefeBRelation;
  final TextEditingController permanentPinCode = TextEditingController();
  final TextEditingController temporaryPinCode = TextEditingController();
  final TextEditingController refeAName = TextEditingController();
  final TextEditingController refeAEmail = TextEditingController();
  final TextEditingController refeAPhoneno = TextEditingController();
  final TextEditingController refeBName = TextEditingController();
  final TextEditingController refeBEmail = TextEditingController();
  final TextEditingController refeBPhoneno = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool show =false;

  bool validation() {
    if (_formKey.currentState!.validate() &&
        selectedCountry != null &&
        selectedResidence != null &&
        selectedPermanentState != null &&
        selectedPermanentCity != null &&
        selectedRefeARelation != null &&
        selectedRefeBRelation != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });

    selectedCountry = _editProfileController.member!.member!.country;

    selectedResidence =
        _editProfileController.member!.member!.addressType;
    selectedPermanentHouse =
        _editProfileController.member!.member!.permanentHouseType;
    selectedPermanentState =
        _editProfileController.member!.member!.permanentState ;
    selectedPermanentCity =
        _editProfileController.member!.member!.permanentCity ;
    selectedTemporaryState =
        _editProfileController.member!.member!.tempState ;
    selectedTemporaryCity =
        _editProfileController.member!.member!.tempCity;
    selectedRefeARelation =
        _editProfileController.member!.member!.reference1Reletion;
    selectedRefeBRelation =
        _editProfileController.member!.member!.reference2Reletion ;
    permanentPinCode.text =
        _editProfileController.member!.member!.permanentPincode ?? "";
    temporaryPinCode.text =
        _editProfileController.member!.member!.tempPincode ?? "";
    refeAName.text =
        _editProfileController.member!.member!.reference1Name ?? "";
    refeAEmail.text =
        _editProfileController.member!.member!.reference1Email ?? "";
    refeAPhoneno.text =
        _editProfileController.member!.member!.reference1Mobile ?? "";
    refeBName.text =
        _editProfileController.member!.member!.reference2Name ?? "";
    refeBEmail.text =
        _editProfileController.member!.member!.reference2Email ?? "";
    refeBPhoneno.text =
        _editProfileController.member!.member!.reference2Mobile ?? "";
    countryController
        .selectItem(_editProfileController.member!.member!.country ?? "");
    stateControllerPermanent.selectItem(
        _editProfileController.member!.member!.permanentState ?? "");
    stateControllerTemporary
        .selectItem(_editProfileController.member!.member!.tempState ?? "");
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
        ),
        body: Obx(() {
          return Stack(children: [
            loactionContent(),
            if (_locationDetailsController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                  child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
          ]);
        }));
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
            padding: const EdgeInsets.only(
                left: 22, right: 22, bottom: 100, top: 35),
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
                        countryController.getCountryList(),
                        (String? value) {
                          setState(() {
                            selectedCountry = value;
                            selectedPermanentState = null;
                            selectedPermanentCity = null;
                            selectedTemporaryState = null;
                            selectedTemporaryCity = null;
                            // Update the state
                          });
                          countryController
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedCountry,
                        borderColor:show==true && selectedCountry == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select Nationality",
                        errorshow:show==true &&  selectedCountry == null ? true : false,
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
                        borderColor:show==true &&  selectedResidence == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select Residence Type",
                        errorshow:show==true &&  selectedResidence == null ? true : false,
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
                        stateControllerPermanent.stateLists,
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
                        borderColor:show==true &&  selectedPermanentState == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select State",
                        errorshow:show==true && 
                            selectedPermanentState == null ? true : false,
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
                        cityControllerPermanent.cityLists,
                        // cityControllerPermanent.selectedItem,
                        (value) {
                          setState(() {
                            selectedPermanentCity = value; // Update the state
                          });
                          cityControllerPermanent
                              .selectItem(value); // Call the controller method
                        },
                        selectedItem: selectedPermanentCity,
                        borderColor:show==true &&  selectedPermanentCity == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select City",
                        errorshow:show==true &&  selectedPermanentCity == null ? true : false,
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
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length > 6) {
                        return 'Please Enter Pin Code/ ZIP Code';
                      }
                      return null;
                    },
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
                        stateControllerTemporary.stateLists,
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
                        cityControllerTemporary.cityLists,
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
                        borderColor:show==true &&  selectedRefeARelation == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select Relation",
                        errorshow:show==true &&  selectedRefeARelation == null ? true : false,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
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
                      if(value!.isEmpty){
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
                    maxlength: 10,
                    validator: (value) {
                      return Validation.validatePhoneno(value);
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
                        borderColor:show==true &&  selectedRefeBRelation == null
                            ? Colors.red
                            : Colors.black.withOpacity(0.5),
                        errorMessage: "Please Select Relation",
                        errorshow:show==true &&  selectedRefeBRelation == null ? true : false,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
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
                      if(value!.isEmpty){
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
                    maxlength: 10,
                    validator: (value) {
                      return Validation.validatePhoneno(value);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: 'CONTINUE',
                    onPressed: () {
                      setState(() {
                        show=true;
                      });
                      if(validation()){
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
                          true);
                      }
                     
                      //  Get.toNamed('/education');
                    },
                    color: AppColors.primaryColor,
                    textStyle: FontConstant.styleRegular(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
