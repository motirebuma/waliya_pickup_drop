import 'package:flutter/material.dart';
import 'package:waliya_test/components/pickupDropPageCustomizer.dart';
import 'package:waliya_test/components/WidgetNotSelected.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:provider/provider.dart';

class PickupInformation {
  Widget pickupInformation(context, state) {
    if (state) {
      return PD_PageCustomizer(
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

      return WidgetNotSelected()
          .notSelected('⚠️ Pickup location is not selected');
    }
  }
}
