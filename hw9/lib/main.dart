import 'package:flutter/material.dart';
import 'package:hw9/videoScreen.dart';
import 'package:video_player/video_player.dart';
import 'VideoDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Navigation + Passing Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  // late VideoPlayerController _controllers;
  final List video_list = [
    VideoDetail(
        videoPath: "videos/Dara.mp4",
        videoImg: "images/dara.png",
        videoName: "Blackbeans - Dara"),
    VideoDetail(
        videoPath: "videos/Heal.mp4",
        videoImg: "images/heal.png",
        videoName: "Blackbeans - Heal"),
    VideoDetail(
        videoPath: "videos/I Miss You.mp4",
        videoImg: "images/imissyou.png",
        videoName: "Blackbeans - I Miss You"),
    VideoDetail(
        videoPath: "videos/Wish.mp4",
        videoImg: "images/wish.png",
        videoName: "Blackbeans - Wish"),
    VideoDetail(
        videoPath: "videos/moon.mp4",
        videoImg: "images/moon.png",
        videoName: "Blackbeans - Moon"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube demo'),
      ),
      body: ListView.builder(
          itemCount: video_list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          videoScreen(path: video_list[index].videoPath),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      // child: Text("Dara"),
                      width: 700,
                      height: 570,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(video_list[index].videoImg),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.pink,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Container(
                            width: 700,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(video_list[index].videoName),
                                ),
                                Center(
                                  child: Text('Username . 6 hours ago'),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ));
          }),
    );
  }
}
