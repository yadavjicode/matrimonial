import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
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
          "Profile",
          style: FontConstant.styleSemiBold(
            fontSize: 18,
            color: AppColors.constColor,
          ),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            if (_editProfileController.isLoading.value == false)
              _buildProfileContent(),
            if (_editProfileController.isLoading.value)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildProfileContent() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.topRight,
          child: Image.asset("assets/images/background.png"),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 305,
                width: double.infinity,
                color: AppColors.constColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/noimage.png",
                      width: 179,
                      height: 172,
                    ),
                    Text(
                      "+ Add Image",
                      style: FontConstant.styleRegular(
                        fontSize: 23,
                        color: Color(0xff583689),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/phone.png"),
                          Text(
                            "Edit Mobile No.",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/message.png"),
                          SizedBox(width: 10),
                          Text(
                            "Edit Email ID",
                            style: FontConstant.styleRegular(
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Text(
                  "Your profile is ${_editProfileController.member!.profilePercentage??""}% Complete",
                  style: FontConstant.styleRegular(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 10, bottom: 10),
                height: 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: LinearProgressIndicator(
                     value: (_editProfileController.member!.profilePercentage) / 100,
                    backgroundColor: Colors.grey.shade100,
                    color: Color(0xff583689),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Make your profile 100% complete by adding below\ndetails and get more responses.",
                  style: FontConstant.styleRegular(
                    fontSize: 13,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 15,
                  right: 15,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    _buildCont(
                      "Basic Details",
                      "/editBasicDetails",
                      Column(
                        children: [
                          _buildText("Posted by",
                              _editProfileController.member!.member!.profileFor?? ""),
                          _buildText("Title",
                              _editProfileController.member!.member!.nameTitle?? ""),
                          _buildText("Name",
                              _editProfileController.member!.member!.name?? ""),
                          _buildText("Surname",
                              _editProfileController.member!.member!.surename?? ""),
                          _buildText("Spiritual Name",
                              _editProfileController.member!.member!.spiritualName?? ""),
                          _buildText("Marital Status",
                              _editProfileController.member!.member!.maritalstatus?? ""),
                          _buildText("Height",
                              _editProfileController.member!.member!.height?? ""),
                          _buildText("Weight",
                              "${_editProfileController.member!.member!.weight} KG"?? ""),
                              _buildText("Date of Birth",
                              _editProfileController.member!.member!.dOB?? ""),
                          _buildText("Hobbies",
                              _editProfileController.member!.member!.hobbies?? ""),
                          
                        ],
                      ),
                    ),
                    _buildCont(
                      "Contact Details",
                      "/editContactDetails",
                      Column(
                        children: [
                          _buildText("Phone Number",
                              _editProfileController.member!.member!.mobile?? ""),
                          _buildText("Email Address",
                              _editProfileController.member!.member!.confirmEmail?? ""),
                          _buildText("Instagram ID",
                              _editProfileController.member!.member!.instagramId?? ""),
                          
                          
                        ],
                      ),
                    ),
                    _buildCont(
                      "Location Details",
                       "/editLocationDetails",
                      Column(
                        children: [
                          _buildText(
                              "Nationality",
                              _editProfileController.member!.member!.country?? ""
                                  ),
                          _buildText(
                              "Residence Type",
                              _editProfileController.member!.member!.state?? ""
                                  ),
                          _buildText(
                              "Permanent House Type",
                              _editProfileController.member!.member!.permanentHouseType?? ""
                                  ),
                          _buildText(
                              "Permanent State",
                              _editProfileController.member!.member!.permanentState?? ""
                                  ),
                          _buildText(
                              "Permanent City",
                              _editProfileController.member!.member!.permanentCity?? ""
                                  ),
                          _buildText(
                              "Permanent Pin Code",
                              _editProfileController.member!.member!.permanentPincode?? ""
                                  ),
                          _buildText(
                              "Temporary State",
                              _editProfileController.member!.member!.tempState?? ""
                                  ),
                          _buildText(
                              "Temporary City",
                              _editProfileController.member!.member!.tempCity?? ""
                                  ),
                          _buildText(
                              "Temporary Pin Code",
                              _editProfileController.member!.member!.tempPincode?? ""
                                  ),
                          _buildText(
                              "References 1 Relation",
                              _editProfileController.member!.member!.reference1Reletion?? ""
                                  ),
                          _buildText(
                              "References 1 Name",
                              _editProfileController.member!.member!.reference1Name?? ""
                                  ),
                          _buildText(
                              "References 1 Email",
                              _editProfileController.member!.member!.reference1Email?? ""
                                  ),
                          _buildText(
                              "References 1 Mobile",
                              _editProfileController.member!.member!.reference1Mobile?? ""
                                  ),
                          _buildText(
                              "References 2 Relation",
                              _editProfileController.member!.member!.reference2Reletion?? ""
                                  ),
                          _buildText(
                              "References 2 Name",
                              _editProfileController.member!.member!.reference2Name?? ""
                                  ),
                          _buildText(
                              "References 2 Email",
                              _editProfileController.member!.member!.reference2Email?? ""
                                  ),
                          _buildText(
                              "References 2 Mobile",
                              _editProfileController.member!.member!.reference2Mobile?? ""
                                  ),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Educational Details",
                       "/editEducationDetails",
                      Column(
                        children: [
                          _buildText(
                              "Highest Qualification",
                              _editProfileController.member!.member!.education?? ""
                                  ),
                          _buildText(
                              "Professional Qualification",
                                _editProfileController.member!.member!.professionalQualification?? ""
                                  ),
                          _buildText("Other Details",   _editProfileController.member!.member!.otherQualification?? ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Profession Details",
                       "/prof",
                      Column(
                        children: [
                          _buildText(
                              "Profession Tittle",
                              _editProfileController.professionTittle
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Employment",
                              _editProfileController.empolyment.toString() ??
                                  ""),
                          _buildText(
                              "Working State",
                              _editProfileController.workingState.toString() ??
                                  ""),
                          _buildText(
                              "Working City",
                              _editProfileController.workingCity.toString() ??
                                  ""),
                          _buildText(
                              "Pincode",
                              _editProfileController.workingpincode
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Annual Salary Range",
                              _editProfileController.annualSalary.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Devotional Details",
                       "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "About Devotional Life",
                              _editProfileController.aboutDevotional
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Iskcon Knowledge",
                              _editProfileController.iskonKnow.toString() ??
                                  ""),
                          _buildText(
                              "In Which Temple You Are Connected To",
                              _editProfileController.whichTemple.toString() ??
                                  ""),
                          _buildText(
                              "Devotional Habits",
                              _editProfileController.devotionalHabit
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Spiritual Counsellor Details",
                       "/editBasicDetails",
                      Column(
                        children: [
                          _buildText(
                              "Connected with Since",
                              _editProfileController.connectedWithSince
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Connected Temple",
                              _editProfileController.connectTemple.toString() ??
                                  ""),
                          _buildText(
                              "Counselor State",
                              _editProfileController.counselorState
                                      .toString() ??
                                  ""),
                          _buildText(
                              "Counselor City",
                              _editProfileController.counselorCity.toString() ??
                                  ""),
                          _buildText(
                              "About Counselor:",
                              _editProfileController.aboutCounselor
                                      .toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Family & More Details",
                       "/editBasicDetails",
                      Column(
                        children: [
                          _buildText("Religion",
                              _editProfileController.religion.toString() ?? ""),
                          _buildText("Caste",
                              _editProfileController.caste.toString() ?? ""),
                          _buildText("Subcaste",
                              _editProfileController.subcaste.toString() ?? ""),
                          _buildText("Gotra",
                              _editProfileController.gotra.toString() ?? ""),
                          _buildText(
                              "Language Known",
                              _editProfileController.languageKnown.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                    _buildCont(
                      "Horoscope Details",
                       "/editBasicDetails",
                      Column(
                        children: [
                          _buildText("Date of Birth",
                              _editProfileController.dob.toString() ?? ""),
                          _buildText(
                              "Time of Birth",
                              _editProfileController.timeBirth.toString() ??
                                  ""),
                          _buildText(
                              "State of Birth",
                              _editProfileController.birthState.toString() ??
                                  ""),
                          _buildText(
                              "City of Birth",
                              _editProfileController.birthCity.toString() ??
                                  ""),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildText(String tittle, String value) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                tittle,
                style: FontConstant.styleMedium(
                  fontSize: 13,
                  color: AppColors.darkgrey,
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(": "),
            Expanded(
              child: Text(
                value,
                style: FontConstant.styleMedium(
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCont(String tittle,String move, Column column) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Row(
            children: [
              Text(
                tittle,
                style: FontConstant.styleRegular(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                //  final data = {'goto': 'edit'};
                  // Get.toNamed('/prof', arguments: data);
                  Get.toNamed(move);
                },
                child: SvgPicture.asset("assets/images/icons/penicon.svg"),
              ),
            ],
          ),
        ),
        Container(
          color: AppColors.constColor,
          padding: EdgeInsets.only(
            left: 15,
            right: 25,
            bottom: 15,
            top: 15,
          ),
          child: column,
        ),
      ],
    );
  }
}
