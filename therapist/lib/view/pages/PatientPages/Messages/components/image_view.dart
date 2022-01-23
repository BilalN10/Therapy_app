import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// Widget to show Image in full screen mode
class ImageView extends StatelessWidget {
  const ImageView({
    Key key,
    @required this.imgPath,
    this.fileImage = false,
  }) : super(key: key);
  final String imgPath;
  final bool fileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: PhotoView(
            imageProvider: fileImage
                ? FileImage(
                    File(
                      imgPath,
                    ),
                  )
                : AssetImage(
                    imgPath,
                  ),
          ),
        ),
      ),
    );
  }
}
