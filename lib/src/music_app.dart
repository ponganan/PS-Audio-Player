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
      'title': "Newjeans",
      'singer': "cesna",
      'url': "https://jiwaree888.com/musics/Newjeans.mp3",
      'coverUrl':
          "https://jiwaree888.com/coverurl/avatars-Ok5G3Nzje6JnmimH-JXCpfw-t500x500.jpg",
    },
    {
      'title': "Randy w/Yungtarr",
      'singer': "4ourYou",
      'url': "https://jiwaree888.com/musics/RandywYungtarr.mp3",
      'coverUrl':
          "https://jiwaree888.com/coverurl/avatars-xtTWhjNaGOyrA16G-feSsug-t500x500.jpg",
    },
    {
      'title': "Sex and Float",
      'singer': "Percy",
      'url': "https://jiwaree888.com/musics/SexandFloat.mp3",
      'coverUrl':
          "https://jiwaree888.com/coverurl/avatars-MsyOWoMM7MHtxJfZ-00NZHQ-t500x500.jpg",
    },
  ];
  String currentTitle = "";
  String currentCover = "";
  String currentSinger = "";
  String currentUrl = "";
  IconData myIcon = Icons.play_arrow;

  String currentSong = "";

  Duration duration = const Duration();
  Duration position = const Duration();

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
          myIcon = Icons.play_arrow;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });

      audioPlayer.onAudioPositionChanged.listen((newPositon) {
        setState(() {
          position = newPositon;
        });
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
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
                  playMusic(musicList[index]['url']);
                  setState(() {
                    currentTitle = musicList[index]['title'];
                    currentCover = musicList[index]['coverUrl'];
                    currentSinger = musicList[index]['singer'];
                    currentUrl = musicList[index]['url'];
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
              // children: [
              //   Slider.adaptive(
              //     value: position.inSeconds.toDouble(),
              //     min: 0.0,
              //     max: duration.inSeconds.toDouble(),
              //     onChanged: (value) {},
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(
              //       bottom: 8.0,
              //       left: 8,
              //       right: 10,
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           height: 80,
              //           width: 80,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15.0),
              //               image: DecorationImage(
              //                   image: NetworkImage(currentCover))),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               currentTitle,
              //               style: const TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             const SizedBox(height: 5),
              //             Text(currentSinger),
              //           ],
              //         ),
              //         IconButton(
              //           onPressed: () {
              //             if (isPlaying) {
              //               audioPlayer.pause();
              //               setState(() {
              //                 myIcon = Icons.pause;
              //                 isPlaying = false;
              //               });
              //             } else {
              //               audioPlayer.pause();
              //               setState(() {
              //                 myIcon = Icons.play_arrow;
              //                 isPlaying = true;
              //               });
              //             }
              //           },
              //           iconSize: 40,
              //           icon: Icon(myIcon),
              //         ),
              //       ],
              //     ),
              //   )
              // ],

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                currentCover.toString() != ""
                    ? Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            currentCover,
                            // width: double.infinity,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRglEcxWR3D4LNllR0XrxXhnbZhan_oZ0XR1dj-t2if2ug54dT7_vNP_RqyJWKefRBGu2Y&usqp=CAU',
                                // width: double.infinity,
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text(
                              'Please Select Song',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 10),
                Text(
                  currentTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  currentSinger,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                    await audioPlayer.resume();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration - position)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                    //       left: 8,
                    //       right: 10,
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    child: IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 50,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(currentUrl);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
