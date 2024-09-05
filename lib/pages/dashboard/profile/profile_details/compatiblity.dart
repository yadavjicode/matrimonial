//Start Compatibilty deatils ==================================================================================================================

import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Compatiblity extends StatefulWidget {
  const Compatiblity({super.key});

  @override
  State<Compatiblity> createState() => _CompatiblityState();
}

class _CompatiblityState extends State<Compatiblity> {
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  final EditProfileController user = Get.put(EditProfileController());

  Widget buildAvatarColumn(String imagePath, String label) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: screenWidth * 0.2,
          height: screenWidth * 0.2,
          child: ClipOval(
            child: Image.network(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: FontConstant.styleMedium(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }

  bool compare(dynamic a, dynamic b) {
    if (a == null || b == null) {
      return false;
    }
    if (a == b) {
      return true;
    } else {
      return false;
    }
  }

  int compareInt(dynamic a, dynamic b) {
    if (a == null || b == null) {
      return 0;
    }
    if (a == b) {
      return 1;
    } else {
      return 0;
    }
  }

  int count() {
    int age = profileDetailsController.member!.data!.pEFromAge != null &&
            profileDetailsController.member!.data!.pEToAge != null &&
            user.member!.member!.pEFromAge != null &&
            user.member!.member!.pEToAge != null
        ? compareInt(
            compare(profileDetailsController.member!.data!.pEFromAge,
                user.member!.member!.pEFromAge),
            compare(profileDetailsController.member!.data!.pEToAge,
                user.member!.member!.pEToAge))
        : 0;
    int height = profileDetailsController.member!.data!.pEHeight != null &&
            profileDetailsController.member!.data!.pEHeight2 != null &&
            user.member!.member!.pEHeight != null &&
            user.member!.member!.pEHeight2 != null
        ? compareInt(
            compare(profileDetailsController.member!.data!.pEHeight,
                user.member!.member!.pEHeight),
            compare(profileDetailsController.member!.data!.pEHeight2,
                user.member!.member!.pEHeight2))
        : 0;
    int marital =
        profileDetailsController.member!.data!.pEMaritalStatus != null &&
                user.member!.member!.pEMaritalStatus != null
            ? compareInt(profileDetailsController.member!.data!.pEMaritalStatus,
                user.member!.member!.pEMaritalStatus)
            : 0;
    int religion = profileDetailsController.member!.data!.pEReligion != null &&
            user.member!.member!.pEReligion != null
        ? compareInt(profileDetailsController.member!.data!.pEReligion,
            user.member!.member!.pEReligion)
        : 0;
    int country =
        profileDetailsController.member!.data!.pECountrylivingin != null &&
                user.member!.member!.pECountrylivingin != null
            ? compareInt(
                profileDetailsController.member!.data!.pECountrylivingin,
                user.member!.member!.pECountrylivingin)
            : 0;
    int state = profileDetailsController.member!.data!.pEState != null &&
            user.member!.member!.pEState != null
        ? compareInt(profileDetailsController.member!.data!.pEState,
            user.member!.member!.pEState)
        : 0;
    int income =
        profileDetailsController.member!.data!.pEAnnualincome != null &&
                user.member!.member!.pEAnnualincome != null
            ? compareInt(profileDetailsController.member!.data!.pEAnnualincome,
                user.member!.member!.pEAnnualincome)
            : 0;
    return (age + height + marital + religion + country + state + income);
  }

  @override
  Widget build(BuildContext context) {
    String otherImage = profileDetailsController.member?.data?.photo1 != null
        ? "http://devoteematrimony.aks.5g.in/${profileDetailsController.member?.data?.photo1}"
        : profileDetailsController.member?.data?.gender == "Male"
            ? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png"
            : "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";
    String myImage = user.member!.member!.Photo1 != null
        ? "http://devoteematrimony.aks.5g.in/${user.member!.member!.Photo1}"
        : user.member!.member!.gender == "Male"
            ? "https://devoteematrimony.aks.5g.in/public/images/nophoto.png"
            : "https://devoteematrimony.aks.5g.in/public/images/nophotof.jpg";
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What ${profileDetailsController.member!.data!.gender == "Male" ? "He" : "She"} is Looking For :',
            style: FontConstant.styleMedium(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              buildAvatarColumn(otherImage,
                  '${profileDetailsController.member!.data!.gender == "Male" ? "His" : "Her"} \nPreferences'),
              const Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff583789),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Text(
                  'You match ${count()}/7 of \nher preferences',
                  textAlign: TextAlign.center,
                  style: FontConstant.styleMedium(
                      fontSize: 14, color: const Color(0xff583789)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 45),
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0xff583789),
                ),
              ),
              const Spacer(),
              buildAvatarColumn(myImage, 'Your \nMatch'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InfoRow(
                    'Age',
                    '${profileDetailsController.member!.data!.pEFromAge ?? "_ _"} to ${profileDetailsController.member!.data!.pEToAge ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEFromAge != null &&
                            profileDetailsController.member!.data!.pEToAge !=
                                null &&
                            user.member!.member!.pEFromAge != null &&
                            user.member!.member!.pEToAge != null
                        ? compare(
                            compare(
                                profileDetailsController
                                    .member!.data!.pEFromAge,
                                user.member!.member!.pEFromAge),
                            compare(
                                profileDetailsController.member!.data!.pEToAge,
                                user.member!.member!.pEToAge))
                        : false),
                InfoRow(
                    'Height',
                    '${profileDetailsController.member!.data!.pEHeight ?? "_ _"} to ${profileDetailsController.member!.data!.pEHeight2 ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEHeight != null &&
                            profileDetailsController.member!.data!.pEHeight2 !=
                                null &&
                            user.member!.member!.pEHeight != null &&
                            user.member!.member!.pEHeight2 != null
                        ? compare(
                            compare(
                                profileDetailsController.member!.data!.pEHeight,
                                user.member!.member!.pEHeight),
                            compare(
                                profileDetailsController
                                    .member!.data!.pEHeight2,
                                user.member!.member!.pEHeight2))
                        : false),
                InfoRow(
                    'Marital Status',
                    '${profileDetailsController.member!.data!.pEMaritalStatus ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEMaritalStatus !=
                                null &&
                            user.member!.member!.pEMaritalStatus != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pEMaritalStatus,
                            user.member!.member!.pEMaritalStatus)
                        : false),
                InfoRow(
                    'Religion / Community',
                    '${profileDetailsController.member!.data!.pEReligion ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEReligion != null &&
                            user.member!.member!.pEReligion != null
                        ? compare(
                            profileDetailsController.member!.data!.pEReligion,
                            user.member!.member!.pEReligion)
                        : false),
                InfoRow(
                    'Country Living in',
                    '${profileDetailsController.member!.data!.pECountrylivingin ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pECountrylivingin !=
                                null &&
                            user.member!.member!.pECountrylivingin != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pECountrylivingin,
                            user.member!.member!.pECountrylivingin)
                        : false),
                InfoRow(
                    'State Living in',
                    '${profileDetailsController.member!.data!.pEState ?? "_ _"}',
                    true,
                    profileDetailsController.member!.data!.pEState != null &&
                            user.member!.member!.pEState != null
                        ? compare(
                            profileDetailsController.member!.data!.pEState,
                            user.member!.member!.pEState)
                        : false),
                InfoRow(
                    'Annual Income',
                    '${profileDetailsController.member!.data!.pEAnnualincome ?? "_ _"}',
                    false,
                    profileDetailsController.member!.data!.pEAnnualincome !=
                                null &&
                            user.member!.member!.pEAnnualincome != null
                        ? compare(
                            profileDetailsController
                                .member!.data!.pEAnnualincome,
                            user.member!.member!.pEAnnualincome)
                        : false),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String value;
  final bool backColor;
  final bool isValid;

  const InfoRow(this.title, this.value, this.backColor, this.isValid,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: backColor == true ? AppColors.constColor : Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontConstant.styleMedium(
                        fontSize: 15, color: Colors.black),
                  ),
                  Text(
                    value,
                    style: FontConstant.styleMedium(
                        fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(
              isValid ? Icons.check_circle : Icons.cancel,
              color: isValid ? Colors.green : Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

//End Compatibilty deatils ==================================================================================================================
