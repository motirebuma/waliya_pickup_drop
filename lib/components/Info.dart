import 'package:flutter/material.dart';
import 'package:waliya_test/components/LocationCard.dart';
import 'package:waliya_test/providers/data_provider.dart';
import 'package:waliya_test/screen/loc_search_screen.dart';
import 'package:provider/provider.dart';

class InfoPickDrop extends StatefulWidget {
  final String title;
  final String pickDropDate;
  final String pickDropCountry;
  final String pickDropLocation;
  final String pickOrDrop;
  const InfoPickDrop({
    super.key,
    required this.title,
    required this.pickDropDate,
    required this.pickDropCountry,
    required this.pickDropLocation,
    required this.pickOrDrop,
  });
  @override
  State<InfoPickDrop> createState() => _InfoPickDropState();
}

class _InfoPickDropState extends State<InfoPickDrop> {
  DateTime initial = DateTime.now();
  DateTime last = DateTime.now();

  // dropdown country
  String selectedCountry = 'Ethiopia 🇪🇹';
  // day picker
  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      if (widget.pickOrDrop == 'pickup') {
        Provider.of<DataProvider>(context, listen: false)
            .setPickDateTime(picked);
      } else {
        Provider.of<DataProvider>(context, listen: false)
            .setDropDateTime(picked);
      }
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // pickup loacation || drop location
  Widget location(country) {
    String pickdropValue = '';

    if (country == 'Ethiopia 🇪🇹') {
      setState(() {
        pickdropValue = widget.pickDropLocation;
      });
      return LocationBox().locationBox(
        pickdropValue,
        () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  LocationSearch(pick_or_drop_location: widget.pickOrDrop),
            ),
          ),
        },
      );
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 4,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.pickDropDate,
                  style: const TextStyle(
                    color: Color(0xff1c1c1c),
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  style: const TextStyle(
                    color: Color(0xff1c1c1c),
                    fontSize: 16.0,
                  ),
                ),
                IconButton(
                  onPressed: () => _selectDate(context),
                  icon: Icon(
                    Icons.calendar_month,
                    color: Colors.amber.shade700,
                  ),
                  tooltip: 'Select Date',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.pickDropCountry,
                  style: const TextStyle(
                    color: Color(0xff1c1c1c),
                    fontSize: 16.0,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedCountry,
                  items: <String>[
                    'Ethiopia 🇪🇹',
                    'Ertrea 🇪🇷',
                    'Djibouti 🇩🇯',
                    'Kenya 🇰🇪',
                    'Sudan 🇸🇩',
                    'South Sudan 🇸🇸',
                    'Somalia 🇸🇴'
                  ].map<DropdownMenuItem<String>>((String value) {
                    if (widget.pickOrDrop == 'pickup') {
                      Provider.of<DataProvider>(context, listen: false)
                          .setPickCountry(selectedCountry);
                    } else {
                      Provider.of<DataProvider>(context, listen: false)
                          .setDropCountry(selectedCountry);
                    }
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          // color: Colors.amber,
                          color: Color(0xff1c1c1c),
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry = newValue!;
                      // print(selectedCountry);
                    });
                  },
                ),
              ],
            ),
            // PickupLocation(),
            location(selectedCountry),
          ],
        ),
      ),
    );
  }
}
