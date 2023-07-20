import 'package:flutter/material.dart';
import 'package:waliya_test/screen/pickup_drop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waliya_Test',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Pickup_Drop_Screen(
        selectedPickupLocation: '',
        selectedDropLocation: '',
        pickupCountry: '',
        pickupDate: '',
        dropDate: '',
        dropCountry: '',
      ),
    );
  }
}
