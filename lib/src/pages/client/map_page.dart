import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(-7.1518979, -78.5072211);
  LatLng? _currentPos;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journey'),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 32,
              )),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle_rounded, size: 48))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Draw header'))
          ],
        ),
      ),
      body: _currentPos == null
          ? const Center(
              child: Text("Loading..."),
            )
          : GoogleMap(
              initialCameraPosition:
                  const CameraPosition(target: _pGooglePlex, zoom: 18),
              markers: {
                Marker(
                    markerId: const MarkerId("_currentLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _currentPos!),
                const Marker(
                    markerId: MarkerId("_destLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex)
              },
            ),
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition newCameraPosition = CameraPosition(
      target: pos,
      zoom: 13,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    PermissionStatus permissionGranted;
    bool serviceEnabled;

    serviceEnabled = await _locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentPos =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentPos!);
        });
      }
    });
  }

  void openDrawer() {}
}
