import 'package:flutter/material.dart';
import 'package:waliya_test/components/Info.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:provider/provider.dart';

class PickupInformation {
  Widget pickupInformation(context, state) {
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
}
