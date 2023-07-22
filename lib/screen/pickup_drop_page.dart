import 'package:flutter/material.dart';
import 'package:waliya_test/components/infoValidator.dart';
import 'package:waliya_test/components/pickupDropController.dart';
import 'package:waliya_test/components/showDialog.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/confirm_page.dart';
import 'package:provider/provider.dart';

class PickupDropPage extends StatefulWidget {
  const PickupDropPage({
    super.key,
  });

  @override
  State<PickupDropPage> createState() => _PickupDropPageState();
}

class _PickupDropPageState extends State<PickupDropPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pickup/Drop',
          style: TextStyle(
            color: Color(0xff1c1c1c),
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
              ),
              child: Column(
                children: [
                  // widget
                  const PickupDropController(),

                  // Next button
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // from class Validator
                        Validator().infoValidator(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.amber),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Color(0xff1c1c1c),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
