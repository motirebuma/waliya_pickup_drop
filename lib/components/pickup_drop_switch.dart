import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:waliya_test/components/Info.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:provider/provider.dart';

class PickupDropSwitch extends StatefulWidget {
  const PickupDropSwitch({super.key});

  @override
  State<PickupDropSwitch> createState() => _PickupDropSwitchState();
}

class _PickupDropSwitchState extends State<PickupDropSwitch> {
  bool isPickupSelected = true;
  bool isDropSelected = true;

  Widget pickupInformation(state) {
    if (state) {
      return InfoPickDrop(
        title: 'Pickup Information',
        pickDropDate: 'Pickup Date',
        pickDropCountry: 'Pickup Country',
        pickDropLocation: Provider.of<DataProvider>(context, listen: false)
                .data
                .pickupLocation
                .isNotEmpty
            ? Provider.of<DataProvider>(context, listen: false)
                .data
                .pickupLocation
            : 'Pickup Location',
        pickOrDrop: 'pickup',
      );
    } else {
      Provider.of<DataProvider>(context, listen: false).setPickCountry('');
      Provider.of<DataProvider>(context, listen: false).setPickupLocation('');

      return const Text('Pickup location is not selected');
    }
  }

  // drop
  Widget dropInformation(state) {
    if (state) {
      return InfoPickDrop(
        title: 'Drop Information',
        pickDropDate: 'Drop Date',
        pickDropCountry: 'Drop Country',
        pickDropLocation: Provider.of<DataProvider>(context, listen: false)
                .data
                .dropLocation
                .isNotEmpty
            ? Provider.of<DataProvider>(context, listen: false)
                .data
                .dropLocation
            : 'Drop Location',
        pickOrDrop: 'drop',
      );
    } else {
      Provider.of<DataProvider>(context, listen: false).setDropLocation('');
      Provider.of<DataProvider>(context, listen: false).setDropCountry('');
      return const Text('Drop location is not selected');
    }
  }

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
                  style: NeumorphicSwitchStyle(
                    activeTrackColor: Colors.amber.shade200,
                    activeThumbColor: Colors.amberAccent,
                    inactiveTrackColor: Colors.grey.shade300,
                    inactiveThumbColor: Colors.grey.shade100,
                  ),
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
                  style: NeumorphicSwitchStyle(
                    activeTrackColor: Colors.amber.shade200,
                    activeThumbColor: Colors.amberAccent,
                    inactiveTrackColor: Colors.grey.shade300,
                    inactiveThumbColor: Colors.grey.shade100,
                  ),
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
        // widget pickup information
        pickupInformation(isPickupSelected),
        // widget drop information
        dropInformation(isDropSelected),
      ],
    );
  }
}
