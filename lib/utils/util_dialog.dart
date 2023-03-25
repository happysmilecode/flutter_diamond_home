import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constant/constant_string.dart';

AlertDialog logoutDialog(context, onPress) {
  return AlertDialog(
    title: const Text(appName),
    content: Text("Are you sure want to logout"),
    actions: <Widget>[
      TextButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context); // Dismiss alert dialog
        },
      ),
      TextButton(
        onPressed: onPress,
        child: Text("Logout"),
      ),
    ],
  );
}

AlertDialog exitDialog(context) {
  return AlertDialog(
    title: const Text(appName),
    content: Text("Are you sure want to Exit"),
    actions: <Widget>[
      TextButton(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context); // Dismiss alert dialog
        },
      ),
      TextButton(
        child: Text("Exit"),
        onPressed: () {
          SystemNavigator.pop();
        },
      ),
    ],
  );
}
