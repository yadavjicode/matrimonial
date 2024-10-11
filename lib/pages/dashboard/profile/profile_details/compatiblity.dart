//Start Compatibilty deatils ==================================================================================================================
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/constants/widget/profile_image.dart';
import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/comman_class_method.dart';

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
        ProfileImage(
          size: screenWidth * 0.2,
          url: imagePath,
        ),
        const SizedBox(
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding:
          const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 10),
      child: Obx(() {
        String otherImage = CommanClass.photo(
            profileDetailsController.member?.data?.photo1,
            profileDetailsController.member?.data?.gender);
        String myImage = CommanClass.photo(
            user.member?.member?.Photo1, user.member?.member?.gender);

        return profileDetailsController.isLoading.value == false
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What ${profileDetailsController.member?.data?.gender == "Male" ? "He" : "She"} is Looking For :',
                    style: FontConstant.styleMedium(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      buildAvatarColumn(otherImage,
                          '${profileDetailsController.member?.data?.gender == "Male" ? "His" : "Her"} \nPreferences'),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 45.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xff583789),
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 45.0),
                          child: Text(
                            'You match ${profileDetailsController.member?.matchData?.matchCount}/7 of her preferences',
                            textAlign: TextAlign.center,
                            style: FontConstant.styleMedium(
                                fontSize: 14, color: const Color(0xff583789)),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 45),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff583789),
                        ),
                      ),
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
                            // profileDetailsController.member?.data?.pEFromAge == null ||
                            //         profileDetailsController.member?.data?.pEToAge ==
                            //             null
                            //     ? ""
                            //     : '${profileDetailsController.member!.data!.pEFromAge} to ${profileDetailsController.member!.data!.pEToAge}',
                            "",
                            false,
                            profileDetailsController.member?.matchData?.age ??
                                false),
                        InfoRow(
                            'Height',
                            // profileDetailsController.member?.data?.pEHeight == null ||
                            //         profileDetailsController.member?.data?.pEHeight2 ==
                            //             null
                            //     ? ""
                            //     : '${profileDetailsController.member!.data!.pEHeight} to ${profileDetailsController.member!.data!.pEHeight2}',
                            "",
                            true,
                            profileDetailsController
                                    .member?.matchData?.height ??
                                false),
                        InfoRow(
                            'Marital Status',
                            // '${profileDetailsController.member!.data!.pEMaritalStatus ?? ""}',
                            "",
                            false,
                            profileDetailsController
                                    .member?.matchData?.maritalStatus ??
                                false),
                        InfoRow(
                            'Religion / Community',
                            // '${profileDetailsController.member!.data!.pEReligion ?? ""}',
                            "",
                            true,
                            profileDetailsController
                                    .member?.matchData?.religion ??
                                false),
                        InfoRow(
                            'Country Living in',
                            // '${profileDetailsController.member?.data?.pECountrylivingin ?? ""}',
                            "",
                            false,
                            profileDetailsController
                                    .member?.matchData?.country ??
                                false),
                        InfoRow(
                            'State Living in',
                            // '${profileDetailsController.member?.data?.pEState ?? ""}',
                            "",
                            true,
                            profileDetailsController.member?.matchData?.state ??
                                false),
                        InfoRow(
                            'Annual Income',
                            // '${profileDetailsController.member?.data?.pEAnnualincome ?? ""}',
                            "",
                            false,
                            profileDetailsController
                                    .member?.matchData?.income ??
                                false),
                        const SizedBox(height: 16),
                      ],
                    ),
                  )
                ],
              )
            : const SizedBox.shrink();
      }),
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
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: backColor == true ? AppColors.constColor : Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FontConstant.styleMedium(
                        fontSize: 15, color: Colors.black),
                  ),
                  // Text(
                  //   value,
                  //   style: FontConstant.styleMedium(
                  //       fontSize: 12, color: Colors.grey.shade600),
                  // ),
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
