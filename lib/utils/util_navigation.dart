
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
}

pushReplacementScreen(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => widget));
}

pushScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

pushAndRemoveUntilScreen(BuildContext context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

Future pushScreenWithValue(BuildContext context, Widget widget) async {
  var result = await Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => widget));
  return result;
}