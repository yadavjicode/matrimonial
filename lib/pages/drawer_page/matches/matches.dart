import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/pages/drawer_page/matches/all_matches/all_matches.dart';
import 'package:devotee/pages/drawer_page/matches/daily_recommended/daily_recommended.dart';
import 'package:devotee/pages/drawer_page/matches/desired_partners/desired_partners.dart';
import 'package:flutter/material.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Matches",
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
            padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.primaryColor,
                    labelColor: AppColors.primaryColor,
                    labelPadding: EdgeInsets.only(bottom: 10),
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Text(
                        "All Matches  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "  Daily Recommended  ",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "  Desired Partners",
                        style: TextStyle(fontSize: 16),
                      ),
                      
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AllMatches(),
                        DailyRecommendeds(),
                        DesiredPartner()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
