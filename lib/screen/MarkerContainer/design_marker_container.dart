// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:ev_station/global.dart';

// import 'available_connectors.dart';

// class MarkerDesign extends StatelessWidget {
//   final String stationname;
//   final String stationaddress;
//   final double distance;
//   final double lat;
//   final double long;
//   const MarkerDesign({
//     Key? key,
//     required this.stationname,
//     required this.stationaddress,
//     required this.distance,
//     required this.lat,
//     required this.long,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: size.width * 0.01,
//           ),
//           Divider(
//             thickness: 3,
//             color: Colors.grey.shade400,
//             indent: size.width * 0.4,
//             endIndent: size.width * 0.4,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, top: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   child: Text(
//                     stationname,
//                     //"Tata Steel Ambagan Parking Jubliee Park gate Jamshedpur Charging Station",
//                     style: const TextStyle(
//                       fontSize: 17.0,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.09,
//                 ),
//                 Container(
//                   height: 20,
//                   width: 60,
//                   child: const Center(
//                     child: Text(
//                       "Public",
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Image.asset(
//                     "assets/images/aa.png",
//                     height: 30,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, top: 8.0),
//             child: Flexible(
//               child: Text(
//                 stationaddress,
//                 // "Ambagan, Sakchi, Jamshedpur",
//                 style: const TextStyle(
//                     color: Colors.grey, fontWeight: FontWeight.w500),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 10.0, top: 8.0),
//             height: 20,
//             width: 60,
//             child: const Center(
//               child: Text(
//                 "Open",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.green,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//           ),
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10.0,
//                   top: 12,
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       FontAwesomeIcons.locationDot,
//                       color: Colors.blue,
//                       size: 15,
//                     ),
//                     Text(
//                       distance.toString().substring(0, 4) + " km",
//                       style: TextStyle(
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: size.width * 0.15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 10.0,
//                   top: 12,
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(
//                       FontAwesomeIcons.solidClock,
//                       color: Colors.blue,
//                       size: 15,
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "12:00 am - 11:59 pm",
//                       style: TextStyle(
//                         color: Colors.grey.shade700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, top: 12, right: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Available Connectors",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       elevation: 0, primary: Colors.red),
//                   onPressed: () async {
//                     //getSomepoints();
//                     // PolylinePoints polylinePoints = PolylinePoints();
//                     // PolylineResult result =
//                     //     await polylinePoints.getRouteBetweenCoordinates(
//                     //   "AIzaSyDimVUJgnRHt3nQzzWJ7njreu8ngsmNVDw",
//                     //   PointLatLng(sharedPreferences!.getDouble("lat")!, sharedPreferences!.getDouble("long")!),
//                     //   PointLatLng(lat, long),
//                     // );
//                     // print(result.points);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: Container(
//                       height: 30,
//                       width: 80,
//                       decoration: BoxDecoration(
//                         // border: const Border(
//                         //   top: BorderSide(
//                         //     color: Colors.red,
//                         //   ),
//                         //   right: BorderSide(
//                         //     color: Colors.red,
//                         //   ),
//                         //   left: BorderSide(
//                         //     color: Colors.red,
//                         //   ),
//                         //   bottom: BorderSide(
//                         //     color: Colors.red,
//                         //   ),
//                         // ),
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           "Navigation",
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Container(
//                 //   height: 25,
//                 //   margin: const EdgeInsets.only(right: 10.0),
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(20.0),
//                 //     color: Colors.white,
//                 //     boxShadow: const [
//                 //       BoxShadow(color: Colors.green, spreadRadius: 2),
//                 //       // BoxShadow(color: Colors.yellow, spreadRadius: 5),
//                 //     ],
//                 //   ),
//                 //   child: Row(
//                 //     // mainAxisAlignment: MainAxisAlignment.start,
//                 //     // crossAxisAlignment: CrossAxisAlignment.start,
//                 //     // crossAxisAlignment: CrossAxisAlignment.end,
//                 //     mainAxisAlignment: MainAxisAlignment.start,
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     children: [
//                 //       const Center(
//                 //         child: Padding(
//                 //           padding: EdgeInsets.only(left: 8.0),
//                 //           child: Text("Navigate"),
//                 //         ),
//                 //       ),
//                 //       IconButton(
//                 //         onPressed: () {},
//                 //         icon: const Icon(
//                 //           Icons.navigation,
//                 //           size: 20,
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(width: 0.2,),
//               ],
//             ),
//           ),
//           Row(
//             children: const [
//               DesignConnectors(),
//             ],
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               height: 40,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.amber,
//               ),
//               child: const Center(
//                 child: Text(
//                   "Close",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24.0,
//                     fontFamily: "VarelaRound",
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
