import 'package:flutter/material.dart';
import 'package:waliya_test/components/showDialog.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/confirm_page.dart';
import 'package:provider/provider.dart';

class Validator {
  infoValidator(context) {
    if (Provider.of<DataProvider>(context, listen: false)
            .data
            .pickCountry
            .isEmpty &&
        Provider.of<DataProvider>(context, listen: false)
            .data
            .dropCountry
            .isEmpty) {
      ShowDialogWidget().showDialogWidget(context, '⚠️ oops',
          'Please select pickup/drop location.', () => Navigator.pop(context));
    } else if (Provider.of<DataProvider>(context, listen: false)
                .data
                .pickCountry ==
            'Ethiopia 🇪🇹' &&
        Provider.of<DataProvider>(context, listen: false)
            .data
            .pickupLocation
            .isEmpty) {
      ShowDialogWidget().showDialogWidget(context, '⚠️ oops',
          'Select pickup location', () => Navigator.pop(context));
    } else if (Provider.of<DataProvider>(context, listen: false)
                .data
                .dropCountry ==
            'Ethiopia 🇪🇹' &&
        Provider.of<DataProvider>(context, listen: false)
            .data
            .dropLocation
            .isEmpty) {
      ShowDialogWidget().showDialogWidget(context, '⚠️ oops',
          'Select drop location', () => Navigator.pop(context));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConfirmScreen(),
        ),
      );
    }
  }
}
