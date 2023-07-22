import 'package:flutter/material.dart';
import 'package:waliya_test/components/pickup_drop_switch.dart';
import 'package:waliya_test/components/showDialog.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/confirm_screen.dart';
import 'package:provider/provider.dart';

class Pickup_Drop_Screen extends StatefulWidget {
  const Pickup_Drop_Screen({
    super.key,
  });

  @override
  State<Pickup_Drop_Screen> createState() => _Pickup_Drop_ScreenState();
}

class _Pickup_Drop_ScreenState extends State<Pickup_Drop_Screen> {
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
                  PickupDropSwitch(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (Provider.of<DataProvider>(context, listen: false)
                                .data
                                .pickCountry
                                .isEmpty &&
                            Provider.of<DataProvider>(context, listen: false)
                                .data
                                .dropCountry
                                .isEmpty) {
                          ShowDialogWidget().showDialogWidget(
                              context,
                              'Error',
                              'Please select pickup/drop location.',
                              () => Navigator.pop(context));
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmScreen(),
                            ),
                          );
                        }
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
