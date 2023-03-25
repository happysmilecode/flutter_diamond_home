import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constant/constant_string.dart';


class CircularImageWidget extends StatelessWidget {
  final XFile? imageUrl;
  final String? path;
  final Color? borderColor;
  final Function? press;

  const CircularImageWidget(
      {Key? key, this.imageUrl, this.borderColor, this.path, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.20,
        child: Stack(children: <Widget>[
          Center(
            child: Container(
                width: size.height * 0.16,
                height: size.height * 0.16,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    image: DecorationImage(image: getImage(), fit: BoxFit.cover),
                    border: Border.all(
                        color: borderColor!,
                        width: 6.0,
                        style: BorderStyle.solid),
                    borderRadius: const BorderRadius.all(Radius.circular(90.0)))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                child: GestureDetector(
                    onTap: press as GestureTapCallback?, // button pressed,
                    child: Container(
                        padding: const EdgeInsets.all(6.0),
                        child: const Icon(Icons.camera_alt_outlined)))),
          )
        ]));
  }

  ImageProvider getImage() {
    if (imageUrl != null) {
      return FileImage(File(imageUrl!.path));
    } else {
      return NetworkImage(path == null
          ? "https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png"
          : baseImageUrl + path!);
    }
  }
}
