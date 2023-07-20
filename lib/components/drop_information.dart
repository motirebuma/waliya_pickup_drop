import 'package:flutter/material.dart';
import 'package:waliya_test/components/LocationCard.dart';
import 'package:waliya_test/components/LocationSearch.dart';
import 'package:waliya_test/components/pickup_location.dart';

class DorpInformation extends StatefulWidget {
  const DorpInformation({super.key});

  @override
  State<DorpInformation> createState() => _DorpInformationState();
}

class _DorpInformationState extends State<DorpInformation> {
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
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 10),
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
            // !this will be edited!
            const Text(
              'Drop Information',
              style: TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 20.0,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Drop date',
                  style: TextStyle(
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
                const Text(
                  'Drop Country',
                  style: TextStyle(
                    color: Color(0xff1c1c1c),
                    fontSize: 16.0,
                  ),
                ),
                // ! this will be change to button
                DropdownButton<String>(
                  value: selectedCountry,
                  // isExpanded: true,
                  items: <String>[
                    'Ethiopia 🇪🇹',
                    'Ertrea 🇪🇷',
                    'Djibouti 🇩🇯',
                    'Kenya 🇰🇪',
                    'Sudan 🇸🇩',
                    'South Sudan 🇸🇸',
                    'Somalia 🇸🇴'
                  ].map<DropdownMenuItem<String>>((String value) {
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
            LocationBox().locationBox(
              'Drop Location',
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationSearch(),
                  ),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
