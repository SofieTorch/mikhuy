import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();
  final _initialPosition = const CameraPosition(
    target: LatLng(-17.3948389, -66.1851266),
    zoom: 15,
  );

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps in Flutter'),
        centerTitle: true,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialPosition,
      ),
    );
  }
}
