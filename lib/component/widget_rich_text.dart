import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../constant/constant_string.dart';

class RichTextWidget extends StatelessWidget {
  final TextAlign? textAlignment;
  final Alignment? alignment;
  final List<RichTextModel>? textSpanModel;

  const RichTextWidget({
    Key? key,
    this.textAlignment,
    this.alignment,
    this.textSpanModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.topLeft,
      child: RichText(
        textAlign: textAlignment ?? TextAlign.center,
        text: TextSpan(
            children: textSpanModel!.map((data) {
          return TextSpan(
            text: data.text,
            style: TextStyle(
                fontSize: data.fontSize,
                fontFamily: fontFamily,
                color: data.color,
                shadows: data.shadow,
                decoration: data.isLine! ? TextDecoration.underline : null,
                fontWeight: data.fontWeight),
            recognizer: TapGestureRecognizer()
              ..onTap = data.press as GestureTapCallback?,
            /*recognizer: new TapGestureRecognizer()..onTap = () {},*/
          );
        }).toList()),
      ),
    );
  }
}

class RichTextModel {
  String? _text;
  double? _fontSize;
  FontWeight? _fontWeight;
  Color? _color;
  bool? _isLine;
  List<Shadow>? _shadow;
  Function? _press;

  RichTextModel(String? text, double? fontSize, FontWeight? fontWeight,
      Color? color, bool? isLine,List<Shadow>? shadow, Function? press) {
    _text = text;
    _fontSize = fontSize;
    _fontWeight = fontWeight;
    _color = color;
    _isLine = isLine;
    _shadow = shadow;
    _press = press;
  }

  RichTextModel.fromJson(dynamic json) {
    _text = json['text'];
    _fontSize = json['font_size'];
    _fontWeight = json['font_weight'];
    _color = json['color'];
    _isLine = json['is_line'];
    _shadow = json['shadow'];
    _press = json['press'];
  }

  String? get text => _text;

  double? get fontSize => _fontSize;

  FontWeight? get fontWeight => _fontWeight;

  Color? get color => _color;

  bool? get isLine => _isLine;
  List<Shadow>? get shadow => _shadow;

  Function? get press => _press;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['font_size'] = _fontSize;
    map['font_weight'] = _fontWeight;
    map['color'] = _color;
    map['is_line'] = _isLine;
    map['shadow'] = _shadow;
    map['press'] = _press;
    return map;
  }
}
