import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Widget to show Video in full screen mode
class VideoView extends StatefulWidget {
  const VideoView({
    Key key,
    @required this.videoPath,
    this.fileVideo = false,
  }) : super(key: key);

  final String videoPath;
  final bool fileVideo;

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  var _videoPlayerController;
  var _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = widget.fileVideo
        ? VideoPlayerController.file(
            File(
              widget.videoPath,
            ),
          )
        : VideoPlayerController.asset(
            widget.videoPath,
          )
      ..initialize().then((_) {
        setState(() {});
      });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Chewie(
            controller: _chewieController,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
