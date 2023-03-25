import 'package:diamond_homes/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../component/widget_button.dart';
import '../component/widget_text_field.dart';
import '../constant/constant_color.dart';
import '../constant/constant_icon.dart';
import '../constant/constant_string.dart';

class ViewJobs1Screen extends StatefulWidget {
  const ViewJobs1Screen({Key? key}) : super(key: key);

  @override
  State<ViewJobs1Screen> createState() => _ViewJobs1ScreenState();
}

class _ViewJobs1ScreenState extends State<ViewJobs1Screen> {
  S txt = S();
  List<String> items = ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        TextWidget(
            text: txt.viewJobs,
            textSize: 16.0,
            fontWeight: FontWeight.w500,
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
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 18,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(width: 8),
                        TextWidget(
                            text: "Date",
                            textSize: 14.0,
                            fontWeight: FontWeight.w600,
                            colorCode: blackColor),
                      ],
                    ),
                    SizedBox(width: 12),
                    SizedBox(
                        height: 15,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                    SizedBox(width: 6),
                    TextButton(
                        style: TextButton.styleFrom(
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: TextWidget(
                            text: "DD-MM-YYYY",
                            textSize: 14.0,
                            fontWeight: FontWeight.w500,
                            colorCode: blackColor)),
                  ],
                ),
                Divider(thickness: 1),
                SizedBox(height: 12),
                Row(
                  children: [
                    TextWidget(
                        text: "Order no.",
                        textSize: 14.0,
                        fontWeight: FontWeight.w600,
                        colorCode: blackColor),
                    SizedBox(
                        height: 15,
                        width: 28,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Divider(thickness: 1),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                        child: TextWidget(
                            text: "Status",
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
                            text: "Type",
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
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12),
        Stack(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height),
            Row(children: [
              Container(width: 320, child: CustomDrawer()),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      JobDetails(
                        title: "Job ID",
                        value: "1187077",
                      ),
                      JobDetails(
                        title: "Order ID",
                        value: "20801212",
                      ),
                      JobDetails(
                        title: "Job No.",
                        value: "THA1032577-1",
                      ),
                      JobDetails(
                        title: "Unit Ref",
                        value: "PHSS008557",
                      ),
                      JobDetails(
                        title: "Address",
                        value: "1 Ngarimu Rd PANMURE AUCKLAND 1072",
                      ),
                      JobDetails(
                        title: "Area",
                        value: "Tamaki",
                      ),
                      JobDetails(
                        title: "Redev",
                        value: "-",
                      ),
                      JobDetails(
                        title: "Contact",
                        value: "Miimetua Puti",
                      ),
                      JobDetails(
                        title: "Phone",
                        value: "02109037136",
                      ),
                      JobDetails(
                        title: "Invoice Date",
                        value: "05-05-2022",
                      ),
                      JobDetails(
                        title: "WIP Date",
                        value: "28-01-2022 12:48",
                      ),
                      JobDetails(
                        title: "Required Date",
                        value: "14-02-2022 12:48",
                      ),
                      JobDetails(
                        title: "Start / Finish",
                        value: "28-01-2022 / 14-02-2022",
                      ),
                      JobDetails(
                        title: "Priority",
                        value: "GNL",
                      ),
                      JobDetails(
                        title: "Class",
                        value: "Responsive",
                      ),
                      JobDetails(
                        title: "Assigned To",
                        value: "Diamond Homes Ltd.",
                      ),
                      JobDetails(
                        title: "Type",
                        value: "Trade.",
                      ),
                      JobDetails(
                        title: "Status",
                        value: "Completed",
                      ),
                      JobDetails(
                        title: "Order Description",
                        value:
                            "HLTHY - MJJ Woolly night shade tree to be removed. Garden shed is missing the backing wall please inspect and remedy. Diamond - Fence is missing a couple of pilings please attend and remedy. 0211128011",
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
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

class JobDetails extends StatelessWidget {
  final title;
  final value;

  const JobDetails({Key? key, this.title, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: TextWidget(
            text: title,
            textSize: 13.0,
            fontWeight: FontWeight.w600,
            colorCode: blackColor,
          )),
          Expanded(
              flex: 1,
              child: TextWidget(
                  text: value,
                  textSize: 14.0,
                  fontWeight: FontWeight.normal,
                  colorCode: blackColor)),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selected = 0;

  List tab = [
    {'title': "Information", "icon": icBrief},
    {'title': "Check", "icon": icCheckList},
    {'title': "Call", "icon": icCall},
    {'title': "Book", "icon": icBook},
    {'title': "Description", "icon": icDescription},
    {'title': "Time", "icon": icTime},
    {'title': "Calendar", "icon": icCalendar},
    {'title': "Folder", "icon": icFolder},
    {'title': "Address Card", "icon": icAddressCard},
    {'title': "People", "icon": icPeople},
    {'title': "Open Office", "icon": icOpenOffice},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: tab.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selected = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              margin: EdgeInsets.zero,
              color: _selected == index ? blueColor : whiteColor,
              elevation: _selected == index ? 8 : 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                            child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: ImageIcon(AssetImage(tab[index]["icon"]),
                                    color: _selected == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            SizedBox(width: 4),
                            _selected == index
                                ? TextWidget(
                                    text: tab[index]["title"],
                                    textSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    colorCode: _selected == index
                                        ? Colors.white
                                        : Colors.black)
                                : Container(),
                          ],
                        ))),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
