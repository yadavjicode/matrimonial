import 'package:devotee/constants/color_constant.dart';
import 'package:devotee/constants/font_constant.dart';
import 'package:devotee/controller/recommended_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:devotee/pages/drawer_page/drawer_comman_code.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedDevotees extends StatefulWidget {
  const RecommendedDevotees({super.key});

  @override
  State<RecommendedDevotees> createState() => _RecommendedDevoteesState();
}

class _RecommendedDevoteesState extends State<RecommendedDevotees> {
  final RecommendedController recommendedController =
      Get.put(RecommendedController());
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recommendedController.recommended(context);
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
          "Recommendation by Senior Devotees",
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
          Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/recommended.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: DrawerCommanCode().buildTextSemiBold(
                            "Recommended by Senior Devotees"),
                      ),
                      Obx(() {
                        return Expanded(
                          child: Stack(
                            children: [
                              if (!recommendedController.isLoading.value &&
                                  recommendedController.member?.data != null)
                                recommendationContent(),
                              if (recommendedController.isLoading.value)
                                const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget recommendationContent() {
    return ListView.builder(
        itemCount: recommendedController.member?.data?.length ?? 0,
        itemBuilder: (context, index) {
          final members = recommendedController.member?.data ?? [];

          if (members[index].type == "Video") {
            youtubePlayerController = YoutubePlayerController(
              initialVideoId:
                  YoutubePlayer.convertUrlToId(members[index].videoUrl!)!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            );
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.constColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(color: AppColors.primaryColor)),
            child: Column(
              children: [
                members[index].type != null
                    ? members[index].type == "Video"
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: YoutubePlayer(
                                controller: youtubePlayerController))
                        : ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image.network(
                                "http://devoteematrimony.aks.5g.in/${members[index].image!}"),
                          )
                    : const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                          child: Text("No data"),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    members[index].title ?? "",
                    textAlign: TextAlign.justify,
                    style: FontConstant.styleSemiBold(
                        fontSize: 15, color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
