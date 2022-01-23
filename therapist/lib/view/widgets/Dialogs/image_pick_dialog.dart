import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/size_config.dart';

// ignore: must_be_immutable
class ImagePickDialog extends StatelessWidget {
  ImagePickDialog({
    Key key,
  }) : super(key: key);

  File file;
  final picker = ImagePicker();
  String imgPath;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      backgroundColor: kBackgroundColor,
      child: Container(
        height: getRelativeHeight(0.2),
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profile Photo",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: kDefaultPadding * 0.5),
            GestureDetector(
              onTap: () {
                handleChooseImageFromGallery(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.photo,
                    color: Colors.grey,
                    //size: 40.0,
                  ),
                  const SizedBox(
                    width: kDefaultPadding * 0.5,
                  ),
                  Text(
                    "Image from gallery",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding * 0.5,
            ),
            GestureDetector(
              onTap: () {
                handleTakePhoto(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.camera_alt,
                    //size: 40.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: kDefaultPadding * 0.5,
                  ),
                  Text(
                    "Take Picture",
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleTakePhoto(BuildContext context) async {
    Navigator.pop(context);
    // ignore: unused_local_variable
    final pickedFile = await picker.getImage(source: ImageSource.camera);
  }

  void handleChooseImageFromGallery(BuildContext context) async {
    Navigator.pop(context);
    // ignore: unused_local_variable
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
  }
}
