import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapview extends StatefulWidget {
  const Mapview({super.key});

  @override
  State<Mapview> createState() => _MapviewState();
}

class _MapviewState extends State<Mapview> {
  static const LatLng _pCollege = LatLng(19.383990715930675, 72.82861090602486);
  static const LatLng _pNariman = LatLng(18.92580351541807, 72.81862713761201);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _pCollege, zoom: 17),
        markers: {
          Marker(markerId: MarkerId('_currentLocation'), position: _pCollege),
          Marker(markerId: MarkerId('_currentLocation'), 
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: _pNariman),
        }
        
      ),
    );
  }
}
