import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  final String pickDateTime;
  final String pickCountry;
  final String pickLocation;

  final String dropDateTime;
  final String dropCountry;
  final String dropLocation;

  const ConfirmScreen({
    Key? key,
    required this.pickDateTime,
    required this.pickCountry,
    required this.pickLocation,
    required this.dropDateTime,
    required this.dropCountry,
    required this.dropLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Confirm Screen'),
      ),
      body: Column(
        children: [
          Text('Pickup Date: $pickDateTime'),
          Text('Pickup Country: $pickCountry'),
          Text('Pickup Location: $pickLocation'),
          Text('Drop Date: $dropDateTime'),
          Text('Drop Country: $dropCountry'),
          Text('Drop Location: $dropLocation'),
          // Add any other information you want to display on the confirmation screen
        ],
      ),
    );
  }
}
