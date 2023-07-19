import 'package:flutter/material.dart';
import 'package:waliya_test/components/drop_information.dart';
import 'package:waliya_test/components/pickup_drop_check_box.dart';
import 'package:waliya_test/components/pickup_drop_switch.dart';
import 'package:waliya_test/components/pickup_information.dart';
import 'package:waliya_test/components/pickup_location.dart';

class Pickup_Drop_Screen extends StatefulWidget {
  const Pickup_Drop_Screen({super.key});

  @override
  State<Pickup_Drop_Screen> createState() => _Pickup_Drop_ScreenState();
}

class _Pickup_Drop_ScreenState extends State<Pickup_Drop_Screen> {
  // Widget switchCheck() {
  //   if(){
  //     return Text('Its on');
  //   }
  //   else{
  //     return Text('Its off');
  //   }
  // }
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
        centerTitle: true,
      ),
      body: Column(
        children: const [
          // PickupDropCheckbox(),
          PickupDropSwitch(),
          PickupInfo(),
          DorpInformation(),
        ],
      ),
    );
  }
}
