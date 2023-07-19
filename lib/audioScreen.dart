// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class AudioScreen extends StatefulWidget {
//   const AudioScreen({super.key});

//   @override
//   State<AudioScreen> createState() => _AudioScreenState();
// }

// class _AudioScreenState extends State<AudioScreen> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
//   late AudioCache audioCache;
//   String path = "Music1.mp3";

//   @override
//   void initState() {
//     super.initState();

//     audioCache = AudioCache(fixedPlayer: audioPlayer);
//     audioPlayer.onPlayerStateChanged.listen(
//       (AudioPlayerState s) {
//         setState(() {
//           audioPlayerState = s;
//         });
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     audioPlayer.release();
//     audioPlayer.dispose();
//     audioCache.clearCache();
//   }

//   playMusic() async {
//     await audioCache.play(path);
//   }

//   pauseMusic() async {
//     await audioPlayer.pause();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Music Player",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: Color.fromARGB(243, 105, 42, 161),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () => playAudio(),
//               child: const Text("Play Music"),
//             ),
//             ElevatedButton(
//              onPressed: ()=> pauseAudio(),
//              child: const Text("Pause Music"),),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});
  static const String routeName = 'assets/audio/Music3S.mp3';

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  late AudioCache audioCache;
  String path = "assets/audio/Music3S.mp3";

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen(
      (PlayerState s) {
        setState(() {
          audioPlayerState = s;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();
  }

  playMusic() async {
    await audioPlayer.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Music Player",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(243, 105, 42, 161),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => playMusic(),
              child: const Text("Play Music"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => pauseMusic(),
              child: const Text("Pause Music"),
            ),
          ],
        ),
      ),
    );
  }
}
