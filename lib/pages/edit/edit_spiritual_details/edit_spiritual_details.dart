import 'package:devotee/constants/CustomTextFeild.dart';
import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/custom_dropdown.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/lists/location_list.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/flow_controller.dart';
import 'package:devotee/controller/spiritual_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSpiritualDetails extends StatefulWidget {
  const EditSpiritualDetails({super.key});
  @override
  State<EditSpiritualDetails> createState() => _EditSpiritualDetailsState();
}

class _EditSpiritualDetailsState extends State<EditSpiritualDetails> {
  SpiritualDetailsController spiritualController =
      Get.put(SpiritualDetailsController());
  final TextEditingController nameCounselor = TextEditingController();
  final TextEditingController connectCounselor = TextEditingController();
  final TextEditingController templeCounselor = TextEditingController();
  final TextEditingController somethingCounselor = TextEditingController();
  final StateController stateController = Get.put(StateController());
  final CityController cityController = Get.put(CityController());
  final FlowController flowController = Get.put(FlowController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedState;
  String? selectedCity;
  int? counsellor;
  bool show = false;

  String? getCounsellor() {
    if (counsellor == 1) {
      return "Yes";
    } else if (counsellor == 2) {
      return "No";
    } else {
      return null;
    }
  }

  bool validation() {
    if (getCounsellor() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context).then((value) {
        setState(() {
          if (_editProfileController
                  .member?.member?.spiritualCounselerConnected ==
              "Yes") {
            counsellor = 1;
          } else if (_editProfileController
                  .member?.member?.spiritualCounselerConnected ==
              "No") {
            counsellor = 2;
          }
          nameCounselor.text = _editProfileController
                  .member?.member?.nameOfTheCounselorOfMySpiritualPath ??
              "";
          connectCounselor.text = _editProfileController
                  .member?.member?.connectedWithMyCounselerSince ??
              "";
          templeCounselor.text = _editProfileController
                  .member?.member?.withWhichTempleYourCounselorIsConnectedTo ??
              "";
          somethingCounselor.text = _editProfileController
                  .member?.member?.somethingAboutMoreCounselor ??
              "";
          selectedState =
              _editProfileController.member?.member?.counselorResidingInState;
          selectedCity =
              _editProfileController.member?.member?.counselorResidingInCity;
          stateController.selectItem(
              _editProfileController.member?.member?.counselorResidingInState);
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
            "Spiritual Counsellor Details",
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
                spiritualContent()
              ],
            ),
            if (spiritualController.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
          ]);
        }));
  }

  Widget spiritualContent() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 35, left: 22, right: 22, bottom: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/spiritual.png",
                    height: 92,
                    width: 92,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text(
                "I am connected with any Spirtual Counsellor *",
                style: FontConstant.styleRegular(
                    fontSize: 16, color: AppColors.black),
              ),
              Row(
                children: [
                  Radio(
                    activeColor: AppColors.primaryColor,
                    value: 1,
                    groupValue: counsellor,
                    onChanged: (value) => {
                      setState(() {
                        counsellor = value!;
                      })
                    },
                  ),
                  Text(
                    "Yes",
                    style: FontConstant.styleRegular(
                        fontSize: 16, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(
                    activeColor: AppColors.primaryColor,
                    value: 2,
                    groupValue: counsellor,
                    onChanged: (value) => {
                      setState(() {
                        counsellor = value!;
                      })
                    },
                  ),
                  Text(
                    "No",
                    style: FontConstant.styleRegular(
                        fontSize: 16, color: AppColors.black),
                  )
                ],
              ),
              if (show == true && getCounsellor() == null)
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "are you connected with any Spiritual Counsellor",
                      style: FontConstant.styleRegular(
                          fontSize: 11, color: AppColors.red),
                    )),
              if (counsellor == 1)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        labelText:
                            "Name of the Counsellor for my Spiritual Path *",
                        controller: nameCounselor,
                        hintText:
                            "Enter Name of the Counsellor for my Spiritual Path",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        labelText:
                            "Connected with my Counsellor Since (Year) *",
                        controller: connectCounselor,
                        keyboardType: TextInputType.number,
                        maxlength: 4,
                        hintText: "Enter Connected with my Counsellor Since",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        labelText:
                            "With which temple your Counsellor is connected to? *",
                        controller: templeCounselor,
                        hintText:
                            "Enter With which temple your Counsellor is connected to",
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      if (stateController.isLoading.value) {
                        return buildDropdownWithSearch(
                          'Counsellor residing in State *',
                          ['Loading...'],
                          (value) {
                            setState(() {
                              selectedState = null;
                            });
                          },
                          selectedItem: 'Loading...',
                          hintText: 'Select State',
                        );
                      } else {
                        return buildDropdownWithSearch(
                          'Counsellor residing in State *',
                          [
                            'Prefer Not To Say',
                            ...stateController.getStateList()
                          ],
                          //  stateControllerPermanent.selectedItem,
                          (value) {
                            setState(() {
                              selectedState = value;
                              selectedCity = null; // Update the state
                            });
                            stateController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select State',

                          selectedItem: selectedState,
                        );
                      }
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      if (cityController.isLoading.value) {
                        return buildDropdownWithSearch(
                          'Counsellor residing in City *',
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
                          'Counsellor residing in City *',
                          ['Prefer Not To Say', ...cityController.cityLists],
                          // cityControllerPermanent.selectedItem,
                          (value) {
                            setState(() {
                              selectedCity = value; // Update the state
                            });
                            cityController.selectItem(
                                value); // Call the controller method
                          },
                          hintText: 'Select City',

                          selectedItem: selectedCity,
                        );
                      }
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CustomTextField(
                        labelText: "Something more about the Counsellor *",
                        maxline: 5,
                        hintText: "Enter Something more about the Counsellor",
                        controller: somethingCounselor,
                      ),
                    ),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: CustomButton(
                    text: "CONTINUE",
                    onPressed: () {
                      setState(() {
                        show = true;
                      });
                      if (validation()) {
                        spiritualController.spiritualDetails(
                            context,
                            getCounsellor() ?? "",
                            getCounsellor() == "Yes"
                                ? nameCounselor.text.toString().trim()
                                : "",
                            getCounsellor() == "Yes"
                                ? connectCounselor.text.toString().trim()
                                : "",
                            getCounsellor() == "Yes"
                                ? templeCounselor.text.toString().trim()
                                : "",
                            getCounsellor() == "Yes" ? selectedState ?? "" : "",
                            getCounsellor() == "Yes" ? selectedCity ?? "" : "",
                            getCounsellor() == "Yes"
                                ? somethingCounselor.text.toString().trim()
                                : "",
                            true);
                      }
                      //   Get.toNamed('/family')
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
