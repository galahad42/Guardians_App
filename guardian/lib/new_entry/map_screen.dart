import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //GoogleMapsPlugin().buildViewWithConfiguration(0, (id) { }, widgetConfiguration: MapWidgetConfiguration())
      body:
      GoogleMap(initialCameraPosition: _initialCameraPosition, markers: {
        Marker(
          markerId: const MarkerId("demo"),
          position: const LatLng(37.42796133580664, -122.085749655962),
          draggable: true,
          onDragEnd: (value) {
            //TODO: add the entity
          },
        ),
      }),
    );
  }
}
