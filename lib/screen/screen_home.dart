import 'package:diamond_homes/constant/constant_color.dart';
import 'package:diamond_homes/constant/constant_string.dart';
import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../component/widget_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

S txt = S();

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'One';
  int? selectValue;
  final _style = TextStyle(
      fontSize: 16, fontFamily: fontFamily, fontWeight: FontWeight.w500);

  List v = [
    txt.jobInvoiced,
    txt.jobOnApp,
    txt.notCompletedOnApp,
    txt.valueEarned,
    txt.valueLost
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(children: [
              TextWidget(
                  text: txt.info,
                  textSize: 16,
                  colorCode: Colors.black,
                  fontWeight: FontWeight.w500),
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
                              text: txt.download,
                              textSize: 12,
                              colorCode: Colors.black,
                              fontWeight: FontWeight.w500)))),
            ])),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: greyColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Column(
                children: [
                  for (RadioItemModel itemsModel in getRadioItem())
                    RadioButtonItem(
                        items: itemsModel,
                        selectValue: selectValue,
                        onChanged: (value) {
                          setState(() {
                            selectValue = value;
                          });
                        }),
                  Row(
                    children: [
                      TextWidget(
                          text: txt.priority,
                          textSize: 16,
                          colorCode: Colors.black,
                          fontWeight: FontWeight.bold),
                      SizedBox(width: 24),
                      Expanded(
                          child: Card(
                              child: ListTile(
                                  title: TextWidget(
                                      text: "All",
                                      textSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      colorCode: blackColor),
                                  trailing: Icon(
                                      Icons.keyboard_arrow_down_outlined))))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * .05),
        ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 80),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 40.0, top: 4, bottom: 4),
                      child: ListTile(
                        title: TextWidget(
                            text: v[index],
                            textSize: 12.0,
                            fontWeight: FontWeight.w600,
                            colorCode: blackColor),
                        subtitle: TextWidget(
                            text: "MAY 2021",
                            textSize: 10.0,
                            fontWeight: FontWeight.w500,
                            colorCode: blackColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Card(
                    color: blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: TextWidget(
                          text: "\$43.50",
                          textSize: 18.0,
                          fontWeight: FontWeight.w600,
                          colorCode: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ),
        SizedBox(
          height: size.height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(Icons.arrow_back_ios_new, color: blueColor),
            ),
            TextWidget(
                text: "MAY 2021",
                textSize: 20.0,
                fontWeight: FontWeight.w600,
                colorCode: blueColor),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                color: blueColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * .05,
        ),
      ],
    );
  }

  List<RadioItemModel> getRadioItem() {
    List<RadioItemModel> items = [];
    items.add(RadioItemModel(1, txt.appIncentives));
    items.add(RadioItemModel(2, txt.qualityPerformance));
    items.add(RadioItemModel(3, txt.kpis));

    return items;
  }
}

class RadioButtonItem extends StatelessWidget {
  final RadioItemModel? items;
  final int? selectValue;
  final ValueChanged? onChanged;

  const RadioButtonItem(
      {Key? key, this.items, this.selectValue, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
            visualDensity: VisualDensity(vertical: -2, horizontal: -4),
            value: items!.id,
            groupValue: selectValue,
            onChanged: onChanged),
        SizedBox(width: 6),
        TextWidget(
            text: items!.name,
            textSize: 16,
            colorCode: Colors.black,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}

class RadioItemModel {
  int? _id;
  String? _name;

  RadioItemModel(int? id, String? name) {
    _id = id;
    _name = name;
  }

  RadioItemModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  int? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;

    return map;
  }
}
