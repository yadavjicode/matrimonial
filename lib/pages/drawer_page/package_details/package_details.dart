import 'package:devotee/constants/button_constant.dart';
import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/buy_package_controller.dart';
import 'package:devotee/controller/package_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({super.key});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  final PackageController packageController = Get.put(PackageController());
  final BuyPackageController buyPackageController =
      Get.put(BuyPackageController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      packageController.package(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Package Details",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.topRight,
              child: Image.asset("assets/images/bg3.png")),
          Obx(() {
            return Stack(children: [
              if (packageController.isLoading.value == false)
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 81,
                              // color: AppColors.darkblue,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    height: 38,
                                    width: 38,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.constColor),
                                    child: Image.asset(
                                      "assets/images/usergrey.png",
                                    ),
                                  ),
                                  Text(
                                    "Free",
                                    style: FontConstant.styleBold(
                                        fontSize: 14, color: AppColors.black),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              // color: AppColors.darkblue,
                              width: 81,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    height: 38,
                                    width: 38,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.constColor),
                                    child: Image.asset(
                                      "assets/images/Crown.png",
                                    ),
                                  ),
                                  Text(
                                    "Premium",
                                    style: FontConstant.styleBold(
                                        fontSize: 14, color: AppColors.black),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _packageSelect(
                            context,
                            "Able to see photos uploaded on others Profile",
                            packageController.member!.data!.free!
                                .ableToSeePhotosOnOthersProfile!
                                .toInt(),
                            packageController.member!.data!.premium!
                                .ableToSeePhotosOnOthersProfile!
                                .toInt()),
                        _packageSelect(
                            context,
                            "Use Filter/ Sorting Feature",
                            packageController
                                .member!.data!.free!.useFilterSortingFeature!
                                .toInt(),
                            packageController
                                .member!.data!.premium!.useFilterSortingFeature!
                                .toInt()),
                        _packageSelect(
                            context,
                            "View Full Profile of Others",
                            packageController
                                .member!.data!.free!.viewFullProfileOfOthers!
                                .toInt(),
                            packageController
                                .member!.data!.premium!.viewFullProfileOfOthers!
                                .toInt()),
                        _packageSelect(
                            context,
                            "Using Search Feature",
                            packageController
                                .member!.data!.free!.usingSearchFeature!
                                .toInt(),
                            packageController
                                .member!.data!.premium!.usingSearchFeature!
                                .toInt()),
                        _packageSelect(
                            context,
                            "Chat",
                            packageController.member!.data!.free!.chat!.toInt(),
                            packageController.member!.data!.premium!.chat!
                                .toInt()),
                        _packageSelect(
                            context,
                            "See Contact No.s",
                            packageController
                                .member!.data!.free!.seeContactNumbers!
                                .toInt(),
                            packageController
                                .member!.data!.premium!.seeContactNumbers!
                                .toInt()),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Send Interest to users",
                              style: FontConstant.styleRegular(
                                  fontSize: 12, color: AppColors.black),
                            )),
                            Container(
                                width: 81,
                                // height: 81,
                                alignment: Alignment.center,
                                child: Text(
                                  "${packageController.member!.data!.free!.sendInterest!.toInt()} Per Day",
                                  style: FontConstant.styleBold(
                                      fontSize: 12, color: AppColors.green),
                                )),
                            Container(
                                width: 81,
                                height: 81,
                                color: AppColors.constColor,
                                alignment: Alignment.center,
                                child: Text(
                                  "${packageController.member!.data!.premium!.sendInterest!.toInt()} Per Day",
                                  style: FontConstant.styleBold(
                                      fontSize: 12, color: AppColors.green),
                                ))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 100),
                          child: CustomButton(
                              text: "Buy Premium Pack Now",
                              onPressed: () =>
                                  {buyPackageController.buyPackage(context)},
                              color: AppColors.primaryColor,
                              textStyle: FontConstant.styleRegular(
                                  fontSize: 16, color: AppColors.constColor)),
                        ),
                      ],
                    ),
                  ),
                ),
              if (packageController.isLoading.value)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ]);
          })
        ],
      ),
    );
  }
}

Widget _packageSelect(
    BuildContext context, String tittle, int free, int Premium) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
              child: Text(
            tittle,
            style:
                FontConstant.styleRegular(fontSize: 12, color: AppColors.black),
          )),
          Container(
              width: 81,
              height: 81,
              alignment: Alignment.center,
              child: free == 1
                  ? Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      child:
                          SvgPicture.asset("assets/images/icons/correct.svg"))
                  : Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.red),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.constColor,
                      ),
                    )),
          Container(
              width: 81,
              height: 81,
              color: AppColors.constColor,
              alignment: Alignment.center,
              child: Premium == 1
                  ? Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.green,
                      ),
                      child:
                          SvgPicture.asset("assets/images/icons/correct.svg"))
                  : Container(
                      height: 19,
                      width: 19,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.red),
                      child: const Icon(
                        Icons.close,
                        size: 17,
                        color: AppColors.constColor,
                      ),
                    ))
        ],
      ),
      Container(
        height: 1,
        color: AppColors.grey,
      )
    ],
  );
}
