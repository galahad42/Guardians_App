import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guardian/search/view_area.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

Set<Polygon> areas = {};

class _SearchState extends State<Search> {
  final _initialCameraPosition = CameraPosition(
      target: LatLng(28.667846270467965, 77.38681485285134), zoom: 15);
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        polygons: areas,
      ),
    );
  }

  getData() async {
    areas = {};
    log(areas.length.toString());
    await FirebaseFirestore.instance.collection('view').get().then(
      (querySnapshot) {
        for (var result in querySnapshot.docs) {
          var data = result.data();
          Polygon p = Polygon(
            polygonId: PolygonId(data['name']),
            points: (data['points'] as List<dynamic>).map(
              (e) {
                // log("${e.latitude} ${e.longitude}");
                return LatLng(e.latitude, e.longitude);
              },
            ).toList(),
          );
          log(p.polygonId.toString());
          log(p.points.toString());
          log(areas.length.toString());
          areas.add(p);
        }
      },
    );
  }
}
