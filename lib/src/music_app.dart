import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ps_audio_player/src/custom_list_tile.dart';

class MusicApp extends StatefulWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  State<MusicApp> createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  List musicList = [
    {
      'title': "Massimo Santucci - Tarantella Warriors",
      'singer': "Daniel Portman Remix",
      'url':
          "https://soundcloud.com/mp3player/massimo-santucci-tarantella-warriors-daniel-portman-remix?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
      'coverUrl':
          "https://i1.sndcdn.com/avatars-000002022436-56ityp-t200x200.jpg",
    },
    {
      'title': "me + ex bitch - starfire",
      'singer': "Yungtarr",
      'url':
          "https://soundcloud.com/yung-tarr-191547626/me-my-babe-starfire?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
      'coverUrl':
          "https://i1.sndcdn.com/avatars-H6mJWcK4va9iy6iQ-gSelyA-t200x200.jpg",
    },
    {
      'title': "Massimo Santucci",
      'singer': "Daniel Portman Remix",
      'url':
          "https://soundcloud.com/mp3player/massimo-santucci-tarantella-warriors-daniel-portman-remix?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
      'coverUrl':
          "https://i1.sndcdn.com/avatars-000002022436-56ityp-t200x200.jpg",
    },
  ];
  String currentTitle = "";
  String currentCover = "";
  String currentSinger = "";
  IconData myIcon = Icons.play_arrow;

  String currentSong = "";

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      // int result = await audioPlayer.play(url);
      //  if (result == 1) {
      //    setState(() {
      //      currentSong = url;
      //    });
      //  }
    } else if (!isPlaying) {
      // int result = await audioPlayer.play(url);
      //  if (result == 1) {
      //    setState(() {
      //      isPlaying = true;
      //    });
      //  }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Playlist'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) => customListTile(
                onTap: () {
                  setState(() {
                    currentTitle = musicList[index]['title'];
                    currentCover = musicList[index]['coverUrl'];
                    currentSinger = musicList[index]['singer'];
                  });
                },
                title: musicList[index]['title'],
                singer: musicList[index]['singer'],
                cover: musicList[index]['coverUrl'],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8.0,
                )
              ],
            ),
            child: Column(
              children: [
                Slider.adaptive(
                  value: 0.0,
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                    left: 8,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                                image: NetworkImage(currentCover))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentTitle,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(currentSinger),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        iconSize: 40,
                        icon: Icon(myIcon),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
