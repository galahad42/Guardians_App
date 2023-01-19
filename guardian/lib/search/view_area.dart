import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewArea {
  String name;
  List<LatLng> points;
  Map<String, int> diseaseToPatientNo;
  ViewArea({
    this.name = "",
    this.points = const[],
    this.diseaseToPatientNo = const{},
  });
  ViewArea fromJson(Map<String, dynamic> str) => ViewArea(
        diseaseToPatientNo: str["disease"] as Map<String, int>,
        name: str["name"],
        points: (str["points"] as List<GeoPoint>)
            .map((e) => LatLng(e.latitude, e.longitude))
            .toList(),
      );
}
