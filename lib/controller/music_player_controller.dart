import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerController extends GetxController {
  var player = AudioPlayer();
  var isPlaying = false.obs;
  var isLoaded = false.obs; // Tracks if music is loaded
  var currentMusicUrl = ''.obs; // Tracks the current music URL

  @override
  void onClose() {
    player.dispose(); // Dispose player on close
    super.onClose();
  }

  Future<void> loadMusic(String musicUrl) async {
    if (currentMusicUrl.value != musicUrl) {
      // Stop current music if it is playing
      if (isPlaying.value) {
        await pauseMusic();
      }

      currentMusicUrl.value = musicUrl;
      try {
        await player.setUrl(musicUrl);
        isLoaded.value = true;
        await player.play(); // Automatically play after loading
        isPlaying.value = true; // Set isPlaying to true when playing
      } catch (e) {
        print("Error loading music: $e");
      }
    }
  }

  Future<void> playMusic() async {
    if (!isPlaying.value) {
      await player.play();
      isPlaying.value = true;
    }
  }

  Future<void> pauseMusic() async {
    if (isPlaying.value) {
      await player.pause();
      isPlaying.value = false;
    }
  }

  void seekBackward() {
    if (player.position.inSeconds >= 10) {
      player.seek(Duration(seconds: player.position.inSeconds - 10));
    } else {
      player.seek(Duration.zero);
    }
  }

  void seekForward() {
    if (player.position.inSeconds + 10 <= player.duration!.inSeconds) {
      player.seek(Duration(seconds: player.position.inSeconds + 10));
    } else {
      player.seek(Duration.zero);
    }
  }
}
