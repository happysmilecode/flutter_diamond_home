import 'package:diamond_homes/constant/constant_color.dart';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../component/widget_button.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_icon.dart';


class Info1Screen extends StatefulWidget {
  const Info1Screen({Key? key}) : super(key: key);

  @override
  State<Info1Screen> createState() => _Info1ScreenState();
}

class _Info1ScreenState extends State<Info1Screen> {
  List<String> items = ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.all(8),
      children: [
        SizedBox(height: size.height * .010),
        TextWidget(
            text: "Info",
            textSize: 16.0,
            fontWeight: FontWeight.w600,
            colorCode: blackColor),
        SizedBox(height: size.height * .020),
        Row(children: [
          Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: Icon(Icons.equalizer))),
          Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.print, color: blackColor),
                    SizedBox(width: 8),
                    TextWidget(
                        text: "Print",
                        textSize: 12.0,
                        fontWeight: FontWeight.w500,
                        colorCode: blackColor),
                    SizedBox(width: 16),
                  ],
                ),
              )),
          Expanded(
              child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: greenColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(icExcel, height: 16),
                            SizedBox(width: 8),
                            TextWidget(
                                text: "Save As Excel",
                                textSize: 12.0,
                                fontWeight: FontWeight.w500,
                                colorCode: greenColor),
                          ]))))
        ]),
        SizedBox(height: size.height * .020),
        Card(
          color: greyColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                        text: "Rates as at",
                        textSize: 14.0,
                        fontWeight: FontWeight.w600,
                        colorCode: blackColor),
                    SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                    TextButton.icon(
                        style: TextButton.styleFrom(
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            padding: EdgeInsets.zero),
                        onPressed: () {},
                        icon: Icon(
                          Icons.date_range,
                          size: 18,
                        ),
                        label: Text("DD-MM-YYYY")),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    TextWidget(
                        text: "Job Code",
                        textSize: 14.0,
                        fontWeight: FontWeight.w600,
                        colorCode: blackColor),
                    SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    TextWidget(
                        text: "Job Description",
                        textSize: 14.0,
                        fontWeight: FontWeight.w600,
                        colorCode: blackColor),
                    SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: TextWidget(
                            text: "Job\nCategory",
                            textSize: 14.0,
                            fontWeight: FontWeight.w600,
                            colorCode: blackColor)),
                    ItemDropDown(items: items, onChanged: print),
                  ],
                ),
                Divider(thickness: 1.5, color: Colors.transparent),
                Row(
                  children: [
                    Expanded(
                        child: TextWidget(
                            text: "Contract\nYear",
                            textSize: 14.0,
                            fontWeight: FontWeight.w600,
                            colorCode: blackColor)),
                    ItemDropDown(items: items, onChanged: print),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  color: Colors.transparent,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextWidget(
                            text: "Area",
                            textSize: 14.0,
                            fontWeight: FontWeight.w600,
                            colorCode: blackColor)),
                    ItemDropDown(items: items, onChanged: print),
                  ],
                ),
                SizedBox(height: 32),
                ButtonWidget(
                    textButton: "Search",
                    textSize: 16.0,
                    textColor: whiteColor,
                    fontWeight: FontWeight.w500,
                    heightButton: 54,
                    borderRadius: 12.0,
                    backgroundColor: blueColor,
                    onPress: () {}),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SizedBox(height: 24),
        Card(
            color: greyColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => ListItem()),
            ))
      ],
    );
  }
}

class ItemDropDown extends StatelessWidget {
  final List<String>? items;
  final ValueChanged<String?>? onChanged;

  const ItemDropDown({Key? key, this.items, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: DropdownSearch<String>(
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: whiteColor)),
        popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('I')),
        items: items!,
        onChanged: onChanged,
        selectedItem: items![0],
      ),
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
                title: "Job Code",
                value: "20801212",
              ),
              JobDetails(
                title: "UOM",
                value: "1187077",
              ),
              JobDetails(
                title: "Short Description",
                value: "Decorating Daywork, Labour",
              ),
              JobDetails(
                title: "Long Description",
                value:
                    "Decorating daywork hourly rate, (worked hour). Rate to include allowances for travel and establishment time, down time, overtime, holiday pay, insuarances, levies, handtools, small plant items, minor consumable, overheads and profit.",
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
