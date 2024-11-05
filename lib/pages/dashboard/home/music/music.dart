import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../constants/font_constant.dart';
import '../../../../controller/music_controller.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  final MusicController musicController = Get.put(MusicController());
  var player = AudioPlayer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      musicController.music(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Music",
          style: FontConstant.styleSemiBold(
              fontSize: 18, color: AppColors.constColor),
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/background.png")),
            if (!musicController.isLoading.value) musicContent(),
            if (musicController.isLoading.value)
              const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget musicContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 15, bottom: 25),
          itemCount: musicController.member?.data?.length ?? 0,
          itemBuilder: (context, index) {
            final members = musicController.member?.data ?? [];
            return GestureDetector(
              onTap: () => {
                if (members[index].songLink != null ||
                    members[index].songLink!.isNotEmpty)
                  {
                    Get.toNamed("/musicPlayer", arguments: {
                      "url": members[index].songLink,
                      "title": members[index].title
                    })
                  }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.constColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: AppColors.primaryColor)),
                child: Row(children: [
                  Expanded(
                      child: Text(
                    "${members[index].title}",
                    overflow: TextOverflow.ellipsis,
                    style: FontConstant.styleRegular(
                        fontSize: 13, color: AppColors.black),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink.shade200),
                      child: const Icon(
                        Icons.play_arrow,
                        color: AppColors.primaryColor,
                      ))
                ]),
              ),
            );
          }),
    );
  }
}
