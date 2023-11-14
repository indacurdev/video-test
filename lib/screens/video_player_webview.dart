import 'dart:async';
import 'dart:io';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerInWebview extends StatefulWidget {
  VideoPlayerInWebview({Key? key}) : super(key: key);

  @override
  State<VideoPlayerInWebview> createState() => _VideoPlayerInWebviewState();
}

class _VideoPlayerInWebviewState extends State<VideoPlayerInWebview> {

  String videoUrl = 'https://chaskyvideo-test.sfo2.digitaloceanspaces.com/media/videos/2023/11/02/f5e2f879766e4da4bc4fa17c1d6f3618.mov';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(title: const Text('video webview')),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            context.go('/');
          },
          child: Icon(Icons.video_camera_front),
        ),
        body: InAppWebView(
          initialUrlRequest:URLRequest(
            url: Uri.parse(videoUrl)
          ),
        ),
      )
    );
  }
}