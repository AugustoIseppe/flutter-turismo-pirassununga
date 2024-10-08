import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPirassununga extends StatelessWidget {
  const MapaPirassununga({
    super.key,
    required CameraPosition kGooglePlex,
    required Completer<GoogleMapController> controller,
    required this.markerLat,
    required this.markerLong, required this.title,
  })  : _kGooglePlex = kGooglePlex,
        _controller = controller;

  final CameraPosition _kGooglePlex;
  final Completer<GoogleMapController> _controller;
  final double markerLat;
  final double markerLong;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        semanticContainer: true,
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.grey, width: 0.5)),
        child: SizedBox(
        height: 200,
        child: GoogleMap(
          // buildingsEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          // indoorViewEnabled: true,
          markers: {
            Marker(
                markerId: const MarkerId('Pirassununga-SP'),
                position: LatLng(markerLat, markerLong),
                infoWindow: InfoWindow(
                  title: title,
                )),
          },
        ),
                ),
      ),
    );
  }
}
