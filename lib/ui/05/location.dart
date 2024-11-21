import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StoreMap extends StatelessWidget {
  // Tọa độ vị trí cửa hàng (ví dụ: TP.HCM)
  final LatLng storeLocation = const LatLng(21.0475254, 105.7847463);

  const StoreMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vị trí cửa hàng'),
        ),
        body: FlutterMap(
          options: MapOptions(
              initialCenter: storeLocation,
              initialZoom: 15,
              interactionOptions: const InteractionOptions(
                  flags: ~InteractiveFlag.doubleTapDragZoom)),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            ),
            MarkerLayer(markers: [
              Marker(
                  point: storeLocation,
                  child: const Icon(
                    Icons.location_pin,
                    size: 50,
                    color: Colors.red,
                  ))
            ])
          ],
        ));
  }
}
