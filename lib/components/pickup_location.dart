import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PickupLocation extends StatefulWidget {
  const PickupLocation({super.key});

  @override
  State<PickupLocation> createState() => _PickupLocationState();
}

class _PickupLocationState extends State<PickupLocation> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<List<String>> _getLocationSuggestions(String query) async {
    if (query.isEmpty) {
      return []; // Return an empty list when the input is empty
    }

    String url = "http://amircreations.com/walya/get_all_places.php";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['response'];
      Set<String> cityNames = Set<String>();
      for (var location in data) {
        String cityName = location['city'];
        if (cityName.isNotEmpty &&
            cityName.toLowerCase().contains(query.toLowerCase())) {
          cityNames.add(cityName);
        }
      }
      return cityNames.toList(); // Convert Set to List for suggestions
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: Builder(
            builder: (context) {
              return TypeAheadFormField(
                key: UniqueKey(), // Add a Key
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on),
                    labelText: 'Pickup Location',
                  ),
                ),
                suggestionsCallback: (pattern) async {
                  return await _getLocationSuggestions(pattern);
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {
                  // Update the input value with the selected suggestion
                  _textEditingController.text = suggestion;
                  print('Selected Pickup Location: $suggestion');
                },
              );
            },
          ),
        ),
        Container(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_city),
              labelText: 'Pickup specific location',
            ),
          ),
        )
      ],
    );
  }
}
