import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PickupLocation extends StatefulWidget {
  const PickupLocation({super.key});

  @override
  State<PickupLocation> createState() => _PickupLocationState();
}

class _PickupLocationState extends State<PickupLocation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_on),
              labelText: 'Pickup Location',
            ),
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_city),
              labelText: 'Pickup specific location',
            ),
          ),
        )
      ],
    );
  }
}
