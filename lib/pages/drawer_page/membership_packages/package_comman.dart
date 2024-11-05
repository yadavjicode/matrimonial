import 'package:devotee/controller/edit_profile_controller.dart';
import 'package:devotee/utils/comman_class_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/CustomTextFeild.dart';
import '../../../constants/button_constant.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';
import '../../../constants/widget/Snackbar.dart';
import '../../../controller/apply_coupon_controller.dart';
import '../../../controller/buy_package_controller.dart';
import '../../../controller/package_Controller.dart';
import '../../../model/coupons_model.dart';

class PackageComman {
  final BuyPackageController buyPackageController =
      Get.put(BuyPackageController());
  final PackageController packageController = Get.put(PackageController());
  final ApplyCouponController applyCouponController =
      Get.put(ApplyCouponController());
  final EditProfileController userProfileController =
      Get.put(EditProfileController());

  appThemeBottomSheet(
    BuildContext context,
  ) async {
    applyCouponController.member?.data?.discount = 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    int? amounttype = 1;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController couponController = TextEditingController();
    showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true, // Allows the sheet to resize with the keyboard
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(screenWidth * 0.06)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Adjust padding for keyboard
              ),
              child: SingleChildScrollView(child: Obx(() {
                num amount =
                    packageController.member?.data?.premium?.amount ?? 0;
                num discount =
                    applyCouponController.member?.data?.discount ?? 0;

                num getActualDiscount(String type) {
                  if (type == "Amount") {
                    return discount;
                  } else if (type == "Percentage") {
                    return (amount * discount ~/ 100);
                  } else {
                    return 0;
                  }
                }

                num actualDiscount = getActualDiscount(
                    applyCouponController.member?.data?.discountType ?? "");
                num totalAmount = amount - actualDiscount;
                return Stack(children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.03,
                      horizontal: screenWidth * 0.06,
                    ),
                    child: Wrap(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "MRP Total",
                                        style: FontConstant.styleRegular(
                                            fontSize: 15,
                                            color: AppColors.darkgrey),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "₹ ${amount.toStringAsFixed(2)}",
                                        style: FontConstant.styleMedium(
                                            fontSize: 15,
                                            color: AppColors.black),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Discount Price",
                                        style: FontConstant.styleRegular(
                                            fontSize: 15,
                                            color: AppColors.darkgrey),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "-₹ ${actualDiscount.toStringAsFixed(2)}",
                                        style: FontConstant.styleMedium(
                                            fontSize: 15,
                                            color: AppColors.black),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    height: 1,
                                    color: Colors.grey.shade300),
                                Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Coupon Code:",
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 15, color: AppColors.black),
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomTextField(
                                        controller: couponController,
                                        borderRadius: 5,
                                        hintText: "Enter coupon code",
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty ||
                                              applyCouponController
                                                      .member?.status ==
                                                  "false") {
                                            return 'Enter Valid coupon code';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    CustomDrawerButton(
                                      color: AppColors.primaryColor,
                                      text: "Apply",
                                      onPressed: () {
                                        applyCouponController
                                            .applyCoupon(
                                                context,
                                                couponController.text
                                                    .toString()
                                                    .trim())
                                            .then((_) {
                                          formKey.currentState!.validate();
                                        });
                                      },
                                      textStyle: FontConstant.styleRegular(
                                          fontSize: 14,
                                          color: AppColors.constColor),
                                    )
                                  ],
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 1,
                                    color: Colors.grey.shade300),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Total Amount",
                                        style: FontConstant.styleRegular(
                                            fontSize: 15,
                                            color: AppColors.black),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "₹ ${totalAmount.toStringAsFixed(2)}",
                                        style: FontConstant.styleMedium(
                                            fontSize: 15,
                                            color: AppColors.black),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    height: 1,
                                    color: Colors.grey.shade300),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Payment Mode',
                                      style: FontConstant.styleSemiBold(
                                          fontSize: 15,
                                          color: AppColors.black)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: RadioListTile<int>(
                                        contentPadding: EdgeInsets.zero,
                                        title: const Text('Online'),
                                        activeColor: AppColors.primaryColor,
                                        value: 1,
                                        groupValue: amounttype,
                                        onChanged: (int? value) {
                                          setState(
                                            () {
                                              amounttype = value;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      child: RadioListTile<int>(
                                        contentPadding: EdgeInsets.zero,
                                        title: const Text('Wallet'),
                                        activeColor: AppColors.primaryColor,
                                        value: 2,
                                        groupValue: amounttype,
                                        onChanged: (int? value) {
                                          setState(() {
                                            amounttype = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  text: 'Pay Now',
                                  onPressed: () {
                                    buyPackageController.buyPackage(context);
                                  },
                                  color: AppColors.primaryColor,
                                  textStyle: FontConstant.styleRegular(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  if (buyPackageController.isLoading.value ||
                      applyCouponController.isLoading.value)
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    )
                ]);
              })),
            );
          },
        );
      },
    );
  }

  Widget buildPack(int package) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: package != 1
                      ? AppColors.constColor
                      : AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "Free Pack",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: FontConstant.styleSemiBold(
                        fontSize: 16,
                        color: package != 1
                            ? AppColors.black
                            : AppColors.constColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: package != 1
                            ? AppColors.grey
                            : AppColors.constColor,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: package == 1
                                    ? AppColors.grey
                                    : AppColors.primaryColor,
                              ),
                              child: package != 1
                                  ? SvgPicture.asset(
                                      "assets/images/icons/correct.svg")
                                  : Container(),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                package != 1 ? "Current Pack" : "Select Pack",
                                style: FontConstant.styleRegular(
                                    fontSize: 12,
                                    color: package != 1
                                        ? AppColors.constColor
                                        : AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  color: package == 1
                      ? AppColors.constColor
                      : AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: AppColors.primaryColor)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Crown.png",
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            "Premium Pack",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: FontConstant.styleSemiBold(
                                fontSize: 16,
                                color: package == 1
                                    ? AppColors.black
                                    : AppColors.constColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: package == 1
                            ? AppColors.grey
                            : AppColors.constColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 20,
                                width: 20,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: package != 1
                                      ? AppColors.grey
                                      : AppColors.primaryColor,
                                ),
                                child: package == 1
                                    ? SvgPicture.asset(
                                        "assets/images/icons/correct.svg")
                                    : Container()),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                package == 1 ? "Current Pack" : "Select Pack",
                                style: FontConstant.styleRegular(
                                    fontSize: 12,
                                    color: package == 1
                                        ? AppColors.constColor
                                        : AppColors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget packageSelect(
      BuildContext context, String tittle, int free, int premium) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              tittle,
              style: FontConstant.styleRegular(
                  fontSize: 12, color: AppColors.black),
            )),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                color: AppColors.constColor,
                alignment: Alignment.center,
                child: premium == 1
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

  Widget buildDiscount(BuildContext context, List<Data> list) {
    return Column(
      children: list.map((data) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.constColor,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 35.0, // Adjust the radius as needed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.discountType != null
                            ? data.discountType == "Amount"
                                ? "₹${data.discount}"
                                : "${data.discount}%"
                            : "",
                        style: FontConstant.styleMedium(
                          fontSize: 18,
                          color: AppColors.constColor,
                        ),
                        maxLines: 1, // Limits to one line
                        overflow:
                            TextOverflow.ellipsis, // Adds ellipsis for overflow
                        textAlign: TextAlign.center,
                      ),
                      // Adds space between the two texts
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Discount",
                          style: FontConstant.styleMedium(
                            fontSize: 10,
                            color: AppColors.constColor,
                          ),
                          maxLines: 1, // Limits to one line
                          overflow: TextOverflow
                              .ellipsis, // Adds ellipsis for overflow
                          textAlign: TextAlign
                              .center, // Center the text inside the circle
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New Users ${CommanClass.boyGirl(userProfileController.member?.member?.gender)}",
                        style: FontConstant.styleSemiBold(
                            fontSize: 15, color: AppColors.black),
                        maxLines: 1, // Limits to one line
                        overflow:
                            TextOverflow.ellipsis, // Adds ellipsis for overflow
                      ),
                      Text(
                        data.discountType != null
                            ? "Get ${data.discountType == "Amount" ? "₹${data.discount}" : "${data.discount}%"} Discount for the first ${data.noOfUser} boys"
                            : "",
                        style: FontConstant.styleRegular(
                            fontSize: 10, color: AppColors.black),
                        maxLines: 2, // Limits to one line
                        overflow:
                            TextOverflow.ellipsis, // Adds ellipsis for overflow
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(
                    color: AppColors.darkblue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: GestureDetector(
                  onTap: () => {
                    Clipboard.setData(ClipboardData(text: data.couponName))
                        .then((_) {
                      Dialogs.showSnackbar(
                          context, 'Copied ${data.couponName}');
                    })
                  },
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data.couponName,
                          style: FontConstant.styleBold(
                              fontSize: 13, color: AppColors.constColor),
                        ),
                        SvgPicture.asset("assets/images/icons/copy.svg"),
                        Text(
                          "COPY",
                          style: FontConstant.styleMedium(
                              fontSize: 12, color: AppColors.constColor),
                        )
                      ]),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
