import 'package:flutter/material.dart';
import 'package:waliya_test/components/pickup_drop_switch.dart';

class Pickup_Drop_Screen extends StatefulWidget {
  const Pickup_Drop_Screen({super.key});

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
      body: Column(
        children: const [
          PickupDropSwitch(),
        ],
      ),
    );
  }
}
