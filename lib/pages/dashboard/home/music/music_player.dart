import 'package:devotee/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../constants/font_constant.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final Map<String, dynamic> arguments = Get.arguments;
  String thumbnailImgUrl =
      "https://i.pinimg.com/originals/c2/c5/78/c2c5784e73ad6998193ca3cb6b8a27d2.jpg";
  var player = AudioPlayer();
  bool loaded = false;
  bool playing = false;

  void loadMusic(String musicUrl) async {
    try {
      await player.setUrl(musicUrl);
      setState(() {
        loaded = true;
      });
    } catch (e) {
      print("Error loading music: $e");
    }
  }

  void playMusic() async {
    try {
      setState(() {
        playing = true;
      });
      await player.play();
    } catch (e) {
      print("Error playing music: $e");
    }
  }

  void pauseMusic() async {
    try {
      setState(() {
        playing = false;
      });
      await player.pause();
    } catch (e) {
      print("Error pausing music: $e");
    }
  }

  @override
  void initState() {
    final String url = arguments['url'];
    String musicUrl = "https://devoteematrimony.aks.5g.in/${url}";
    loadMusic(musicUrl);
    playMusic();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String title = arguments['title'];
    return Scaffold(
      backgroundColor: AppColors.background,
      // appBar: AppBar(
      //   title: const Text("Music Player"),
      // ),
      body: SafeArea(
        child: Stack(children: [
          Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/music.jpg",
                    height: 350,
                    width: 350,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title,
                    style: FontConstant.styleRegular(
                        fontSize: 13, color: AppColors.black)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: StreamBuilder<Duration>(
                  stream: player.positionStream,
                  builder: (context, snapshot1) {
                    final Duration position = snapshot1.data ?? Duration.zero;
                    final Duration? totalDuration = player.duration;

                    return StreamBuilder<Duration>(
                      stream: player.bufferedPositionStream,
                      builder: (context, snapshot2) {
                        final Duration bufferedDuration =
                            snapshot2.data ?? Duration.zero;

                        return SizedBox(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ProgressBar(
                              progress: position,
                              total: totalDuration ?? Duration.zero,
                              buffered: bufferedDuration,
                              timeLabelPadding: -1,
                              timeLabelTextStyle: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                              progressBarColor: Colors.pink.shade300,
                              baseBarColor: Colors.grey[200],
                              bufferedBarColor: Colors.grey[350],
                              thumbColor: Colors.pink,
                              onSeek: loaded
                                  ? (duration) async {
                                      await player.seek(duration);
                                    }
                                  : null,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: loaded
                        ? () async {
                            if (player.position.inSeconds >= 10) {
                              await player.seek(Duration(
                                  seconds: player.position.inSeconds - 10));
                            } else {
                              await player.seek(Duration.zero);
                            }
                          }
                        : null,
                    icon: const Icon(Icons.fast_rewind_rounded),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primaryColor),
                    child: IconButton(
                      onPressed: loaded
                          ? () {
                              if (playing) {
                                pauseMusic();
                              } else {
                                playMusic();
                              }
                            }
                          : null,
                      icon: Icon(
                        playing ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: loaded
                        ? () async {
                            if (player.position.inSeconds + 10 <=
                                player.duration!.inSeconds) {
                              await player.seek(Duration(
                                  seconds: player.position.inSeconds + 10));
                            } else {
                              await player.seek(Duration.zero);
                            }
                          }
                        : null,
                    icon: const Icon(Icons.fast_forward_rounded),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Center(
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: const SizedBox(
                    height: 40,
                    width: 40,
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
