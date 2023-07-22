import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:waliya_test/components/dropInformation.dart';
import 'package:waliya_test/components/pickupInformation.dart';
import 'package:provider/provider.dart';

class PickupDropSwitch extends StatefulWidget {
  const PickupDropSwitch({super.key});

  @override
  State<PickupDropSwitch> createState() => _PickupDropSwitchState();
}

class _PickupDropSwitchState extends State<PickupDropSwitch> {
  bool isPickupSelected = true;
  bool isDropSelected = true;

  final neumorphicSwitchStyle = NeumorphicSwitchStyle(
    activeTrackColor: Colors.amber.shade200,
    activeThumbColor: Colors.amberAccent,
    inactiveTrackColor: Colors.grey.shade300,
    inactiveThumbColor: Colors.grey.shade100,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 3),
                  blurRadius: 4,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicSwitch(
                  value: isPickupSelected,
                  onChanged: (bool newValue) {
                    setState(() {
                      isPickupSelected = newValue;
                    });
                  },
                  style: neumorphicSwitchStyle,
                ),
                const SizedBox(width: 15),
                Text(
                  'Pickup',
                  style: TextStyle(
                    color:
                        isPickupSelected ? Colors.amber : Colors.grey.shade700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 40),
                NeumorphicSwitch(
                  value: isDropSelected,
                  onChanged: (bool newValue) {
                    setState(() {
                      isDropSelected = newValue;
                    });
                  },
                  style: neumorphicSwitchStyle,
                ),
                const SizedBox(width: 15),
                Text(
                  'Drop',
                  style: TextStyle(
                    color: isDropSelected ? Colors.amber : Colors.grey.shade700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
        // pickup information widget
        PickupInformation().pickupInformation(context, isPickupSelected),
        // Dropinformation widget
        DropInformation().dropInformation(context, isDropSelected),
      ],
    );
  }
}
