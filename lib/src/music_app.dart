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
      'title': "Massimo Santucci - Tarantella Warriors",
      'singer': "Daniel Portman Remix",
      'url':
          "https://soundcloud.com/mp3player/massimo-santucci-tarantella-warriors-daniel-portman-remix?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
      'coverUrl':
          "https://i1.sndcdn.com/avatars-000002022436-56ityp-t200x200.jpg",
    },
    {
      'title': "Massimo Santucci - Tarantella Warriors",
      'singer': "Daniel Portman Remix",
      'url':
          "https://soundcloud.com/mp3player/massimo-santucci-tarantella-warriors-daniel-portman-remix?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing",
      'coverUrl':
          "https://i1.sndcdn.com/avatars-000002022436-56ityp-t200x200.jpg",
    },
  ];

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
                onTap: () {},
                title: musicList[index]['title'],
                singer: musicList[index]['singer'],
                cover: musicList[index]['coverUrl'],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
