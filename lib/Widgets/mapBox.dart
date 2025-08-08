import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapBoxScreen extends StatefulWidget {
  const MapBoxScreen({super.key});

  @override
  State<MapBoxScreen> createState() => _MapBoxScreenState();
}

class _MapBoxScreenState extends State<MapBoxScreen> {
  MapboxMap? mapboxMap;

  @override
  void dispose() {
    mapboxMap?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mapbox Flutter Example")),
      body: MapWidget(
        onMapCreated: onMapCreated,
        styleUri: MapboxStyles.STANDARD, // or your custom style URL
      ),
    );
  }

  void onMapCreated(MapboxMap mapboxMap) async {
    setState(() => this.mapboxMap = mapboxMap);

    // Define the target location (San Francisco)
    final newCameraOptions = CameraOptions(
      center: Point(
        coordinates: Position(-122.4194, 37.7749), // Longitude, Latitude
      ).toJson(),
      zoom: 12.0,
    );

    // Fly to the location
    await mapboxMap.setCamera(newCameraOptions);
  }
}
