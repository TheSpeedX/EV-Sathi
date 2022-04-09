// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as https;
import 'dart:convert';

import '../global.dart';
import '../models/nearby_ev_station_results.dart';
import 'MarkerContainer/available_connectors.dart';
import 'constant/map_key.dart';

//TODOS: last start
// double a = sharedPreferences!.getDouble("lat") ?? 20.5937;
// double b = sharedPreferences!.getDouble("long") ?? 78.9629;
// final LatLng sourceLatitue = LatLng(a, b);

// Future<bool> getLocation =  sharedPreferences!.setDouble("lat", currentLocation.latitude);

//TODOS: last start

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  BitmapDescriptor? descriptor;
  void getDestinationIcon() async {
    descriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3.0), "assets/images/loc.png");
  }

  List<NearbyEVStationResults> nearevstationresult = [];
  late List<LatLng> routeCoords = [];
  final Set<Polyline> polyline = {};
  GoogleMapPolyline googleMapPolyline =
      GoogleMapPolyline(apiKey: MapKey.apiKey);

  // get http => null;

  getSomepoints(double desLat, double desLong) async {
    routeCoords = (await googleMapPolyline.getCoordinatesWithLocation(
      // haredPreferences!.getDouble("lat")!,
      //             sharedPreferences!.getDouble("long")!,
      origin: LatLng(sharedPreferences!.getDouble("lat")!,
          sharedPreferences!.getDouble("long")!),
      destination: LatLng(desLat, desLong),
      mode: RouteMode.driving,
    ))!;
    // 22.7855319, 86.2833178,
    setState(() {
      polyline.add(
        Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoords,
          width: 5,
          color: Color.fromARGB(255, 243, 142, 33),
          startCap: Cap.roundCap,
          endCap: Cap.buttCap,
        ),
      );
    });
    // print(routeCoords);
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  var clients = [];
  List<Marker> allMarkers = [];
  bool mapToggle = false;
  double toppading = 350;
  double bottomPadding = 300;
  late GoogleMapController mapController;
  var currentLocation;

  requestPermission() async {
    // ignore: avoid_print
    print("Asking Permission");
    await [
      Permission.location,
    ].request();
    await chekForPermission();
  }

  chekForPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      // ignore: avoid_print
      print("Got Permission from User");
      if (sharedPreferences!.getDouble("lat") != null ||
          sharedPreferences!.getDouble("long") != null) {
        // ignore: avoid_print
        print("Location is not null must have location with me");
        print(sharedPreferences!.getDouble("lat"));
        print(sharedPreferences!.getDouble("long"));
        print("saved location calling nearby");
        populateClients();
        // getSomepoints();
        setState(() {
          mapToggle = true;
          // populateClients();
        });
      } else {
        getLocation();

        //populateClients();
        //populateClients();
        // ignore: avoid_print
        print("Calling get location");
      }
    }
    //TODOS :HANDLE PERMISSION
  }

  void initMarkerr(
      double? lat, double? long, specifyId, String? name, String? address) {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(lat ?? 0, long ?? 0),
      infoWindow: InfoWindow(
        title: name ?? "Name will be upated",
        snippet: address ?? "No address found",
      ),
      onTap: () {
        //TODOS: 1. SHOW ONE BOTTOM SHEET CONTAINER CONTAINIG IMAGE,DURATION DISTANCE, ADDRESS. TWO BUTTON CANCEL, START NAVIGATION.
        // print(specify['lat']);
        // print(specify['long']);

        var distance = Geolocator.distanceBetween(
          lat!,
          long!,
          sharedPreferences!.getDouble("lat")!,
          sharedPreferences!.getDouble("long")!,
        );

        //TODOS : THINGS TO SEND TO MARKER DESIGN.
        //TODOS : Fetch this details before sending to marker design.
        //TODOS : 1. NAME, ADDRESS , OPEN/CLOSED STATUS, DISTANCE, TIMMING , NUMBER
        //TODOS : 2. TYPES OF CHARGER
        //TODOS : 3. TWO BUTTONS CALLBACK --> CANCEL & NAVIGATION
        //TODOS : 4. MORE CAN BE SEND AS PER YOU WANT..
        //TODOS : 4. MARKER DESIGN WILL BUILD THAT FOR US.
        showModalBottomSheet(
            backgroundColor: Colors.white,
            enableDrag: true,
            isDismissible: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            )),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.4,
                child: markerrDesign(
                  stationname: name ?? "No Name Found",
                  stationaddress: address ?? "No Address Found",
                  distance: distance / 1000,
                  lat: lat,
                  long: long,
                ),
              );
            });
      },
    );
    setState(() {
      markers[markerId] = marker;
    });
    // ignore: avoid_print
    // print(specify['lat']);
    // // ignore: avoid_print
    // print(specify['long']);
  }

  showMarker() {
    for (int i = 0; i < nearevstationresult.length; i++) {
      initMarkerr(
        nearevstationresult[i].geometry!.location!.lat,
        nearevstationresult[i].geometry!.location!.lng,
        i.toString(),
        nearevstationresult[i].name,
        nearevstationresult[i].vicinity,
      );
    }
  }

  populateClients() async {
    // clients = [];
    // await FirebaseFirestore.instance
    //     .collection("Map-landmarks")
    //     .get()
    //     .then((snap) {
    //   if (snap.docs.isNotEmpty) {
    //     for (int i = 0; i < snap.docs.length; i++) {
    //       // clients.add(docs.docs[i].data());
    //       //print("Hey");
    //       //initMarker(docs.docs[i].data());

    //       initMarkerr(snap.docs[i].data(), snap.docs[i].id);
    //     }
    //   }
    // });
    print("calling get Nearby---->");
    await getNearby(sharedPreferences!.getDouble("long")!,
        sharedPreferences!.getDouble("lat")!);
  }

  Future<List<NearbyEVStationResults>> getNearby(
      double longitude, double latitude) async {
    print("Hi Nearby");
    var response = await https.get(
      Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=30000&type=electric_vehicle_charging_station&keyword=electric_vehicle_charging_station&key=${MapKey.apiKey}",
      ),
    );
    //var body = jsonDecode(response.body);
    //print(body);
    var values = jsonDecode(response.body);
    final List result = values['results'];

    if (values["status"] == "OK") {
      // ignore: avoid_print
      print("Ok response");
      for (Map i in result) {
        nearevstationresult.add(NearbyEVStationResults.fromJson(i));
        //print(nearevstationresult);

        //initMarkerr(nearevstationresult[i].geometry!.location!.lat, snap.docs[i].id);
        //add to init marker as well.
      }
      showMarker();
      return nearevstationresult;
    } else {
      // ignore: avoid_print
      print(
          "Oye! Hero Map Key Change Karde thora 2 jagah toh mein places show kardun..");
      print("Kya gunda banega tu?");
      return nearevstationresult;
    }

    // print("Inside getNearby");
    // print("this is result");
    // print(result);
    // print(result.map((e) => NearbyEVStationResults.fromJson(e)).toList());
    //return result.map((e) => NearbyEVStationResults.fromJson(e)).toList();
  }

  void getLocation() {
    Geolocator.getCurrentPosition().then((currrloc) async {
      currentLocation = currrloc;
      // ignore: avoid_print
      print("Got the location");
      await sharedPreferences!.setDouble("lat", currentLocation.latitude);
      await sharedPreferences!.setDouble("long", currentLocation.longitude);
      // ignore: avoid_print
      print(sharedPreferences!.getDouble("lat"));
      // ignore: avoid_print
      print(sharedPreferences!.getDouble("long"));
      print(sharedPreferences!.getDouble("lat"));
      print(sharedPreferences!.getDouble("long"));
      print("getLocation calling nearby");
      populateClients();
      //getSomepoints();
      setState(() {
        mapToggle = true;
        currentLocation = currrloc;
      });
    });
    print("location populat");
  }

  @override
  void initState() {
    super.initState();
    requestPermission();
    getDestinationIcon();
  }

  //TODOS: 3 start

  // @override
  // void dispose() {
  //   super.dispose();
  //   mapController.dispose();
  // }

  //TODOS: 3 end

  @override
  Widget build(BuildContext context) {
    print(routeCoords.length);
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: mapToggle
          ? GoogleMap(
              polylines: Set<Polyline>.of(polyline),
              markers: Set<Marker>.of(markers.values),
              mapType: MapType.normal,
              padding: EdgeInsets.only(
                top: toppading,
                bottom: bottomPadding,
              ),
              // initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: false,
              // onMapCreated: (GoogleMapController controller) async {
              //   _controllerGoogleMap.complete(controller);
              //   newGooglemapcontroller = controller;
              //   locatePosition();
              //   setState(() {
              //     toppading = 100;
              //   });
              //   //locatePosition();
              // },

              onMapCreated: onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  // 40.6782, -73.9442
                  // 22.7855319, 86.2833178,
                  sharedPreferences!.getDouble("lat")!,
                  sharedPreferences!.getDouble("long")!,
                ),
                zoom: 20.0,
                // bearing: 90.0,
                // tilt: 45.0,
              ),
              //trafficEnabled: true,
            )
          : Center(
              child: SpinKitDoubleBounce(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.red : Colors.green,
                    ),
                  );
                },
                size: 120.0,
              ),
            ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  markerrDesign(
      {String? stationname,
      String? stationaddress,
      double? distance,
      double? lat,
      double? long}) {
    @override
        //Widget build(BuildContext context) {
        final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.width * 0.01,
          ),
          Divider(
            thickness: 3,
            color: Colors.grey.shade400,
            indent: size.width * 0.4,
            endIndent: size.width * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    stationname!,
                    //"Tata Steel Ambagan Parking Jubliee Park gate Jamshedpur Charging Station",
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.09,
                ),
                Container(
                  height: 20,
                  width: 60,
                  child: const Center(
                    child: Text(
                      "Public",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Image.asset(
                    "assets/images/aa.png",
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8.0),
            child: Flexible(
              child: Text(
                stationaddress!,
                // "Ambagan, Sakchi, Jamshedpur",
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, top: 8.0),
            height: 20,
            width: 60,
            child: const Center(
              child: Text(
                "Open",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 12,
                ),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      color: Colors.blue,
                      size: 15,
                    ),
                    Text(
                      distance.toString().substring(0, 4) + " km",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 12,
                ),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.solidClock,
                      color: Colors.blue,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "12:00 am - 11:59 pm",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 12, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Available Connectors",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, primary: Colors.red),
                  onPressed: () async {
                    getSomepoints(lat!, long!);
                    Navigator.pop(context);
                    //getSomepoints();
                    // PolylinePoints polylinePoints = PolylinePoints();
                    // PolylineResult result =
                    //     await polylinePoints.getRouteBetweenCoordinates(
                    //   "AIzaSyDimVUJgnRHt3nQzzWJ7njreu8ngsmNVDw",
                    //   PointLatLng(sharedPreferences!.getDouble("lat")!, sharedPreferences!.getDouble("long")!),
                    //   PointLatLng(lat, long),
                    // );
                    // print(result.points);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        // border: const Border(
                        //   top: BorderSide(
                        //     color: Colors.red,
                        //   ),
                        //   right: BorderSide(
                        //     color: Colors.red,
                        //   ),
                        //   left: BorderSide(
                        //     color: Colors.red,
                        //   ),
                        //   bottom: BorderSide(
                        //     color: Colors.red,
                        //   ),
                        // ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Navigation",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: const [
              DesignConnectors(),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.amber,
              ),
              child: const Center(
                child: Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontFamily: "VarelaRound",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
