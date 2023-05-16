import 'package:flutter/material.dart';

Future errorDialog({
  required BuildContext context,
  String? message,
  // ignore: non_constant_identifier_names
  String? ButtonText,
}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Text(message!),
      scrollable: true,
      title: const Text(
        "Error.",
        style: TextStyle(
          color: const Color(0xFF63CBC4),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            ButtonText ?? "Okay",
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    ),
  );
}
