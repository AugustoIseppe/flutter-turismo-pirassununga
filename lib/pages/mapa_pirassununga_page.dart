import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPirassunungaPage extends StatefulWidget {
  const MapaPirassunungaPage({super.key});

  @override
  State<MapaPirassunungaPage> createState() => _MapaPirassunungaPageState();
}

class _MapaPirassunungaPageState extends State<MapaPirassunungaPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  //latitude            //longitude
  //-21.99674234912524, -47.427033597259324

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(-21.99674234912524, -47.427033597259324),
    zoom: 13.4746,
    bearing: 0,
    tilt: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Localização', style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: ClipOval(
              child: Container(
                color: Colors.white,
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.only(right: 2.0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 17,
                    color: Colors.black,
                  ),
                )),
              ),
            )),
      ),
      body: GoogleMap(
          // buildingsEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          // indoorViewEnabled: true,
          markers: {
            const Marker(
                markerId: MarkerId('Pirassununga-SP'),
                position: LatLng(-21.99674234912524, -47.427033597259324),
                infoWindow: InfoWindow(
                  title: 'Pirassununga',
                )),
          },
        ),
    );
  }
}
