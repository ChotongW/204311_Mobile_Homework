import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoScreen extends StatefulWidget {
  const videoScreen({required this.path});
  final String path;
  @override
  _videoScreenState createState() => _videoScreenState();
}

class _videoScreenState extends State<videoScreen> {
//    with AutomaticKeepAliveClientMixin { ||||
//  @override                              |||| <= `un comment this lines to persist the state`
//  final wantKeepAlive = true;            ||||
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late final String path;

  @override
  void initState() {
    super.initState();
    path = widget.path;
    _controller = VideoPlayerController.asset(path)..setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Complete the code in the next step.
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
// //    super.build(context);                 ||||  <= `un comment this line to persist the state`
//     return FutureBuilder(
//       future: _init(),
//       builder: (context, future) => AnimatedContainer(
//         duration: const Duration(seconds: 1),
//         height: future.hasData && !future.hasError
//             ? _controller.value.size.height
//             : MediaQuery.of(context).size.height * .5,
//         width: future.hasData && !future.hasError
//             ? _controller.value.size.width
//             : MediaQuery.of(context).size.width * .5,
//         child: !future.hasData
//             ? const Align(child: CircularProgressIndicator())
//             : future.hasError
//                 ? const Align(child: Icon(Icons.error))
//                 : GestureDetector(
//                     onTap: () => _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play(),
//                     child: Stack(
//                       children: [
//                         Align(
//                           child: AspectRatio(
//                             aspectRatio: _controller.value.aspectRatio,
//                             child: VideoPlayer(_controller),
//                           ),
//                         ),
//                         Align(
//                           child: Text(
//                             '${widget.index}',
//                             style: const TextStyle(color: Colors.orange),
//                             textScaleFactor: 10,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//       ),
//     );
//   }
}
