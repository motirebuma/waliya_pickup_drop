import 'package:flutter/material.dart';
import 'package:waliya_test/components/ConfimBox.dart';
import 'package:waliya_test/components/showDialog.dart';
import 'package:waliya_test/screen/pickup_drop_page.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Confirm Information'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // confirm widget
          ConfirmBox().confirmBox(context),

          // confirm button
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ShowDialogWidget().showDialogWidget(
                  context,
                  'Success',
                  'Data sent successfully',
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Pickup_Drop_Screen(),
                      ),
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  color: Color(0xff1c1c1c),
                  fontSize: 20.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
