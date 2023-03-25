import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_string.dart';

import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../constant/constant_icon.dart';
import '../utils/util_common_method.dart';

class Info2Screen extends StatefulWidget {
  const Info2Screen({Key? key}) : super(key: key);

  @override
  State<Info2Screen> createState() => _Info2ScreenState();
}

class _Info2ScreenState extends State<Info2Screen> {
  int _value = 1;
  List infoList = [
    'New',
    'Health and Safety',
    'Tamaki',
    'Kainga Ora',
    'Quality',
    'Trades'
  ];
  S txt = S();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Row(
          children: [
            TextWidget(
                text: "Info",
                textSize: 16.0,
                fontWeight: FontWeight.w500,
                colorCode: blackColor),
            Spacer(),
            Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: TextWidget(
                          text: "Download All",
                          textSize: 12.0,
                          fontWeight: FontWeight.w500,
                          colorCode: blackColor)),
                )),
          ],
        ),
        SizedBox(height: 12),
        Container(
          decoration: createDecoration(greyColor, radius: 15),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  for (int i = 0; i < infoList.length; i++)
                    ListTile(
                      visualDensity:
                          VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: EdgeInsets.zero,
                      title: TextWidget(
                          text: infoList[i],
                          textSize: 14.0,
                          fontWeight: FontWeight.normal,
                          colorCode: blackColor),
                      leading: Radio(
                        visualDensity: VisualDensity(horizontal: -4),
                        value: i,
                        groupValue: _value,
                        onChanged: (int? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                    ),
                ],
              )),
        ),
        SizedBox(height: 12),
        Container(
            decoration: createDecoration(greyColor, radius: 15),
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => ListItem()))
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  final title;
  final value;

  const ListItem({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 4, left: 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              JobDetails(
                title: "Name",
                value: "Good habits to keep",
              ),
              JobDetails(
                title: "Document Name",
                value: "Good habits to keep.pdf",
              ),
              JobDetails(
                title: "Uploaded",
                value: "22-11-2021",
              ),
              JobDetails(title: "Viewed"),
              JobDetails(
                title: "Effective",
                value: "-",
              ),
              JobDetails(
                title: "Expires",
                value: "-",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobDetails extends StatelessWidget {
  final title;
  final value;

  const JobDetails({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TextWidget(
                  text: title,
                  textSize: 13.0,
                  fontWeight: FontWeight.w600,
                  colorCode: blackColor)),
          Expanded(
              flex: 2,
              child: value != null
                  ? TextWidget(
                      text: value,
                      textSize: 14.0,
                      fontWeight: FontWeight.normal,
                      colorCode: blackColor)
                  : Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.file_download_outlined,
                        color: blueColor,
                      ))),
        ],
      ),
    );
  }
}
