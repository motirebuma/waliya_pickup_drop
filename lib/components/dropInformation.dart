import 'package:flutter/material.dart';
import 'package:waliya_test/components/Info.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:provider/provider.dart';

class DropInformation {
  // drop
  Widget dropInformation(context, state) {
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
}
