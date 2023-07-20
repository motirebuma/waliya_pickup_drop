import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:waliya_test/components/Info.dart';

class PickupDropSwitch extends StatefulWidget {
  final String selectedPickupLocation;
  final String selectedDropLocation;
  final String pickupDate;
  final String dropDate;
  final String pickupCountry;
  final String dropCountry;

  const PickupDropSwitch({
    super.key,
    required this.selectedPickupLocation,
    required this.selectedDropLocation,
    required this.dropCountry,
    required this.dropDate,
    required this.pickupCountry,
    required this.pickupDate,
  });

  @override
  State<PickupDropSwitch> createState() => _PickupDropSwitchState();
}

class _PickupDropSwitchState extends State<PickupDropSwitch> {
  bool isPickupSelected = true;
  bool isDropSelected = true;
  String _selectedPickupLocation = '';
  String _selectedDropLocation = '';

  Widget pickupInformation(state) {
    setState(() {
      _selectedPickupLocation = widget.selectedPickupLocation;
    });
    if (state) {
      return InfoPickDrop(
        title: 'Pickup Information',
        pickDropDate: 'Pickup Date',
        pickDropCountry: 'Pickup Country',
        pickDropLocation: _selectedPickupLocation.isNotEmpty
            ? _selectedPickupLocation
            : 'Pickup Location',
        pickOrDrop: 'pickup',
        selectedPickupLocation: widget.selectedPickupLocation,
        selectedDropLocation: widget.selectedDropLocation,
        pickupCountry: widget.pickupCountry,
        pickupDate: widget.pickupDate,
        dropCountry: widget.dropCountry,
        dropDate: widget.dropDate,
      );
    } else {
      return const Text('Pickup location is not selected');
    }
  }

  // drop
  Widget dropInformation(state) {
    setState(() {
      _selectedDropLocation = widget.selectedDropLocation;
    });
    if (state) {
      return InfoPickDrop(
        title: 'Drop Information',
        pickDropDate: 'Drop Date',
        pickDropCountry: 'Drop Country',
        pickDropLocation: _selectedDropLocation.isNotEmpty
            ? _selectedDropLocation
            : 'Drop Location',
        pickOrDrop: 'drop',
        selectedPickupLocation: widget.selectedPickupLocation,
        selectedDropLocation: widget.selectedDropLocation,
        pickupCountry: widget.pickupCountry,
        pickupDate: widget.pickupDate,
        dropCountry: widget.dropCountry,
        dropDate: widget.dropDate,
      );
    } else {
      return const Text('Drop location is not selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
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
                    // activeTrackColor: Colors.teal.shade300,
                    // activeThumbColor: Colors.tealAccent,
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

        //
      ],
    );
  }
}
