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

class _SearchState extends State<Search> {
  final _initialCameraPosition = CameraPosition(
      target: LatLng(28.667846270467965, 77.38681485285134), zoom: 15);
  List<ViewArea> areas = [];
  @override
  void initState() {
    super.initState();
    getData();
    areas.map((e) => log(e.points.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        // polygons: ,
      ),
    );
  }

  getData() async {
    log(areas.length.toString());
    await FirebaseFirestore.instance
        .collection('view')
        .get()
        .then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        log(result.data().toString());
        ViewArea v = ViewArea().fromJson(result.data());
        areas.add(v);
      }
    }).then((value) => log(areas.length.toString()));
  }
}
