import 'dart:async';
import 'dart:io';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerTest extends StatefulWidget {
  VideoPlayerTest({Key? key}) : super(key: key);

  @override
  State<VideoPlayerTest> createState() => _VideoPlayerTestState();
}

class _VideoPlayerTestState extends State<VideoPlayerTest> {

  late VideoPlayerController _controller;
  //String videoUrl = 'https://chaskyvideo-test.sfo2.digitaloceanspaces.com/media/videos/2023/11/02/f5e2f879766e4da4bc4fa17c1d6f3618.mov';
  String videoUrl = 'https://chaskyvideo-test.sfo2.digitaloceanspaces.com/media/videos/2023/10/06/bf0cc266b5a8460dbef28014250ed133.mp4';
  
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

   @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(title: const Text('video player')),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.go('/webview');
          },
          child: Icon(Icons.open_in_browser),
        ),
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
      )
    );
  }
}

