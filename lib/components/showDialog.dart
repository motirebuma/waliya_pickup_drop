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
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
            ),
            child: const Text(
              'OK',
              style: TextStyle(color: Color(0xff1c1c1c)),
            ),
          ),
        ],
      ),
    );
  }
}
