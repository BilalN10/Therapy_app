import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:therapist/controller/chat_controller.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/image_view.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/video_view.dart';
import 'package:therapist/view/size_config.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

final User me = userList[0];

class MessageBar extends StatelessWidget {
  MessageBar({
    Key key,
  }) : super(key: key);

  final _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          final _messages = _chatController.messageList.reversed;
          return Align(
            alignment: Alignment.topCenter,
            child: Scrollbar(
              radius: const Radius.circular(kBorderRadius),
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final bool _isMe =
                      _messages.elementAt(index).sender.username == me.username;
                  final Message _msg = _messages.elementAt(index);
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 0.3,
                    ),
                    child: Row(
                      mainAxisAlignment: _isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _isMe
                            ? Text(
                                DateFormat.jm().format(_msg.sentDateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 9,
                                    ),
                              )
                            : const SizedBox(),
                        _getMessageBox(message: _msg),
                        !_isMe
                            ? Text(
                                DateFormat.jm().format(_msg.sentDateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(
                                      fontSize: 9,
                                    ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  _getMessageBox({Message message}) {
    switch (message.messageType) {
      case MessageType.Text:
        return TextMessage(message: message);
      case MessageType.Media:
        return MediaMessage(message: message);
      case MessageType.File:
        return FileMessage(message: message);
      default:
        return const SizedBox();
    }
  }
}

// Widget Specificly to Show File Type Message
// eg, pdf file, txt file etc
class FileMessage extends StatelessWidget {
  const FileMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    final bool _isMe = message.sender.username == me.username;
    return Container(
      width: getRelativeWidth(0.75),
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding * 0.6,
        horizontal: kDefaultPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        color: _isMe ? kPrimaryColor : Colors.grey[300],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/files.svg',
            height: 22,
          ),
          const SizedBox(
            width: kDefaultPadding * 0.5,
          ),
          const Text('sample.pdf'),
        ],
      ),
    );
  }
}

// Widget Specificly to Show Media Type Message
// eg, Photo / Video
class MediaMessage extends StatelessWidget {
  const MediaMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    final String mimeStr = lookupMimeType("Media Type: " + message.message);
    final fileType = mimeStr.split('/');
    final bool isImage = fileType[0] == 'image';
    // print(isImage);
    return isImage
        ? GestureDetector(
            onTap: () {
              Get.to(
                ImageView(
                  imgPath: message.message,
                ),
              );
            },
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: getRelativeWidth(0.75),
                  maxHeight: getRelativeWidth(0.4),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  child: Image.asset(
                    message.message,
                    fit: BoxFit.cover,
                  ),
                )))
        : VideoBox(
            videoPath: message.message,
          );
  }
}

// Video Player Widget
class VideoBox extends StatefulWidget {
  const VideoBox({
    Key key,
    @required this.videoPath,
  }) : super(key: key);

  final String videoPath;
  @override
  _VideoBoxState createState() => _VideoBoxState();
}

class _VideoBoxState extends State<VideoBox> {
  var _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      widget.videoPath,
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: getRelativeWidth(0.8),
        maxHeight: getRelativeWidth(0.4),
      ),
      child: _videoPlayerController.value.isInitialized
          ? ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRadius),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(
                    _videoPlayerController,
                  ),
                  Positioned.fill(
                    child: IconButton(
                      onPressed: () {
                        Get.to(
                          VideoView(videoPath: widget.videoPath),
                        );
                      },
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 62.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const CircularProgressIndicator(),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}

// Widget Specificly to Only Text Message
class TextMessage extends StatelessWidget {
  const TextMessage({
    Key key,
    @required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final bool _isMe = message.sender.username == me.username;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: getRelativeWidth(0.75)),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.6,
          horizontal: kDefaultPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(kBorderRadius),
            topRight: const Radius.circular(kBorderRadius),
            topLeft: _isMe
                ? const Radius.circular(kBorderRadius)
                : const Radius.circular(0),
            bottomRight: _isMe
                ? const Radius.circular(0)
                : const Radius.circular(kBorderRadius),
          ),
          color: _isMe ? kPrimaryColor : Colors.grey[300],
        ),
        child: Text(
          message.message,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: _isMe ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}
