import 'package:flutter/material.dart';

class ShowDialogWidget {
  Future showDialogWidget(context, title, message, void Function() onTapOK) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: onTapOK,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
