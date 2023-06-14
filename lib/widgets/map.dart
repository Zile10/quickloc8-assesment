import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// JSON
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MapState();
}

class _MapState extends State<MyMap> {
  List<Marker> markers = [];

  Future<void> parseJsonData() async {
    final jsonString = await rootBundle.loadString('assets/vehicleCoordinates.json');
    final data = json.decode(jsonString);

    for (var item in data) {
      final latitude = item['latitude'].toString();
      final longitude = item['longitude'].toString();
      final heading = double.parse(item['heading'].toString());

      final marker = Marker(
        point: LatLng(double.parse(latitude), double.parse(longitude)),
        width: 40,
        height: 40,
        builder: (context) => Transform.rotate(
          angle: heading, // rotation in 90 degree increments
          child: Image.asset(
            'assets/ic_new_white_taxi.png'
          ),
        )       
      );
      markers.add(marker);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    parseJsonData();

    return FlutterMap(
      options: MapOptions(
        center: const LatLng(-32.0461583, 23.5),
        zoom: 5.8,
      ),
      nonRotatedChildren: [
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(markers: markers),
      ],
    );
  }
}
