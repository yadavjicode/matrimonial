import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/font_constant.dart';

class ReferralAndReward extends StatefulWidget {
  const ReferralAndReward({super.key});

  @override
  State<ReferralAndReward> createState() => _ReferralAndRewardState();
}

class _ReferralAndRewardState extends State<ReferralAndReward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Referral And Reward",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: Image.asset("assets/images/bg3.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Rewards and Referral Program",
                    style: FontConstant.styleSemiBold(
                        fontSize: 15, color: AppColors.black),
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Program Name: ",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "Devotee Matrimony Rewards\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n1. Program Overview\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "The Devotee Matrimony Rewards program is designed to incentivize our users to invite friends and family to join our matrimonial platform. For every successful referral, both the referrer and the new user will receive rewards.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n2. How It Works\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "• Referring Users: ",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "Existing members (Free/ Premium) can refer friends using a unique referral link provided on their profile.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "• New User Registration: ",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "When a new user signs up using the referral link, they must complete their profile (at least 80% profile completion required).\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "• Reward Distribution: ",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "Once the new user completes the registration process, rewards will be automatically credited to both users.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n3. Rewards Structure\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "• For Referrer:\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "  o Reward: INR 100 credit towards premium membership for each successful referral.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "  o Milestone Bonus: After referring 5 users, receive a bonus INR 50 credit.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "• For New User:\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "  o Welcome Bonus: INR 100 credit towards their first premium membership purchase upon signing up with a referral link.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n4. Eligibility Criteria\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "• The referred user must complete their profile (100%).\n• Rewards are non-transferable and cannot be redeemed for cash.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n5. Maximum Reward Amount\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "Using this referral program or any other referral program, any user can earn a reward in DM Wallet up to a maximum amount of INR 2,000 in a period of 1 year.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\n6. Terms and Conditions\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "• The program is subject to change at any time.\n• Fraudulent activity will result in disqualification from the program.\n• The website reserves the right to modify or terminate the rewards program at its discretion.\n",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text: "\nConclusion\n",
                          style: FontConstant.styleSemiBold(
                              fontSize: 12, color: AppColors.black),
                        ),
                        TextSpan(
                          text:
                              "The Devotee Matrimony Rewards program aims to build a community of engaged users while providing incentives for inviting others. By rewarding both referrers and new users, we create a win-win situation that can help grow your matrimonial website.",
                          style: FontConstant.styleRegular(
                              fontSize: 12, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
