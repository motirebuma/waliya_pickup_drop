import 'package:flutter/material.dart';
import 'package:waliya_test/models/data_model.dart';

class DataProvider extends ChangeNotifier {
  final Data _data = Data();

  Data get data => _data;

  void setPickDateTime(DateTime dateTime) {
    _data.pickDateTime = dateTime;
    notifyListeners();
  }

  void setPickCountry(String country) {
    _data.pickCountry = country;
    notifyListeners();
  }

  void setPickupLocation(String location) {
    _data.pickupLocation = location;
    notifyListeners();
  }

  void setDropDateTime(DateTime dateTime) {
    _data.dropDateTime = dateTime;
    notifyListeners();
  }

  void setDropCountry(String country) {
    _data.dropCountry = country;
    notifyListeners();
  }

  void setDropLocation(String location) {
    _data.dropLocation = location;
    notifyListeners();
  }
}
