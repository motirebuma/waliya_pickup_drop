import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationSearch extends StatefulWidget {
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
        String title = location['title']; // Fetch the title from the API

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Location'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your location...',
                border: OutlineInputBorder(),
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
              print('Selected Location: $suggestion');
            },
          ),
        ));
  }
}


// class LocationSearch extends StatefulWidget {
//   @override
//   _LocationSearchState createState() => _LocationSearchState();
// }

// class _LocationSearchState extends State<LocationSearch> {
//   Set<String> _locations = Set<String>();
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController.addListener(_onInputChanged);
//   }

//   @override
//   void dispose() {
//     _textEditingController.dispose();
//     super.dispose();
//   }

//   Future<List<String>> _getLocationSuggestions(String query) async {
//     if (query.isEmpty) {
//       return []; // Return an empty list when the input is empty
//     }

//     List<String> filteredSuggestions = _locations
//         .where(
//             (location) => location.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     if (filteredSuggestions.isNotEmpty) {
//       return filteredSuggestions; // Return the filtered suggestions from the cache
//     }

//     String url = "http://amircreations.com/walya/get_all_places.php";
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body)['response'];
//       Set<String> cityNames = Set<String>();
//       for (var location in data) {
//         String cityName = location['city'];
//         if (cityName.isNotEmpty &&
//             cityName.toLowerCase().contains(query.toLowerCase())) {
//           cityNames.add(cityName);
//         }
//       }
//       _locations = cityNames; // Update the _locations Set
//       return cityNames.toList(); // Convert Set to List for suggestions
//     } else {
//       return [];
//     }
//   }

//   void _onInputChanged() {
//     setState(() {
//       // Don't reset suggestions when the input changes
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Pickup Location',
//           style: TextStyle(
//             color: Color(0xff1c1c1c),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TypeAheadFormField(
//           textFieldConfiguration: TextFieldConfiguration(
//             autofocus: true,
//             controller: _textEditingController,
//             decoration: InputDecoration(
//               hintText: 'Enter your location...',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           suggestionsCallback: (pattern) async {
//             return await _getLocationSuggestions(pattern);
//           },
//           itemBuilder: (context, suggestion) {
//             return ListTile(
//               title: Text(suggestion),
//             );
//           },
//           onSuggestionSelected: (suggestion) {
//             // Update the input value with the selected suggestion
//             _textEditingController.text = suggestion;
//             print('Selected Location: $suggestion');
//           },
//         ),
//       ),
//     );
//   }
// }
