import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliya_test/providers/data_provider.dart';

class ConfirmBox {
  Widget confirmBox(context) {
    final data = Provider.of<DataProvider>(context).data;

    // Method to check if a field is not empty
    bool isNotEmpty(String value) => value.isNotEmpty;

    final textStyle = TextStyle(
      color: Color(0xff1c1c1c),
      fontSize: 16,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Information',
              style: TextStyle(
                color: Color(0xff1c1c1c),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            if (isNotEmpty(data.pickCountry))
              Text('Pickup Date: ${data.pickDateTime}', style: textStyle),
            if (isNotEmpty(data.pickCountry))
              Text('Pickup Country: ${data.pickCountry}', style: textStyle),
            if (isNotEmpty(data.pickupLocation))
              Text('Pickup Location: ${data.pickupLocation}', style: textStyle),
            SizedBox(height: 10),
            if (isNotEmpty(data.dropCountry))
              Text('Drop Date: ${data.dropDateTime}', style: textStyle),
            if (isNotEmpty(data.dropCountry))
              Text('Drop Country: ${data.dropCountry}', style: textStyle),
            if (isNotEmpty(data.dropLocation))
              Text('Drop Location: ${data.dropLocation}', style: textStyle),
          ],
        ),
      ),
    );
  }
}


// class ConfirmBox {
//   Widget confirmBox(context) {
//     // pickup details
//     DateTime pickupDate = Provider.of<DataProvider>(context).data.pickDateTime;
//     String pickupCountry = Provider.of<DataProvider>(context).data.pickCountry;
//     String pickupLocation =
//         Provider.of<DataProvider>(context).data.pickupLocation;
//     // drop details
//     DateTime dropDate = Provider.of<DataProvider>(context).data.dropDateTime;
//     String dropCountry = Provider.of<DataProvider>(context).data.dropCountry;
//     String dropLocation = Provider.of<DataProvider>(context).data.dropLocation;

//     return Padding(
//       padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0, 3),
//               blurRadius: 4,
//             ),
//           ],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             const Text(
//               'Informations',
//               style: TextStyle(
//                 color: Color(0xff1c1c1c),
//                 fontSize: 20.0,
//               ),
//             ),
//             pickupCountry.isNotEmpty
//                 ? Text('Pickup date: $pickupDate')
//                 : Text(''),
//             pickupCountry.isNotEmpty
//                 ? Text('Pickup Country: $pickupCountry')
//                 : Text(''),
//             pickupLocation.isNotEmpty
//                 ? Text('Pickup Location: $pickupLocation')
//                 : Text(''),
//             dropCountry.isNotEmpty ? Text('Drop Date: $dropDate') : Text(''),
//             dropCountry.isNotEmpty
//                 ? Text('Drop Country: $dropCountry')
//                 : Text(''),
//             dropLocation.isNotEmpty
//                 ? Text('Drop Location: $dropLocation')
//                 : Text(''),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class ConfirmBox {
//   Widget confirmBox(context) {
//     final data = Provider.of<DataProvider>(context).data;

//     // Method to check if a field is not empty
//     bool isNotEmpty(String value) => value.isNotEmpty;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.grey,
//               offset: Offset(0, 3),
//               blurRadius: 4,
//             ),
//           ],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
//             const Text(
//               'Informations',
//               style: TextStyle(
//                 color: Color(0xff1c1c1c),
//                 fontSize: 20.0,
//               ),
//             ),
//             const SizedBox(height: 10),
//             if (isNotEmpty(data.pickCountry))
//               Text('Pickup date: ${data.pickDateTime}'),
//             if (isNotEmpty(data.pickCountry))
//               Text('Pickup Country: ${data.pickCountry}'),
//             if (isNotEmpty(data.pickupLocation))
//               Text('Pickup Location: ${data.pickupLocation}'),
//             if (isNotEmpty(data.dropCountry))
//               Text('Drop Date: ${data.dropDateTime}'),
//             if (isNotEmpty(data.dropCountry))
//               Text('Drop Country: ${data.dropCountry}'),
//             if (isNotEmpty(data.dropLocation))
//               Text('Drop Location: ${data.dropLocation}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
