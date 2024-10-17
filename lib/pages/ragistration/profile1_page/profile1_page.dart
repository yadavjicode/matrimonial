import 'package:devotee/controller/profile_a_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../constants/profile_constant.dart';
import '../../../constants/widget/Snackbar.dart';
import '../../../controller/edit_profile_controller.dart';

class Profile1Page extends StatefulWidget {
  const Profile1Page({super.key});

  @override
  State<Profile1Page> createState() => _Profile1PageState();
}

class _Profile1PageState extends State<Profile1Page> {
  int _selectedIndex = -1;
  int _selectedIndex1 = -1;
  String selectedProfile = '';
  String selectedGender = '';

  final ProfileAController _profileAControllers = Get.put(ProfileAController());
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileController.userDetails(context);
    });
    _selectedIndex = _profileAControllers
        .profileFor(_editProfileController.member?.member?.profileFor);
    _selectedIndex1 = _profileAControllers
        .gender(_editProfileController.member?.member?.gender);
    selectedProfile = _editProfileController.member?.member?.profileFor ?? "";
    selectedGender = _editProfileController.member?.member?.gender??"";
  }

  Widget buildToggleItem(String text,
      {bool isGender = false, required int index}) {
    return GestureDetector(
      onTap: () => setState(() {
        if (isGender) {
          _selectedIndex1 = index;
          selectedGender = genders[index].gender;
        } else {
          _selectedIndex = index;
          selectedProfile = profiles[index].topic;
          _selectedIndex1 = -1; // Reset gender selection if profile changes
          selectedGender = ''; // Reset gender string if profile changes
        }
      }),
      child: Card(
        color: (isGender ? _selectedIndex1 : _selectedIndex) == index
            ? Colors.white
            : AppColors.background,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: (isGender ? _selectedIndex1 : _selectedIndex) == index
                ? Border.all(color: AppColors.primaryColor, width: 2)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20,
                child: isGender ? genders[index].image : profiles[index].image,
              ),
              const SizedBox(height: 8),
              Text(
                isGender ? genders[index].gender : profiles[index].topic,
                style: FontConstant.styleMedium(
                    fontSize: 14, color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build gender selection grid
  Widget buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: FontConstant.styleMedium(fontSize: 18, color: Colors.black),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 95,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 16 / 9,
            ),
            itemCount: genders.length,
            itemBuilder: (context, index) {
              return buildToggleItem(genders[index].gender,
                  isGender: true, index: index);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Get Start Now",
            style: FontConstant.styleMedium(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Obx(() {
          return Stack(children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.2),
                    child: const Image(
                      image: AssetImage('assets/images/bg3.png'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This Profile is for',
                          style: FontConstant.styleMedium(
                              fontSize: 16, color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 430,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 16 / 9,
                            ),
                            itemCount: profiles.length,
                            itemBuilder: (context, index) {
                              return buildToggleItem(profiles[index].topic,
                                  index: index);
                            },
                          ),
                        ),
                        if (_selectedIndex != -1 &&
                            (profiles[_selectedIndex].topic == 'Myself' ||
                                profiles[_selectedIndex].topic == 'My Friend' ||
                                profiles[_selectedIndex].topic ==
                                    'My Relative' ||
                                profiles[_selectedIndex].topic ==
                                    'My Counselee'))
                          buildGenderSelection(),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 40),
                          child: CustomButton(
                            text: 'CONTINUE',
                            onPressed: () {
                              if (selectedProfile.isNotEmpty) {
                                String selectedData = selectedProfile;
                                if (selectedGender.isNotEmpty) {
                                  selectedData += ', $selectedGender';
                                }

                                if (selectedProfile == "Myself" ||
                                    selectedProfile == "My Relative" ||
                                    selectedProfile == "My Friend" ||
                                    selectedProfile == "My Counselee") {
                                  if (selectedGender.isNotEmpty) {
                                    _profileAControllers.profileA(context,
                                        selectedProfile, selectedGender);
                                  } else {
                                    Dialogs.showSnackbar(
                                        context, 'Select Gender');
                                  }
                                } else if (selectedProfile == "My Son" ||
                                    selectedProfile == "My Brother") {
                                  _profileAControllers.profileA(
                                      context, selectedProfile, "Male");
                                } else if (selectedProfile == "My Daughter" ||
                                    selectedProfile == "My Sister") {
                                  _profileAControllers.profileA(
                                      context, selectedProfile, "Female");
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Please select a profile')),
                                );
                              }
                              //   Get.toNamed('/profile2');
                            },
                            color: AppColors.primaryColor,
                            textStyle: FontConstant.styleRegular(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_profileAControllers.isLoading.value ||
                _editProfileController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ]);
        }));
  }
}
