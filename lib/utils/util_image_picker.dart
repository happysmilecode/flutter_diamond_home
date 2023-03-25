import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';
import '../constant/constant_string.dart';
import 'util_common_method.dart';
import 'util_widget.dart';

void showPicker(context,
    {onGalleryPress, onCameraPress,onDocumentPress}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: TextWidget(
                      text: "Add Item",
                      textSize: 20.0,
                      shadows: textShadow(),
                      fontWeight: FontWeight.w500,
                      colorCode: Colors.black),
                ),
              ),
              getGalleryItem(icGetGallery, "Photo", onGalleryPress),
              getGalleryItem(icGetCamera, "Camera", onCameraPress),
            ],
          ),
        );
      });
}

ListTile getGalleryItem(imageName, text, onPress) {
  return ListTile(
      leading: Image.asset(imageName, height: 28),
      title: TextWidget(
          text: text,
          textSize: 18.0,
          shadows: textShadow(),
          fontWeight: FontWeight.w500,
          colorCode: textColor),
      minLeadingWidth: 16,
      visualDensity: const VisualDensity(horizontal: 0),
      onTap: onPress);
}

Future<CroppedFile?> imgFromGalleryCamera(context,
    ImageSource imageSource) async {
  XFile? image = await ImagePicker().pickImage(source: imageSource);
  CroppedFile? croppedFile = await ImageCropper()
      .cropImage(sourcePath: image!.path, aspectRatioPresets: [
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
  ], uiSettings: [
    AndroidUiSettings(
        toolbarTitle: "Crop Image",
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false),
    IOSUiSettings(
      minimumAspectRatio: 1.0,
      title: "Crop Image",
    )
  ]);

  return croppedFile;
}

String getUserImage(String? userImage) {
  if (!isNullString(userImage)) {
    return baseImageUrl + userImage!;
  } else {
    return 'https://i0.wp.com/fashionablymale.net/wp-content/uploads/2016/04/steven-brocos-by-miguel-zaragozacc81-for-fashionably-male-2.jpg?resize=900%2C1350&ssl=1';
  }
}

Widget loadingImage(ImageChunkEvent? loadingProgress) {
  return Stack(
    children: [
      Image.asset(icPlaceHolder, fit: BoxFit.fill),
     /* Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Center(
              child: CircularProgressIndicator(
            value: loadingProgress!.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          )))*/
    ],
  );
}
