import 'package:flutter/material.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/pickup_drop_page.dart';
import 'package:provider/provider.dart';

void main() {
  // Provider
  runApp(ChangeNotifierProvider(
    create: (_) => DataProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Waliya',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const PickupDropPage(),
    );
  }
}
