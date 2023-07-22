import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliya_test/providers/data_provider.dart';

class ConfirmBox {
  Widget confirmBox(context) {
    final data = Provider.of<DataProvider>(context).data;

    // Method to check if a field is not empty
    bool isNotEmpty(String value) => value.isNotEmpty;

    const textStyle = TextStyle(
      color: Color(0xff1c1c1c),
      fontSize: 16,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Information',
              style: TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // if (isNotEmpty(data.pickCountry))
            //   Text('Pickup Date: ${data.pickDateTime}', style: textStyle),
            if (isNotEmpty(data.pickCountry))
              Text(
                  'Pickup Date: ${data.pickDateTime.day}/${data.pickDateTime.month}/${data.pickDateTime.year}',
                  style: textStyle),

            if (isNotEmpty(data.pickCountry))
              Text('Pickup Country: ${data.pickCountry}', style: textStyle),
            if (isNotEmpty(data.pickupLocation))
              Text('Pickup Location: ${data.pickupLocation}', style: textStyle),
            const SizedBox(height: 10),

            // if (isNotEmpty(data.dropCountry))
            //   Text('Drop Date: ${data.dropDateTime}', style: textStyle),
            if (isNotEmpty(data.pickCountry))
              Text(
                  'Pickup Date: ${data.dropDateTime.day}/${data.dropDateTime.month}/${data.dropDateTime.year}',
                  style: textStyle),
            if (isNotEmpty(data.dropCountry))
              Text('Drop Country: ${data.dropCountry}', style: textStyle),
            if (isNotEmpty(data.dropLocation))
              Text('Drop Location: ${data.dropLocation}', style: textStyle),
          ],
        ),
      ),
    );
  }
}
