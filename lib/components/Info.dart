import 'package:flutter/material.dart';
import 'package:waliya_test/components/LocationCard.dart';
import 'package:waliya_test/components/LocationSearch.dart';

class InfoPickDrop extends StatefulWidget {
  final String type;
  final String dateType;
  final String countryType;
  final String locType;

  // const DorpInformation({super.key});
  const InfoPickDrop(
      {super.key,
      required this.type,
      required this.dateType,
      required this.countryType,
      required this.locType});
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
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget dropLocation(country) {
    if (country == 'Ethiopia 🇪🇹') {
      return LocationBox().locationBox(
        widget.locType,
        () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationSearch(),
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
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.type,
              style: const TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 20.0,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.dateType,
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
                  widget.countryType,
                  style: const TextStyle(
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
            dropLocation(selectedCountry),
          ],
        ),
      ),
    );
  }
}
