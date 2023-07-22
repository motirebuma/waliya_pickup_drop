import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/pickup_drop_page.dart';

class LocationSearch extends StatefulWidget {
  final String pick_or_drop_location;

  const LocationSearch({
    super.key,
    required this.pick_or_drop_location,
  });
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<List<String>> _getLocationSuggestions(String query) async {
    if (query.isEmpty) {
      // Return an empty list when the input is empty
      return [];
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
      return citySuggestions.toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Location'),
        centerTitle: true,
        elevation: 0,
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
                  String requestedField = '';
                  setState(() {
                    requestedField = widget.pick_or_drop_location;
                  });
                  if (requestedField == 'pickup') {
                    Provider.of<DataProvider>(context, listen: false)
                        .setPickupLocation(suggestion);
                  } else {
                    Provider.of<DataProvider>(context, listen: false)
                        .setDropLocation(suggestion);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PickupDropPage(),
                    ),
                  );
                },
                child: const Text('Select'),
              ),
            );
          },
          onSuggestionSelected: (suggestion) {},
        ),
      ),
    );
  }
}
