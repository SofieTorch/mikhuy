import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mikhuy/models/models.dart';
import 'package:mikhuy/seller_page.dart';

class GoogleMapsBuilder extends StatelessWidget {
  GoogleMapsBuilder({Key? key}) : super(key: key);

  final sellersRef =
      FirebaseFirestore.instance.collection('seller').withConverter<Seller>(
            fromFirestore: (snapshots, _) => Seller.fromJson(
              snapshots.data()!,
              snapshots.id,
            ),
            toFirestore: (seller, _) => seller.toJson(),
          );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sellersRef.get(),
      builder: (_, AsyncSnapshot<QuerySnapshot<Seller>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Ocurrio un error inesperado :('),
          );
        }

        if (snapshot.hasData) {
          final sellers = snapshot.data!.docs.map((e) => e.data()).toList();
          return _GoogleMapsView(sellers);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _GoogleMapsView extends StatelessWidget {
  _GoogleMapsView(this.sellers, {Key? key}) : super(key: key);

  final List<Seller> sellers;

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
    return GoogleMap(
      markers: _getmarkers(context),
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initialPosition,
    );
  }

  Set<Marker> _getmarkers(BuildContext context) {
    return sellers
        .map((e) => Marker(
            markerId: MarkerId(e.id),
            position: LatLng(e.latitude, e.longitude),
            infoWindow: InfoWindow(title: e.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SellerPage(e)),
              );
            }
            ))
        .toSet();
  }
}
