import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "My Wallet",
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.constColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xFF583689), Color(0xFFDA1E75)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                                "assets/images/icons/wallet.svg"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Total Wallet Balance",
                                overflow: TextOverflow.ellipsis,
                                style: FontConstant.styleRegular(
                                    fontSize: 16, color: AppColors.black)),
                            Text(
                              "₹ 0.00",
                              style: FontConstant.styleSemiBold(
                                  fontSize: 25, color: AppColors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 1,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Container(
                              height: 1,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "Refer and Earn",
                          style: FontConstant.styleMedium(
                              fontSize: 16, color: AppColors.black),
                        ),
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 1,
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(
                              height: 1,
                            ),
                            Container(
                              height: 1,
                              color: AppColors.primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: AppColors.constColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/walletRefer.png",
                          height: 86,
                          width: 138,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refer Devotee Matrimony to friends and earn wallet money.",
                              style: FontConstant.styleRegular(
                                  fontSize: 12, color: AppColors.darkgrey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/referEarn');
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 5),
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFDDDE),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  child: Text(
                                    "Refer Now",
                                    style: FontConstant.styleMedium(
                                        fontSize: 12, color: AppColors.black),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Transactions",
                        style: FontConstant.styleMedium(
                            fontSize: 16, color: AppColors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            transHistory(true, "100"),
                            transHistory(false, "50"),
                            transHistory(true, "100"),
                            transHistory(true, "100"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget transHistory(bool type, String amount) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 7),
      decoration: const BoxDecoration(
          color: AppColors.constColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: type == true
                      ? AppColors.lightGreen
                      : AppColors.background,
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(type == true
                    ? "assets/images/icons/greenArrow.svg"
                    : "assets/images/icons/redArrow.svg"),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type == true
                          ? "Refer Cashback Received"
                          : "Used to update membership",
                      style: FontConstant.styleMedium(
                          fontSize: 12, color: AppColors.black),
                    ),
                    Text(
                      "28 July 24  |  Expire Date: 5 Aug 24",
                      style: FontConstant.styleRegular(
                          fontSize: 12, color: AppColors.darkgrey),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "${type == true ? "+" : "-"} ₹ $amount.00",
              style: FontConstant.styleSemiBold(
                  fontSize: 13,
                  color: type == true ? AppColors.green : AppColors.red),
            )
          ],
        ),
      ),
    );
  }
}
