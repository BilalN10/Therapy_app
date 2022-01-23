import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:therapist/controller/chat_controller.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:get/get.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/image_view.dart';
import 'package:therapist/view/pages/PatientPages/Messages/components/video_view.dart';

class MessageInput extends StatefulWidget {
  const MessageInput({
    Key key,
  }) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  var _messageTextController = TextEditingController();
  final _chatController = Get.find<ChatController>();
  File _attachFile;
  // ignore: unused_field
  File _image;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 0.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              _getDataFromFile();
            },
            child: const Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
              child: Icon(
                Icons.attach_file,
                color: kPrimaryColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _getImagePicker();
            },
            child: const Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
              child: Icon(
                Icons.camera_alt,
                color: kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              child: TextFormField(
                maxLines: _messageTextController.text.length < 80 ? null : 4,
                controller: _messageTextController,
                onChanged: (String e) {
                  setState(() {});
                },
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.grey,
                      ),
                  fillColor: Colors.grey[150],
                  filled: true,
                  hintText: 'Enter Message...',
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _sendMessage();
            },
            child: const Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
              child: Icon(
                Icons.send,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (_messageTextController.text.isNotEmpty) {
      // print(_messageTextController.text);
      final DateTime d = DateTime.now();
      _chatController.updateMessageList(
        Message(
          messageType: MessageType.Text,
          status: MessageStatus.Delivered,
          reciever: userList[1],
          sender: userList[0],
          message: _messageTextController.text,
          sentDateTime: d,
        ),
      );
      _messageTextController.clear();
    }
  }

  void _getImagePicker() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        // ignore: avoid_print
        print('No image selected.');
      }
    });
  }

  void _getDataFromFile() async {
    final FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      try {
        _attachFile = File(result.files.single.path);
        final String mimeStr =
            lookupMimeType("Media Type: " + _attachFile.path);
        final fileType = mimeStr.split('/');
        // print("############ FILE FORMAT: " + fileType[0]);
        // print(_attachFile.toString());
        if (fileType[0] == 'image') {
          Get.to(
            () => ImageView(
              imgPath: _attachFile.path,
              fileImage: true,
            ),
          );
        } else if (fileType[0] == 'video') {
          Get.to(
            () => VideoView(
              videoPath: _attachFile.path,
              fileVideo: true,
            ),
          );
        } else {
          // print("######## UNKNOW FILE FORMAT ###########");
        }
      } catch (e) {
        //      print(e.toString());
      }
    } else {
      // User canceled the picker
    }
  }
}
