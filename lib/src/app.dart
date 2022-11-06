import 'package:flutter/material.dart';
import 'package:ps_audio_player/src/audio_player_ps.dart';
import 'package:ps_audio_player/src/music_app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: AudioPlayerPS(),
      home: MusicApp(),
    );
  }
}
