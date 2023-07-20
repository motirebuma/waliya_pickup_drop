import 'package:flutter/material.dart';

class LocationBox {
  Widget locationBox(String location, void Function() onTapLocation) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapLocation,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 25.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xff1c1c1c),
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
