import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliya_test/providers/data_provider.dart';

class ConfirmBox {
  Widget confirmBox(context) {
    // pickup details
    DateTime pickupDate = Provider.of<DataProvider>(context).data.pickDateTime;
    String pickupCountry = Provider.of<DataProvider>(context).data.pickCountry;
    String pickupLocation =
        Provider.of<DataProvider>(context).data.pickupLocation;
    // drop details
    DateTime dropDate = Provider.of<DataProvider>(context).data.dropDateTime;
    String dropCountry = Provider.of<DataProvider>(context).data.dropCountry;
    String dropLocation = Provider.of<DataProvider>(context).data.dropLocation;

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Informations',
              style: TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 20.0,
              ),
            ),
            pickupCountry.isNotEmpty
                ? Text('Pickup date: $pickupDate')
                : Text(''),
            pickupCountry.isNotEmpty
                ? Text('Pickup Country: $pickupCountry')
                : Text(''),
            pickupLocation.isNotEmpty
                ? Text('Pickup Location: $pickupLocation')
                : Text(''),
            dropCountry.isNotEmpty ? Text('Drop Date: $dropDate') : Text(''),
            dropCountry.isNotEmpty
                ? Text('Drop Country: $dropCountry')
                : Text(''),
            dropLocation.isNotEmpty
                ? Text('Drop Location: $dropLocation')
                : Text(''),
          ],
        ),
      ),
    );
  }
}
