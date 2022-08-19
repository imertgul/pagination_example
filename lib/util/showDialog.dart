import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String message, String title) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          okButton,
        ],
      );
    },
  );
}
