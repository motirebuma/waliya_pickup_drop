import 'package:flutter/material.dart';

class PickupDropCheckbox extends StatefulWidget {
  const PickupDropCheckbox({super.key});

  @override
  State<PickupDropCheckbox> createState() => _PickupDropCheckboxState();
}

class _PickupDropCheckboxState extends State<PickupDropCheckbox> {
  bool isPickupSelected = false;
  bool isDropSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isPickupSelected,
              onChanged: (bool? newValue) {
                setState(() {
                  isPickupSelected = newValue ?? false;
                });
              },
            ),
            Text('Pickup'),
            SizedBox(width: 40),
            Checkbox(
              value: isDropSelected,
              onChanged: (bool? newValue) {
                setState(() {
                  isDropSelected = newValue ?? false;
                });
              },
            ),
            Text('Drop'),
          ],
        ),
      ),
    );
  }
}
