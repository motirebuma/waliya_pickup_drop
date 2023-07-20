import 'package:flutter/material.dart';
import 'package:waliya_test/components/pickup_drop_switch.dart';
import 'package:waliya_test/screen/confirm_screen.dart';

class Pickup_Drop_Screen extends StatefulWidget {
  final String selectedPickupLocation;
  final String selectedDropLocation;
  final String pickupDate;
  final String pickupCountry;
  final String dropDate;
  final String dropCountry;

  const Pickup_Drop_Screen({
    super.key,
    required this.selectedPickupLocation,
    required this.selectedDropLocation,
    required this.pickupDate,
    required this.pickupCountry,
    required this.dropDate,
    required this.dropCountry,
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
      body: Column(
        children: [
          PickupDropSwitch(
            selectedPickupLocation: widget.selectedPickupLocation,
            selectedDropLocation: widget.selectedDropLocation,
            pickupCountry: widget.pickupCountry,
            pickupDate: widget.pickupDate,
            dropCountry: widget.dropCountry,
            dropDate: widget.dropDate,
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // pass nesessary parameters to ConfirmScreen()
                    builder: (context) => ConfirmScreen(
                      pickLocation: widget.selectedPickupLocation,
                      dropLocation: widget.selectedDropLocation,
                      pickCountry: widget.pickupCountry,
                      dropCountry: widget.dropCountry,
                      pickDateTime: widget.pickupDate,
                      dropDateTime: widget.dropDate,
                    ),
                  ),
                );
              },
              child: Text(
                'Next',
                style: const TextStyle(
                  color: Color(0xff1c1c1c),
                  fontSize: 20.0,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
              ),
            ),
          )
        ],
      ),
    );
  }
}
