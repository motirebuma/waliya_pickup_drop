import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:waliya_test/screen/pickup_drop_page.dart';

class LocationSearch extends StatefulWidget {
  final String pick_or_drop_location;
  final String selectedPickupLocation;
  final String selectedDropLocation;
  final String pickupDate;
  final String pickupCountry;
  final String dropDate;
  final String dropCountry;

  LocationSearch({
    required this.pick_or_drop_location,
    required this.selectedPickupLocation,
    required this.selectedDropLocation,
    required this.pickupDate,
    required this.pickupCountry,
    required this.dropDate,
    required this.dropCountry,
  });
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
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
      Set<String> citySuggestions = Set<String>();
      for (var location in data) {
        String cityName = location['city'];
        String zone = location['zone'];
        String title = location['title'];

        // Perform null checks before creating the suggestion
        if (cityName != null &&
            cityName.toLowerCase().contains(query.toLowerCase())) {
          String suggestion = '$cityName | $zone | $title';
          citySuggestions.add(suggestion);
        }
      }
      return citySuggestions.toList(); // Convert Set to List for suggestions
    } else {
      return [];
    }
  }

  String? searchResultForPickup;
  String? searchResultForDrop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            autofocus: true,
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: 'City',
              border: OutlineInputBorder(),
            ),
          ),
          suggestionsCallback: (pattern) async {
            return await _getLocationSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
              trailing: ElevatedButton(
                onPressed: () {
                  // String _location = suggestion;
                  String _requestedField = '';
                  setState(() {
                    _requestedField = widget.pick_or_drop_location;
                  });

                  if (_requestedField == 'pickup') {
                    setState(() {
                      searchResultForPickup = suggestion;
                      searchResultForDrop = widget.selectedDropLocation;
                    });
                  } else {
                    setState(() {
                      searchResultForDrop = suggestion;
                      searchResultForPickup = widget.selectedPickupLocation;
                    });
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // pass nesessary parameters to ConfirmScreen()
                      builder: (context) => Pickup_Drop_Screen(
                        selectedPickupLocation: searchResultForPickup!,
                        selectedDropLocation: searchResultForDrop!,
                        pickupDate: widget.pickupDate,
                        pickupCountry: widget.pickupCountry,
                        dropDate: widget.dropDate,
                        dropCountry: widget.dropCountry,
                      ),
                    ),
                  );
                },
                child: Text('Select'),
              ),
            );
          },
          onSuggestionSelected:
              (suggestion) {}, // Added this line to fix the error
        ),
      ),
    );
    ;
  }
}
