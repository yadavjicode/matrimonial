import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/profile_details_controller.dart';
import 'package:devotee/pages/dashboard/profile/profile_details/pages_details/pages_deatils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//start Basic deatils ==================================================================================================================

class BasicDetails extends StatelessWidget {
  BasicDetails({super.key});
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          color: AppColors.constColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Profile created by myself',
                    style: FontConstant.styleSemiBold(
                        fontSize: 12, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Text(
                '|',
                style: FontConstant.styleSemiBold(
                    fontSize: 12, color: Colors.black),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: Text(
                  'Last Login: ${profileDetailsController.member!.data!.lastlogin ?? ""}',
                  style: FontConstant.styleSemiBold(
                      fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Details:',
                style: FontConstant.styleSemiBold(
                  fontSize: 18,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              BasicDetailsGrid(),
            ],
          ),
        )
      ],
    );
  }
}


class BasicDetailsGrid extends StatelessWidget {
  BasicDetailsGrid({super.key});
  final ProfileDetailsController profileDetailsController =
      Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        DetailRow(
          path: "assets/images/icons/region.svg",
          title: 'Gender',
          value: profileDetailsController.member?.data?.gender ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/dob.svg",
          title: 'Birth Date',
          value: profileDetailsController.member?.data?.dOB ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/region.svg",
          title: 'Religion',
          value: profileDetailsController.member?.data?.religion ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/marital.svg",
          title: 'Marital Status',
          value: profileDetailsController.member?.data?.maritalstatus ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/study.svg",
          title: 'Study',
          value: profileDetailsController.member?.data?.education ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/langu.svg",
          title: 'Language',
          value: profileDetailsController.member?.data?.language ?? "",
        ),
        DetailRow(
          path: "assets/images/icons/location.svg",
          title: 'Lived In',
          value:
              "${profileDetailsController.member?.data?.permanentCity ?? ""}${profileDetailsController.member?.data?.permanentCity == null || profileDetailsController.member?.data?.permanentState == null ? "" : ", "}${profileDetailsController.member?.data?.permanentState ?? ""} " ??
                  "",
        ),
        DetailRow(
          path: "assets/images/icons/occupation.svg",
          title: 'Occupation',
          value: profileDetailsController.member?.data?.occupation ?? "",
        ),
      ],
    );
  }
}

//End Basic deatils ==================================================================================================================
